-- SQL Admin Cmds for stuff relating to zip code editing. 
-- -- For my records and copying in similar future processes in pg_admin

UPDATE adminareas.us_zips_poly 
SET geomcent = ST_Centroid(geom),
latitude = ST_Y(ST_Centroid(geom)),
longitude = ST_X(ST_Centroid(geom));

CREATE INDEX geom_idx ON adminareas.us_zips_poly USING gist (geom);
CREATE INDEX lat_idx ON adminareas.us_zips_poly USING btree (latitude);
CREATE INDEX lon_idx ON adminareas.us_zips_poly USING btree (longitude);
CREATE INDEX cent_geom_idx ON adminareas.us_zips_poly USING gist (geomcent);
CREATE INDEX zip_poly_idx ON adminareas.us_zips_poly USING btree (zip);

CREATE INDEX zip_latlon_idx ON adminareas.us_zips_latlon USING btree (zip);
CREATE INDEX geocode_pt_idx ON adminareas.us_zips_latlon USING gist (geocodepoint);

CREATE INDEX misszip_idx ON skratch.utix_zips_notinlatlonorpoly USING btree (missedzip5);


GRANT SELECT ON ALL TABLES IN SCHEMA skratch, adminareas TO alexuser;


ALTER TABLE adminareas.us_zips_latlon DROP COLUMN IF EXISTS polygeom_from_zippoly CASCADE;

ALTER TABLE adminareas.us_zips_latlon ADD COLUMN IF NOT EXISTS polygeom_from_zippoly geometry;

UPDATE adminareas.us_zips_latlon ll
SET polygeom_from_zippoly = plytb.geom
FROM adminareas.us_zips_poly plytb
WHERE ll.zip = plytb.zip
;  -- Query returned successfully in 2 secs.


--  For those polys that didn't have an exact zip-zip intertable match, update the polygeom_from_zippoly field by spatial intersection
UPDATE adminareas.us_zips_latlon ll
SET polygeom_from_zippoly = plytb.geom
FROM adminareas.us_zips_poly plytb
WHERE 
ll.polygeom_from_zippoly IS NULL
AND ST_Intersects(ll.geocodepoint,plytb.geom)
; -- 1 sec run

------------------------------------

DROP TABLE IF EXISTS skratch.missingzips_batchgeo3 CASCADE;
CREATE TABLE IF NOT EXISTS skratch.missingzips_batchgeo3
(xmladdress varchar,
xmllat varchar,
xmllon varchar)
;

GRANT SELECT ON ALL TABLES IN SCHEMA skratch, adminareas TO alexuser;

CREATE TABLE skratch.utix_zips_notinlatlonorpoly_wgeoms AS
SELECT 
CONCAT(targettable.missedzip5, ' ', targettable.city, ' ', 
	   targettable.province_or_state,' ', 
	   targettable.missedzip5) AS concataddr,
targettable.* 
, comparetable.*
-- -- targettable.zip5, targettable.province_or_state, targettable.city
FROM 
skratch.utix_zips_notinlatlonorpoly targettable  
-- skratch.missingzips_batchgeo3 targettable
left 
-- inner 
join skratch.missingzips_batchgeo3 comparetable 
-- using (targettable.country_na, comparetable.lsib_name)
on 
-- cast(
	CONCAT(targettable.missedzip5, ' ', targettable.city, ' ', 
	   targettable.province_or_state,' ', 
	   targettable.missedzip5)--, ' ')
-- 	as text)
	= 
	comparetable.xmladdress
;

ALTER TABLE skratch.utix_zips_notinlatlonorpoly_wgeoms
RENAME COLUMN xmllat TO xmllong;

ALTER TABLE skratch.utix_zips_notinlatlonorpoly_wgeoms
RENAME COLUMN xmllon TO xmllatt;

ALTER TABLE skratch.utix_zips_notinlatlonorpoly_wgeoms
RENAME COLUMN xmllong TO xmllon;

ALTER TABLE skratch.utix_zips_notinlatlonorpoly_wgeoms
RENAME COLUMN xmllatt TO xmllat;


-- -- Manually insert values into 11 of missing 13
-- SELECT * FROM
UPDATE
skratch.utix_zips_notinlatlonorpoly_wgeoms
SET
xmllat = 35.002861
,
xmllon= 137.017789

WHERE concataddr LIKE '%SW1P%London%LA%SW1P%'
-- '%Kariya%'
;
GRANT SELECT ON ALL TABLES IN SCHEMA skratch, adminareas TO alexuser;

-- geocode the new lat lons
ALTER TABLE skratch.utix_zips_notinlatlonorpoly_wgeoms
DROP COLUMN IF  EXISTS regeocode_geom;

ALTER TABLE skratch.utix_zips_notinlatlonorpoly_wgeoms
ADD COLUMN IF NOT EXISTS regeocode_ptgeom geometry;

UPDATE skratch.utix_zips_notinlatlonorpoly_wgeoms
SET regeocode_ptgeom = ST_SetSRID(ST_MakePoint(CAST(xmllon AS double precision),
											 CAST(xmllat AS double precision)), 
								4326)
;

CREATE INDEX IF NOT EXISTS missingptidx 
ON skratch.utix_zips_notinlatlonorpoly_wgeoms 
USING gist (regeocode_ptgeom);


-- Connect point geoms to poly geoms
ALTER TABLE skratch.utix_zips_notinlatlonorpoly_wgeoms
ADD COLUMN IF NOT EXISTS linkpolygeom geometry;

--  update the linkpolygeom field by spatial intersection
UPDATE skratch.utix_zips_notinlatlonorpoly_wgeoms miss
SET linkpolygeom = plytb.geom
FROM adminareas.us_zips_poly plytb
WHERE 
miss.linkpolygeom IS NULL
AND ST_Intersects(miss.regeocode_ptgeom,plytb.geom)
; -- 1 sec run

CREATE INDEX IF NOT EXISTS missing_polyidx 
ON skratch.utix_zips_notinlatlonorpoly_wgeoms 
USING gist (linkpolygeom);

GRANT SELECT ON ALL TABLES IN SCHEMA skratch, adminareas TO alexuser;




