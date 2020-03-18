-- Upload data from 2014 UTK Tickets
CREATE TABLE ehc_sec.utix_14_sesn(
	game varchar(6),
	qty int,
	mailcity text,
	state text,
	zip varchar
);
CREATE TABLE ehc_sec.utix_14_snglgm(
	game varchar(6),
	qty int,
	mailcity text,
	state text,
	zip varchar
);
GRANT SELECT ON ALL TABLES IN SCHEMA ehc_sec TO alexuser;

-- manually upload date into tables from CSVs

-- Copy for editing
CREATE TABLE ehc_sec.utix_14_sesn_edit AS SELECT * FROM ehc_sec.utix_14_sesn;
CREATE TABLE ehc_sec.utix_14_snglgm_edit AS SELECT * FROM ehc_sec.utix_14_snglgm;
GRANT SELECT ON ALL TABLES IN SCHEMA ehc_sec TO alexuser;

-- Fix Zip Codes on edit tables
-- see other tix editing .sql files for the code for this. 

ALTER TABLE ehc_sec.utix_14_sesn_edit ADD COLUMN zip5_14sesn varchar(5);
UPDATE ehc_sec.utix_14_sesn_edit
SET zip5_14sesn = LPAD(zip::varchar(5), 5, '0');

ALTER TABLE ehc_sec.utix_14_snglgm_edit ADD COLUMN zip5_14sngl varchar(5);
UPDATE ehc_sec.utix_14_snglgm_edit
SET zip5_14sngl = LPAD(zip::varchar(5), 5, '0');

-- Joining spatial and Ticketing data work alexadmin PSQL Queries

CREATE INDEX IF NOT EXISTS zip5_14sesn_idx 
ON ehc_sec.utix_14_sesn_edit
USING btree (zip5_14sesn);
--GRANT SELECT ON ALL TABLES IN SCHEMA skratch, adminareas, tickets, ehc_sec TO alexuser;
CREATE INDEX IF NOT EXISTS zip5_14sngl_idx 
ON ehc_sec.utix_14_snglgm_edit
USING btree (zip5_14sngl);
GRANT SELECT ON ALL TABLES IN SCHEMA skratch, adminareas, tickets, ehc_sec TO alexuser;

-- Add spatial columns to editing tix table
ALTER TABLE ehc_sec.utix_14_sesn_edit
DROP COLUMN IF  EXISTS ptgeom;
ALTER TABLE ehc_sec.utix_14_snglgm_edit
DROP COLUMN IF  EXISTS ptgeom;

ALTER TABLE ehc_sec.utix_14_sesn_edit
ADD COLUMN IF NOT EXISTS ptgeom geometry;
ALTER TABLE ehc_sec.utix_14_snglgm_edit
ADD COLUMN IF NOT EXISTS ptgeom geometry;

ALTER TABLE ehc_sec.utix_14_snglgm_edit
ADD COLUMN IF NOT EXISTS polygeom geometry;

ALTER TABLE ehc_sec.utix_14_snglgm_edit
ADD COLUMN IF NOT EXISTS lat double precision;

ALTER TABLE ehc_sec.utix_14_snglgm_edit
ADD COLUMN IF NOT EXISTS lon double precision;

ALTER TABLE ehc_sec.utix_14_sesn_edit
ADD COLUMN IF NOT EXISTS polygeom geometry;

ALTER TABLE ehc_sec.utix_14_sesn_edit
ADD COLUMN IF NOT EXISTS lat double precision;

ALTER TABLE ehc_sec.utix_14_sesn_edit
ADD COLUMN IF NOT EXISTS lon double precision;
---------------------------------

--  update the target field by cross-table query
UPDATE ehc_sec.utix_14_sesn_edit tixtab
SET polygeom = compareziptab.geom
FROM adminareas.us_zips_poly compareziptab
WHERE 
tixtab.polygeom IS NULL
AND tixtab.zip5_14sesn = compareziptab.zip
--ST_Intersects(miss.regeocode_ptgeom,plytb.geom)
; -- 15 sec run
UPDATE ehc_sec.utix_14_snglgm_edit tixtab
SET polygeom = compareziptab.geom
FROM adminareas.us_zips_poly compareziptab
WHERE 
tixtab.polygeom IS NULL
AND tixtab.zip5_14sngl = compareziptab.zip
;

--  update other target fields by cross-table query too
-- Centroid point
UPDATE ehc_sec.utix_14_sesn_edit tixtab
SET ptgeom = compareziptab.geomcent
FROM adminareas.us_zips_poly compareziptab
WHERE 
tixtab.ptgeom IS NULL
AND tixtab.zip5_14sesn = compareziptab.zip
;
UPDATE ehc_sec.utix_14_snglgm_edit tixtab
SET ptgeom = compareziptab.geomcent
FROM adminareas.us_zips_poly compareziptab
WHERE 
tixtab.ptgeom IS NULL
AND tixtab.zip5_14sngl = compareziptab.zip
;
--  Latitude
UPDATE ehc_sec.utix_14_sesn_edit tixtab
SET lat = compareziptab.latitude
FROM adminareas.us_zips_poly compareziptab
WHERE 
tixtab.lat IS NULL
AND tixtab.zip5_14sesn = compareziptab.zip
;
UPDATE ehc_sec.utix_14_snglgm_edit tixtab
SET lat = compareziptab.latitude
FROM adminareas.us_zips_poly compareziptab
WHERE 
tixtab.lat IS NULL
AND tixtab.zip5_14sngl = compareziptab.zip
;
--  Longitude
UPDATE ehc_sec.utix_14_sesn_edit tixtab
SET lon = compareziptab.longitude
FROM adminareas.us_zips_poly compareziptab
WHERE 
tixtab.lon IS NULL
AND tixtab.zip5_14sesn = compareziptab.zip
;
UPDATE ehc_sec.utix_14_snglgm_edit tixtab
SET lon = compareziptab.longitude
FROM adminareas.us_zips_poly compareziptab
WHERE 
tixtab.lon IS NULL
AND tixtab.zip5_14sngl = compareziptab.zip
;



--  FILL 675+1070 BLANKS WITH PT ZIP ADMIN TABLE INFO
UPDATE ehc_sec.utix_14_sesn_edit tixtab
SET polygeom = compareziptab.polygeom_from_zippoly
FROM adminareas.us_zips_latlon compareziptab
WHERE 
tixtab.polygeom IS NULL
AND tixtab.zip5_14sesn = compareziptab.zip
; -- __ sec run
UPDATE ehc_sec.utix_14_snglgm_edit tixtab
SET polygeom = compareziptab.polygeom_from_zippoly
FROM adminareas.us_zips_latlon compareziptab
WHERE 
tixtab.polygeom IS NULL
AND tixtab.zip5_14sngl = compareziptab.zip
;

--  update other target fields by cross-table query too
-- Centroid point
UPDATE ehc_sec.utix_14_sesn_edit tixtab
SET ptgeom = compareziptab.geocodepoint
FROM adminareas.us_zips_latlon compareziptab
WHERE 
tixtab.ptgeom IS NULL
AND tixtab.zip5_14sesn = compareziptab.zip
;
UPDATE ehc_sec.utix_14_snglgm_edit tixtab
SET ptgeom = compareziptab.geocodepoint
FROM adminareas.us_zips_latlon compareziptab
WHERE 
tixtab.ptgeom IS NULL
AND tixtab.zip5_14sngl = compareziptab.zip
;
--  Latitude
UPDATE ehc_sec.utix_14_sesn_edit tixtab
SET lat = compareziptab.latitude
FROM adminareas.us_zips_latlon compareziptab
WHERE 
tixtab.lat IS NULL
AND tixtab.zip5_14sesn = compareziptab.zip
;
UPDATE ehc_sec.utix_14_snglgm_edit tixtab
SET lat = compareziptab.latitude
FROM adminareas.us_zips_latlon compareziptab
WHERE 
tixtab.lat IS NULL
AND tixtab.zip5_14sngl = compareziptab.zip
;
--  Longitude
UPDATE ehc_sec.utix_14_sesn_edit tixtab
SET lon = compareziptab.longitude
FROM adminareas.us_zips_latlon compareziptab
WHERE 
tixtab.lon IS NULL
AND tixtab.zip5_14sesn = compareziptab.zip
;
UPDATE ehc_sec.utix_14_snglgm_edit tixtab
SET lon = compareziptab.longitude
FROM adminareas.us_zips_latlon compareziptab
WHERE 
tixtab.lon IS NULL
AND tixtab.zip5_14sngl = compareziptab.zip
;

--  Use 15-18 tix tab to fix some of these
UPDATE ehc_sec.utix_14_sesn_edit tixtab
SET ptgeom = compareziptab.ptgeom,
polygeom = compareziptab.polygeom,
lat = compareziptab.lat,
lon = compareziptab.lon
FROM tickets.edit_utk_football_2015to18_tickets_all compareziptab
WHERE 
tixtab.ptgeom IS NULL
AND tixtab.zip5_14sesn = compareziptab.zip5
;
UPDATE ehc_sec.utix_14_snglgm_edit tixtab
SET ptgeom = compareziptab.ptgeom,
polygeom = compareziptab.polygeom,
lat = compareziptab.lat,
lon = compareziptab.lon
FROM tickets.edit_utk_football_2015to18_tickets_all compareziptab
WHERE 
tixtab.ptgeom IS NULL
AND tixtab.zip5_14sngl = compareziptab.zip5
;

--Manually fix last of the season tix outstandings
UPDATE ehc_sec.utix_14_sesn_edit
SET zip5_14sesn = '32408' 
-- blank out the other geography fields so the fill query will refresh them
, ptgeom = NULL,polygeom=NULL,lat = NULL,lon = NULL
WHERE
zip5_14sesn= '32411';
UPDATE ehc_sec.utix_14_sesn_edit
SET zip5_14sesn = '89123' --las vegas
-- blank out the other geography fields so the fill query will refresh them
, ptgeom = NULL,polygeom=NULL,lat = NULL,lon = NULL
WHERE
zip5_14sesn= '89183';

-- these zips not in snglgm so no need to fix.

--  Use 15-18 tix tab to fix some of these
UPDATE ehc_sec.utix_14_sesn_edit tixtab
SET ptgeom = compareziptab.ptgeom,
polygeom = compareziptab.polygeom,
lat = compareziptab.lat,
lon = compareziptab.lon
FROM tickets.edit_utk_football_2015to18_tickets_all compareziptab
WHERE 
tixtab.ptgeom IS NULL
AND tixtab.zip5_14sesn = compareziptab.zip5
;
UPDATE ehc_sec.utix_14_snglgm_edit tixtab
SET ptgeom = compareziptab.ptgeom,
polygeom = compareziptab.polygeom,
lat = compareziptab.lat,
lon = compareziptab.lon
FROM tickets.edit_utk_football_2015to18_tickets_all compareziptab
WHERE 
tixtab.ptgeom IS NULL
AND tixtab.zip5_14sngl = compareziptab.zip5
;

-- 0 nulls in season tix!

-- mnaual geocoding of missing snglgm. download as KML. 
-- KML --> XML --> CSV --> PSQL scratch --> my data
CREATE TABLE IF NOT EXISTS skratch.missingzips14_batchgeo1(
	concat_addr varchar,
	lon double precision,
	lat double precision,
	z varchar(1)
);

GRANT SELECT ON ALL TABLES IN SCHEMA skratch, adminareas, tickets, ehc_sec TO alexuser;

-- Get Lat & Lon into the table
UPDATE ehc_sec.utix_14_snglgm_edit tixtab
SET
lat = compareziptab.lat,
lon = compareziptab.lon
FROM skratch.missingzips14_batchgeo1 compareziptab
WHERE 
tixtab.ptgeom IS NULL
AND CONCAT(tixtab.mailcity, ' ', tixtab.state, ' ', tixtab.zip5_14sngl) = compareziptab.concat_addr
; -- 46/49 match

-- Create point geom based on lat & LONG
UPDATE ehc_sec.utix_14_snglgm_edit 
SET ptgeom = ST_SetSRID(ST_MakePoint(lon, lat),4326)
WHERE ptgeom IS NULL

-- Connect new USA points to polys
UPDATE ehc_sec.utix_14_snglgm_edit edittab
SET edittab.polygeom = plytb.geom
FROM adminareas.us_zips_poly plytb
WHERE edittab.polygeom IS NULL
AND ST_Intersects(edittab.ptgeom,plytb.geom)
;


-- Merge Single Game and Season Tickets with same format as Fy15-18
CREATE TABLE tickets.utix_14_all_edit AS SELECT
zip5_14sesn AS zip5,
-- CONCAT('F14-', game) 
'F14-F01'
	as event_code, 
-- * 
'season' as price_type_name,
qty as count_seat_id,
mailcity as city,
state as province_or_state,
zip as postal_code,
ptgeom, polygeom, lat, lon

FROM ehc_SEC.utix_14_sesn_edit


UNION ALL
SELECT 
zip5_14sesn AS zip5,
-- CONCAT('F14-', game) 
'F14-F02'
	as event_code, 
'season' as price_type_name,
qty as count_seat_id,
mailcity as city,
state as province_or_state,
zip as postal_code,
ptgeom, polygeom, lat, lon
FROM ehc_SEC.utix_14_sesn_edit

UNION ALL
SELECT 
zip5_14sesn AS zip5,
-- CONCAT('F14-', game) 
'F14-F03'
	as event_code, 
'season' as price_type_name,
qty as count_seat_id,
mailcity as city,
state as province_or_state,
zip as postal_code,
ptgeom, polygeom, lat, lon
FROM ehc_SEC.utix_14_sesn_edit

UNION ALL
SELECT 
zip5_14sesn AS zip5,
-- CONCAT('F14-', game) 
'F14-F04'
	as event_code, 
'season' as price_type_name,
qty as count_seat_id,
mailcity as city,
state as province_or_state,
zip as postal_code,
ptgeom, polygeom, lat, lon
FROM ehc_SEC.utix_14_sesn_edit

UNION ALL
SELECT 
zip5_14sesn AS zip5,
-- CONCAT('F14-', game) 
'F14-F05'
	as event_code, 
'season' as price_type_name,
qty as count_seat_id,
mailcity as city,
state as province_or_state,
zip as postal_code,
ptgeom, polygeom, lat, lon
FROM ehc_SEC.utix_14_sesn_edit

UNION ALL
SELECT 
zip5_14sesn AS zip5,
-- CONCAT('F14-', game) 
'F14-F06'
	as event_code, 
'season' as price_type_name,
qty as count_seat_id,
mailcity as city,
state as province_or_state,
zip as postal_code,
ptgeom, polygeom, lat, lon
FROM ehc_SEC.utix_14_sesn_edit

UNION ALL
SELECT 
zip5_14sesn AS zip5,
-- CONCAT('F14-', game) 
'F14-F07'
	as event_code, 
'season' as price_type_name,
qty as count_seat_id,
mailcity as city,
state as province_or_state,
zip as postal_code,
ptgeom, polygeom, lat, lon
FROM ehc_SEC.utix_14_sesn_edit

-- single game time now
UNION ALL
SELECT 
zip5_14sngl AS zip5,
CONCAT('F14-', game) 
-- 'F14-F02'
	as event_code, 
'single game' as price_type_name,
qty as count_seat_id,
mailcity as city,
state as province_or_state,
zip as postal_code,
ptgeom, polygeom, lat, lon
FROM ehc_SEC.utix_14_snglgm_edit
;

GRANT SELECT ON ALL TABLES IN SCHEMA skratch, adminareas, tickets, ehc_sec TO alexuser;

CREATE INDEX IF NOT EXISTS fy14_ptgeom_idx 
ON tickets.utix_14_all_edit
USING gist (ptgeom);

CREATE INDEX IF NOT EXISTS fy14_polygeom_idx 
ON tickets.utix_14_all_edit
USING gist (polygeom);

CREATE INDEX IF NOT EXISTS fy14_zip5_idx 
ON tickets.utix_14_all_edit
USING btree (zip5);

CREATE INDEX IF NOT EXISTS fy14_eventcode_idx 
ON tickets.utix_14_all_edit
USING btree (event_code);

CREATE INDEX IF NOT EXISTS fy14_tixtot_idx 
ON tickets.utix_14_all_edit
USING btree (count_seat_id);


-- Now union all the 14 + 15-18 tables.
-- select out only the columns I need from 15-18 ie leave out primary key. Add primary key after
CREATE TABLE tickets.utix_14to18_all_edit AS 
SELECT
*
FROM tickets.utix_14_all_edit

UNION ALL
SELECT 
zip5,event_code, price_type_name,count_seat_id,city,province_or_state,postal_code,ptgeom, polygeom, lat, lon
FROM tickets.edit_utk_football_2015to18_tickets_all; -- 23 second run
GRANT SELECT ON ALL TABLES IN SCHEMA skratch, adminareas, tickets, ehc_sec TO alexuser;

-- Now add primary key
ALTER TABLE tickets.utix_14to18_all_edit ADD COLUMN tixall_id SERIAL PRIMARY KEY; -- 23 sec run

-- now index everything. 
CREATE INDEX IF NOT EXISTS fy14to18_ptgeom_idx 
ON tickets.utix_14to18_all_edit
USING gist (ptgeom);

CREATE INDEX IF NOT EXISTS fy14to18_polygeom_idx 
ON tickets.utix_14to18_all_edit
USING gist (polygeom);

CREATE INDEX IF NOT EXISTS fy14to18_zip5_idx 
ON tickets.utix_14to18_all_edit
USING btree (zip5);

CREATE INDEX IF NOT EXISTS fy14to18_eventcode_idx 
ON tickets.utix_14to18_all_edit
USING btree (event_code);

CREATE INDEX IF NOT EXISTS fy14to18_tixtot_idx 
ON tickets.utix_14to18_all_edit
USING btree (count_seat_id);

CREATE INDEX IF NOT EXISTS fy14to18_type_idx 
ON tickets.utix_14to18_all_edit
USING btree (price_type_name);

CREATE INDEX IF NOT EXISTS fy14to18_city_idx 
ON tickets.utix_14to18_all_edit
USING btree (city);

CREATE INDEX IF NOT EXISTS fy14to18_state_idx 
ON tickets.utix_14to18_all_edit
USING btree (province_or_state);
--all indexes took 15 seconds

-- Congrats! You've got half a decade of UTK tix data!
