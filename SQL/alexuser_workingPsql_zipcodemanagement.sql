-- select 
-- -- *
-- sum(tennessee_14)  -- TN SesnTix
-- -- sum(tennesseefoundation_14)  -- TN Donats 14
-- FROM 
-- ehc_sec.ehcsec_alltixdonats

-- WHERE
-- tennessee_14 
-- -- tennesseefoundation_14
-- is not null

-- -- LIMIT 11
-- SELECT ST_SetSRID(ST_MakePoint(-122.298914, 37.812204),4326);
-- SELECT ST_SetSRID(ST_MakePoint(-71, 42),4326);
-- SELECT ST_SetSRID(ST_MakePoint(-71.1043443253471, 42.3150676015829),4326);  --Sam adams brew

-- -----------------------
-- SELECT 
-- -- -- ST_SetSRID(ST_MakePoint(longitude, latitude),4326) as geocodedpoint-- geocoded addresses from lat lon
-- -- -- , ST_Intersects
-- -- ll.geocodepoint, 
-- -- ply.geom as newpolygeom,
-- ST_Within(ll.geocodepoint,ll.polygeom_from_zippoly),--ply.geom),
-- -- count(ll.*)
-- ll.*
-- FROM adminareas.us_zips_latlon ll--, adminareas.us_zips_poly ply--
-- WHERE 
-- -- ll.zip LIKE '%24327%' 
-- -- AND ST_Intersects(ll.geocodepoint,ply.geom)
-- -- po_name LIKE 'Ayer'
-- ll.polygeom_from_zippoly IS NULL
-- -- AND ST_Within(ll.geocodepoint,ll.polygeom_from_zippoly) is false -- ST_Within(ll.geocodepoint,ply.geom)-- LIKE '%false%'
-- -- LIMIT 11
-- ORDER BY ll.state , ll.zip, ll.city
------------------------------------

-- SELECT 
-- -- geom,
-- -- ST_Centroid(geom) as centroid,
-- -- ST_AsText(ST_Centroid(geom)) as latlon,
-- -- ST_X(ST_Centroid(geom)) as lon,
-- -- ST_Y(ST_Centroid(geom)) as lat,
-- *
-- FROM adminareas.us_zips_poly
-- -- -- WHERE 
-- -- -- ll.zip LIKE '%24327%' 

-- LIMIT 11
------------------------------------

-- -- select the rows of target table that are not in compare table comparing multiple columns
-- SELECT 
-- targettable.*, 
-- comparetable.*
-- FROM tickets.edit_utk_football_2015to18_tickets_all targettable
-- left 
-- -- inner 
-- join adminareas.us_zips_latlon comparetable 
-- -- using (targettable.country_na, comparetable.lsib_name)
-- on 
-- -- cast(
-- 	targettable.zip5
-- -- 	as text)
-- 	= comparetable.zip
-- WHERE 
-- -- order by 
-- comparetable.zip
-- IS  NULL
-- AND targettable.postal_code IS NOT NULL
-- ORDER BY length(targettable.postal_code), targettable.postal_code, targettable.event_code
-- -- NULLs first

-- --------------------------------------------------------
-- -- select the rows of target table that are not in compare table comparing multiple columns
-- -- how many zips in the zip poly are not in the zip latlon?
-- SELECT 
-- -- LPAD(targettable.postal_code::varchar(5), 5, '0') as zip5,
-- -- st_intersects()
-- targettable.*
-- -- ,ST_AsText(ST_Centroid(comparetable.geom))
-- ,comparetable.*
-- FROM adminareas.us_zips_latlon targettable
-- left 
-- -- inner 
-- join adminareas.us_zips_poly comparetable 
-- -- using (targettable.country_na, comparetable.lsib_name)
-- on 
-- -- cast(
-- 	targettable.zip
-- -- 	as text)
-- 	= comparetable.zip
-- WHERE 
-- -- order by 
-- comparetable.zip
-- IS  NULL
-- AND targettable.zip = '24327'
-- -- AND targettable.zip IS NOT NULL
-- -- NULLs first
-- ORDER BY targettable.state, targettable.zip
-- LIMIT 11

-- -------------------------------------------------------------------------
-- -- select the rows of target table that are not in compare table comparing multiple columns
-- -- How many rows in uttix data are not in latlon zips but are in poly zips?
-- -- 927 in neither, 2,017 in poly not in latlon
-- SELECT 
-- CONCAT(targettable.missedzip5, ' ', targettable.city, ' ', 
-- 	   targettable.province_or_state,' ', 
-- 	   targettable.missedzip5) AS concataddr,
-- targettable.* 
-- , comparetable.*
-- -- -- targettable.zip5, targettable.province_or_state, targettable.city
-- FROM 
-- skratch.utix_zips_notinlatlonorpoly targettable  
-- -- skratch.missingzips_batchgeo3 targettable
-- left 
-- -- inner 
-- join skratch.missingzips_batchgeo3 comparetable 
-- -- using (targettable.country_na, comparetable.lsib_name)
-- on 
-- -- cast(
-- 	CONCAT(targettable.missedzip5, ' ', targettable.city, ' ', 
-- 	   targettable.province_or_state,' ', 
-- 	   targettable.missedzip5)--, ' ')
-- -- 	as text)
-- 	= 
-- 	comparetable.xmladdress
-- -- --	CONCAT(comparetable.xmladdress, ' ')
-- WHERE 
-- -- order by 
-- comparetable.xmladdress
-- IS NOT NULL
-- -- AND targettable.postal_code IS NOT NULL
-- -- -- GROUP BY targettable.zip5 ,targettable.province_or_state, targettable.city
-- -- order by targettable.zip5

---------------------------------------------
SELECT 
ST_SetSRID(ST_MakePoint(CAST(xmllon AS double precision),
						CAST(xmllat	AS double precision)), 
		   4326),
CAST(xmllon AS double precision),
* 
FROM skratch.utix_zips_notinlatlonorpoly_wgeoms
WHERE 
xmladdress IS NULL

