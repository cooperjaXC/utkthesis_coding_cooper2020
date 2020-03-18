CREATE SCHEMA IF NOT EXISTS tickets;

GRANT USAGE on SCHEMA tickets TO alexuser;

DROP TABLE IF EXISTS tickets.og_utk_football_new14and19_tickets_all CASCADE;

CREATE TABLE IF NOT EXISTS tickets.og_utk_football_new14and19_tickets_all(
    psql_id serial  PRIMARY KEY, 
	event_code text,
	price_type_name	text,  -- max  len of type column = 35
	count_seat_id integer,
	city text,  -- max len of cities = 27
	province_or_state text,  -- max len of states = 25
	postal_code varchar  -- max len of zips = 10
);

GRANT SELECT ON ALL TABLES IN SCHEMA tickets TO alexuser;



-- Joining spatial and Ticketing data work alexadmin PSQL Queries
CREATE SCHEMA IF NOT EXISTS tickets;
GRANT USAGE on SCHEMA tickets TO alexuser;
DROP TABLE IF EXISTS tickets.edit_utk_football_new14and19_tickets_all CASCADE;
CREATE TABLE IF NOT EXISTS tickets.edit_utk_football_new14and19_tickets_all
AS SELECT LPAD(postal_code::varchar(5), 5, '0') AZ zip5,
 * FROM tickets.og_utk_football_new14and19_tickets_all;
GRANT SELECT ON ALL TABLES IN SCHEMA tickets TO alexuser;



CREATE INDEX IF NOT EXISTS zip5_1419tix_idx 
ON tickets.edit_utk_football_new14and19_tickets_all
USING btree (zip5);
GRANT SELECT ON ALL TABLES IN SCHEMA skratch, adminareas, tickets TO alexuser;

-- Add spatial columns to editing tix table
ALTER TABLE tickets.edit_utk_football_new14and19_tickets_all
DROP COLUMN IF EXISTS ptgeom;

ALTER TABLE tickets.edit_utk_football_new14and19_tickets_all
ADD COLUMN IF NOT EXISTS ptgeom geometry;

ALTER TABLE tickets.edit_utk_football_new14and19_tickets_all
ADD COLUMN IF NOT EXISTS polygeom geometry;

ALTER TABLE tickets.edit_utk_football_new14and19_tickets_all
ADD COLUMN IF NOT EXISTS lat double precision;

ALTER TABLE tickets.edit_utk_football_new14and19_tickets_all
ADD COLUMN IF NOT EXISTS lon double precision;

---------------------------------

--  update the target field by cross-table query
UPDATE tickets.edit_utk_football_new14and19_tickets_all tixtab
SET polygeom = compareziptab.geom
FROM adminareas.us_zips_poly compareziptab
WHERE 
tixtab.polygeom IS NULL
AND tixtab.zip5 = compareziptab.zip
--ST_Intersects(miss.regeocode_ptgeom,plytb.geom)
; -- 15 sec run

--  update the target fields by cross-table query
UPDATE tickets.edit_utk_football_new14and19_tickets_all tixtab
SET ptgeom = compareziptab.geomcent,
lat = compareziptab.latitude,
lon = compareziptab.longitude
FROM adminareas.us_zips_poly compareziptab
WHERE 
tixtab.ptgeom IS NULL
AND tixtab.zip5 = compareziptab.zip
; -- 22 sec run

-- CREATE INDEX IF NOT EXISTS polygeom_latlon_idx 
-- ON adminareas.us_zips_latlon
-- USING gist (polygeom_from_zippoly);

--  update empty target field by cross-table query
UPDATE tickets.edit_utk_football_new14and19_tickets_all tixtab
SET ptgeom = compareziptab.geocodepoint,
polygeom=compareziptab.polygeom_from_zippoly,
lat = compareziptab.latitude,
lon = compareziptab.longitude
FROM adminareas.us_zips_latlon compareziptab
WHERE 
tixtab.ptgeom IS NULL
AND tixtab.zip5 = compareziptab.zip
; -- 1 sec run


-- Manually set some defaults
UPDATE tickets.edit_utk_football_new14and19_tickets_all SET zip5 = '80138', ptgeom = NULL,polygeom=NULL,lat = NULL,lon = NULL WHERE zip5 IS NULL AND city = 'Parker' AND province_or_state = 'CO';
UPDATE tickets.edit_utk_football_new14and19_tickets_all SET zip5 = '34205', ptgeom = NULL,polygeom=NULL,lat = NULL,lon = NULL WHERE zip5 IS NULL AND city = 'Bradenton' AND province_or_state = 'FL';
UPDATE tickets.edit_utk_football_new14and19_tickets_all SET zip5 = '32536', ptgeom = NULL,polygeom=NULL,lat = NULL,lon = NULL WHERE zip5 IS NULL AND city = 'Crestview' AND province_or_state = 'FL';
UPDATE tickets.edit_utk_football_new14and19_tickets_all SET zip5 = '21054', ptgeom = NULL,polygeom=NULL,lat = NULL,lon = NULL WHERE zip5 IS NULL AND city = 'Gambrills' AND province_or_state = 'MD';
UPDATE tickets.edit_utk_football_new14and19_tickets_all SET zip5 = '39465', ptgeom = NULL,polygeom=NULL,lat = NULL,lon = NULL WHERE zip5 IS NULL AND city = 'Petal' AND province_or_state = 'MS';
UPDATE tickets.edit_utk_football_new14and19_tickets_all SET zip5 = '08243', ptgeom = NULL,polygeom=NULL,lat = NULL,lon = NULL WHERE zip5 IS NULL AND city = 'Sea Isle City' AND province_or_state = 'NJ';
UPDATE tickets.edit_utk_football_new14and19_tickets_all SET zip5 = '13073', ptgeom = NULL,polygeom=NULL,lat = NULL,lon = NULL WHERE zip5 IS NULL AND city = 'Groton' AND province_or_state = 'NY';
UPDATE tickets.edit_utk_football_new14and19_tickets_all SET zip5 = '75068', ptgeom = NULL,polygeom=NULL,lat = NULL,lon = NULL WHERE zip5 IS NULL AND city = 'Little Elm' AND province_or_state = 'Texas';
UPDATE tickets.edit_utk_football_new14and19_tickets_all SET zip5 = '37347', ptgeom = NULL,polygeom=NULL,lat = NULL,lon = NULL WHERE zip5 IS NULL AND city = 'Kimball' AND province_or_state = 'TN';
UPDATE tickets.edit_utk_football_new14and19_tickets_all SET zip5 = '37098', ptgeom = NULL,polygeom=NULL,lat = NULL,lon = NULL WHERE zip5 IS NULL AND city = 'Primm Springs' AND province_or_state = 'TN';
UPDATE tickets.edit_utk_football_new14and19_tickets_all SET zip5 = '25678', ptgeom = NULL,polygeom=NULL,lat = NULL,lon = NULL WHERE zip5 IS NULL AND city = 'Matewan' AND province_or_state = 'WV';


-- Panama City FL postal zip
UPDATE tickets.edit_utk_football_new14and19_tickets_all
SET zip5 = '32408' 
-- blank out the other geography fields so the fill query will refresh them
, ptgeom = NULL,polygeom=NULL,lat = NULL,lon = NULL
WHERE
zip5= '32411';
-- Seffner FL
UPDATE tickets.edit_utk_football_new14and19_tickets_all
SET zip5 = '33584' 
-- blank out the other geography fields so the fill query will refresh them
, ptgeom = NULL,polygeom=NULL,lat = NULL,lon = NULL
WHERE
zip5 = '33583' 
;
-- New Iberia LA postal zip
UPDATE tickets.edit_utk_football_new14and19_tickets_all
SET zip5 = '70560' 
-- blank out the other geography fields so the fill query will refresh them
, ptgeom = NULL,polygeom=NULL,lat = NULL,lon = NULL
WHERE
zip5= '70562';
-- Willoughby, OH 44096
UPDATE tickets.edit_utk_football_new14and19_tickets_all
SET zip5 = '44094' 
-- blank out the other geography fields so the fill query will refresh them
, ptgeom = NULL,polygeom=NULL,lat = NULL,lon = NULL
WHERE
zip5 = '44096' 
;
-- Manually set some defaults
UPDATE tickets.edit_utk_football_new14and19_tickets_all
SET zip5 = '37916' 
-- blank out the other geography fields so the fill query will refresh them
, ptgeom = NULL,polygeom=NULL,lat = NULL,lon = NULL
WHERE
zip5 IS NULL 
OR 
zip5 = '09494' OR zip5= '09142'  --missing zips
;

--  update empty target field by cross-table query
UPDATE tickets.edit_utk_football_new14and19_tickets_all tixtab
SET ptgeom = compareziptab.geomcent,
polygeom=compareziptab.geom,
lat = CAST(compareziptab.latitude AS DOUBLE PRECISION),
lon = CAST(compareziptab.longitude AS DOUBLE PRECISION)
FROM adminareas.us_zips_poly compareziptab
WHERE 
tixtab.ptgeom IS NULL
AND tixtab.zip5 = compareziptab.zip
; -- <1 sec run

--  update empty target field by cross-table query with existing edited table. 
UPDATE tickets.edit_utk_football_new14and19_tickets_all tixtab
SET ptgeom = compareziptab.ptgeom,
polygeom = compareziptab.polygeom,
lat = compareziptab.lat,
lon = compareziptab.lon
FROM tickets.edit_utk_football_2015to18_tickets_all compareziptab
WHERE 
tixtab.ptgeom IS NULL
AND (tixtab.zip5 = compareziptab.zip5 OR (tixtab.city = compareziptab.city AND tixtab.province_or_state = compareziptab.province_or_state))
; -- 1 sec run

--  update empty target lat lon by cross-table query with existing skratch table. 
UPDATE tickets.edit_utk_football_new14and19_tickets_all tixtab
SET lat = compareziptab.lat,
lon = compareziptab.lon
FROM skratch.missingzips14_batchgeo1 compareziptab
WHERE 
tixtab.ptgeom IS NULL
AND CONCAT(
	--tixtab.zip5, ' ', 
	tixtab.city, ' ', tixtab.province_or_state, ' ', tixtab.zip5) = compareziptab.concat_addr
; 
--  update empty target lat lon by cross-table query with existing skratch table. 
UPDATE tickets.edit_utk_football_new14and19_tickets_all tixtab
SET lat = CAST(compareziptab.xmllat AS DOUBLE PRECISION),
lon = CAST(compareziptab.xmllon AS DOUBLE PRECISION)
FROM skratch.missingzips_batchgeo3 compareziptab
WHERE 
tixtab.ptgeom IS NULL AND tixtab.lat IS NULL 
AND CONCAT(
	tixtab.zip5, ' ', 
	tixtab.city, ' ', tixtab.province_or_state, ' ', tixtab.zip5) = compareziptab.xmladdress
;

-- Set More Defaults
UPDATE tickets.edit_utk_football_new14and19_tickets_all
SET zip5 = '41548', ptgeom = NULL,polygeom=NULL,lat = NULL,lon = NULL
WHERE zip5 = '41458' ;
UPDATE tickets.edit_utk_football_new14and19_tickets_all
SET zip5 = '80020', ptgeom = NULL,polygeom=NULL,lat = NULL,lon = NULL
WHERE zip5 = '80023' ;
UPDATE tickets.edit_utk_football_new14and19_tickets_all
SET zip5 = '84123', ptgeom = NULL,polygeom=NULL,lat = NULL,lon = NULL
WHERE zip5 = '84129' ;
UPDATE tickets.edit_utk_football_new14and19_tickets_all
SET zip5 = '84095', ptgeom = NULL,polygeom=NULL,lat = NULL,lon = NULL
WHERE zip5 = '84009' ;
UPDATE tickets.edit_utk_football_new14and19_tickets_all
SET zip5 = '84013', ptgeom = NULL,polygeom=NULL,lat = NULL,lon = NULL
WHERE zip5 = '84005' ;
UPDATE tickets.edit_utk_football_new14and19_tickets_all
SET zip5 = '37916' 
-- blank out the other geography fields so the fill query will refresh them
, ptgeom = NULL,polygeom=NULL,lat = NULL,lon = NULL
WHERE zip5 = '99999' OR zip5= '00000'  ;
--  update empty target field by cross-table query
UPDATE tickets.edit_utk_football_new14and19_tickets_all tixtab
SET ptgeom = compareziptab.geomcent,
polygeom=compareziptab.geom,
lat = CAST(compareziptab.latitude AS DOUBLE PRECISION),
lon = CAST(compareziptab.longitude AS DOUBLE PRECISION)
FROM adminareas.us_zips_poly compareziptab
WHERE 
tixtab.ptgeom IS NULL
AND tixtab.zip5 = compareziptab.zip
; -- <1 sec run
-----------------------------------------------------------------MANUAL STEP---------------------------------------------------------------------------------
-- Geocode missing geoms from lat lons if ptgeom is missing. 
-- For extra info on this step, see alexadmin_utix2014_importing_geocoding_management.sql for the sections:
-- 	mnaual geocoding of missing snglgm. download as KML. 
-- 	KML --> XML --> CSV --> PSQL scratch --> my data
-- Then update empty target lat lon by cross-table query with new skratch table. 
UPDATE tickets.edit_utk_football_new14and19_tickets_all tixtab
SET lat = compareziptab.lat,
lon = compareziptab.lon
FROM skratch.missingzips1419_batchgeo1 compareziptab
WHERE 
tixtab.ptgeom IS NULL
AND CONCAT(
	--tixtab.zip5, ' ', 
	tixtab.city, ' ', tixtab.province_or_state, ' ', tixtab.postal_code) = compareziptab.city_state_pstlcd
; 

-- use PostGIS to geocode the point of the lat lon
-- Create point geom based on lat & LONG
UPDATE tickets.edit_utk_football_new14and19_tickets_all
SET ptgeom = ST_SetSRID(ST_MakePoint(lon, lat),4326)
WHERE ptgeom IS NULL;
-- Use PostGIS to spatially intersect where any ptgeom exists but polygeom does not with the admin polyon. 
UPDATE tickets.edit_utk_football_new14and19_tickets_all edittab
SET polygeom = plytb.geom
FROM adminareas.us_zips_poly plytb
WHERE edittab.polygeom IS NULL
AND ST_Intersects(edittab.ptgeom,plytb.geom)
;

-- Index fields now that they're ready. 
CREATE INDEX IF NOT EXISTS f1419_eventcode_idx 
ON tickets.edit_utk_football_new14and19_tickets_all
USING btree (event_code);
CREATE INDEX IF NOT EXISTS f1419_tixtot_idx 
ON tickets.edit_utk_football_new14and19_tickets_all
USING btree (count_seat_id);
CREATE INDEX IF NOT EXISTS f1419_tixtype_idx 
ON tickets.edit_utk_football_new14and19_tickets_all
USING btree (price_type_name);
CREATE INDEX IF NOT EXISTS f1419_polygeom_idx 
ON tickets.edit_utk_football_new14and19_tickets_all
USING gist (polygeom);
CREATE INDEX IF NOT EXISTS f1419_ptgeom_idx 
ON tickets.edit_utk_football_new14and19_tickets_all
USING gist (ptgeom);

-- GET OPPONENT INTO THE TABLE AND INDEX IT
ALTER TABLE tickets.edit_utk_football_new14and19_tickets_all 
ADD COLUMN opponent varchar;
-- Manually input the opponent names. 
UPDATE tickets.edit_utk_football_new14and19_tickets_all 
SET opponent = 'Utah St.' 
WHERE event_code = 'F14-F01';

UPDATE tickets.edit_utk_football_new14and19_tickets_all 
SET opponent = 'Arkansas St.' 
WHERE event_code = 'F14-F02';

UPDATE tickets.edit_utk_football_new14and19_tickets_all 
SET opponent = 'Florida' 
WHERE event_code = 'F14-F03' OR event_code = 'F16-F03' OR event_code = 'F18-F03';

UPDATE tickets.edit_utk_football_new14and19_tickets_all 
SET opponent = 'UT-Chat' 
WHERE event_code = 'F14-F04' OR event_code = 'F19-F03';

UPDATE tickets.edit_utk_football_new14and19_tickets_all 
SET opponent = 'Alabama' 
WHERE event_code = 'F14-F05' OR event_code = 'F16-F04' OR event_code = 'F18-F04';

UPDATE tickets.edit_utk_football_new14and19_tickets_all 
SET opponent = 'Kentucky' 
WHERE event_code = 'F14-F06' OR event_code = 'F16-F06' OR event_code = 'F18-F06';

UPDATE tickets.edit_utk_football_new14and19_tickets_all 
SET opponent = 'Missouri' 
WHERE event_code = 'F14-F07' OR event_code = 'F16-F07' OR event_code = 'F18-F07';

UPDATE tickets.edit_utk_football_new14and19_tickets_all 
SET opponent = 'Georgia St.' WHERE event_code = 'F19-F01';

UPDATE tickets.edit_utk_football_new14and19_tickets_all 
SET opponent = 'BYU' WHERE event_code = 'F19-F02';

UPDATE tickets.edit_utk_football_new14and19_tickets_all 
SET opponent = 'Mississippi St.' WHERE event_code = 'F19-F05';

UPDATE tickets.edit_utk_football_new14and19_tickets_all 
SET opponent = 'Georgia' WHERE event_code = 'F19-F04';

UPDATE tickets.edit_utk_football_new14and19_tickets_all 
SET opponent = 'South Carolina' WHERE event_code = 'F19-F06';

UPDATE tickets.edit_utk_football_new14and19_tickets_all 
SET opponent = 'UAB' WHERE event_code = 'F19-F07';

UPDATE tickets.edit_utk_football_new14and19_tickets_all 
SET opponent = 'Vanderbilt' WHERE event_code = 'F19-F08';

-- now index everything. 
CREATE INDEX IF NOT EXISTS fy14and19_opponent_idx 
ON tickets.edit_utk_football_new14and19_tickets_all  USING btree (opponent);

-- GET MILES TO UTK IN THERE AND INDEX IT
--  add column to designate the actual opponent for each game 
-- Allows to filter by opponent over multiple years 
ALTER TABLE tickets.edit_utk_football_new14and19_tickets_all 
ADD COLUMN miles_to_utk double precision;

-- Neyland Stadium: 35.954987, -83.924972
--ST_Distance(ST_SetSRID(ST_MakePoint(-83.924972, 35.954987), 4326)::geography, (ptgeom::geography)) * 0.000621371 as miles_to_utk

-- Manually input the opponent names. 
UPDATE tickets.edit_utk_football_new14and19_tickets_all 
SET miles_to_utk = ST_Distance(
						ST_SetSRID(ST_MakePoint(-83.924972, 35.954987), 4326)::geography, 
						(ptgeom::geography)) 
					* 0.000621371
WHERE ptgeom IS NOT NULL
;


-- now index everything. 
CREATE INDEX IF NOT EXISTS fy14and19_milesutk_idx 
ON tickets.edit_utk_football_new14and19_tickets_all  USING btree (miles_to_utk);


-- COPY TABLE INTO ENVIRON SCHEMA USING CREATE TABLE QUERY THAT CALCS THE CO2EQ VALUES
	-- SEE PREVIOUS WROK FOR THIS (as per usual) in alexadmin_footprint_createtixftprttab.sql
CREATE TABLE environ.utix_new14and19_co2indices_og AS SELECT
-- All fields from the original tix table
psql_id as id, zip5, event_code as eventcode, opponent, count_seat_id as ntix, city, province_or_state AS stateprov, price_type_name as tixtype, postal_code as postalcode,
polygeom, ptgeom, lat, lon, miles_to_utk, 

-- The values in these fields represent total CO2eq values for all tourists (ntix) in row. These values are NOT co2eqs per person. 
--		Ex: hotelsco2eq_1night value in a row = co2eq estimation for all people in that ticket order (ntix)

-- kg CO2eq per tourist for hotels  -- 23.21 kgCO2e/OccupiedRoom | 2 leisure travelers per room | if the tourist traveled over 150 miles
--	 	https://www.postgresql.org/docs/8.4/functions-conditional.html
CASE 
	WHEN miles_to_utk >= 150 
	THEN 11.605 * count_seat_id 
	ELSE 0
END AS hotelsco2eq_1night,
-- waste kg CO2eq/tourist  -- 1.102 = (131000000000/325700000)/365 ie (epa USA kg waste per year / ACS people in USA)/days in year for kg co2eq/person/day in USA
1.102 * count_seat_id as wasteco2eq,
-- food  -- Berners-Lee et al. (2012)
7.4 * count_seat_id AS foodco2eq,
-- stadium  -- Hedayati et al. (2014)
14.74 * count_seat_id AS stadiumco2eq,
-- automobile   
((((0.000409 * 1000) * miles_to_utk) -- EPA: (4.09x10^-4 metric tons converted to KG )CO2E/1mile/1car 
	/ 3)  -- 3 people per car (Cooper 2020) <-- co2eq val per person at this distance from Knox
	* count_seat_id)  -- co2eq val per person * # of people in order
	* 2 AS automobileco2eq  -- x2 for both initial and return trip.

FROM tickets.edit_utk_football_new14and19_tickets_all;

ALTER TABLE environ.utix_new14and19_co2indices_og
ADD COLUMN totco2eq double precision;

UPDATE environ.utix_new14and19_co2indices_og
SET totco2eq = hotelsco2eq_1night + wasteco2eq + foodco2eq + stadiumco2eq + automobileco2eq
;  -- 9sec


-- ZCTAs for consistency
-- Add an ACS zip code tract area (ZCTA) Column to utix data 

ALTER TABLE environ.utix_new14and19_co2indices_og
ADD COLUMN ZCTA VARCHAR (5);

ALTER TABLE environ.utix_new14and19_co2indices_og
ADD COLUMN statefromzip VARCHAR (2);


-- ONCE ALL DATA CONSISTENT, MERGE 14& 19 WITH 15-18
	-- SEE HOW I DID THIS WITH OG14 + 15-18
	-- -- not sure I have that code...
CREATE TABLE environ.utix_14new_to19_co2indices_og AS 
(SELECT * FROM environ.utix_new14and19_co2indices_og
UNION
SELECT * FROM environ.utix_14to18_co2indices_edit
WHERE eventcode NOT LIKE 'F14%');

-- Copy table for security's sake
CREATE TABLE environ.utix_1419_co2_edit
AS SELECT *
, (ntix/3)*(miles_to_utk*2) AS totmilesdrvn  -- cars * whole trip where cars = ntix/3 and total trip = miles_to_utk*2 (there and back again)
FROM environ.utix_14new_to19_co2indices_og;
GRANT SELECT ON ALL TABLES IN SCHEMA skratch, adminareas, tickets, environ TO alexuser;

--INDEXES!!!
CREATE INDEX IF NOT EXISTS footprint_milesutk_idx_1419
ON environ.utix_1419_co2_edit USING btree (miles_to_utk);

CREATE INDEX IF NOT EXISTS footprint_ptgeom_idx_1419
ON environ.utix_1419_co2_edit USING gist (ptgeom);

CREATE INDEX IF NOT EXISTS footprint_polygeom_idx_1419
ON environ.utix_1419_co2_edit USING gist (polygeom);

CREATE INDEX IF NOT EXISTS footprint_zip5_idx_1419
ON environ.utix_1419_co2_edit USING btree (zip5);

CREATE INDEX IF NOT EXISTS footprint_eventcode_idx_1419
ON environ.utix_1419_co2_edit USING btree (eventcode);

CREATE INDEX IF NOT EXISTS footprint_tixtot_idx_1419
ON environ.utix_1419_co2_edit USING btree (ntix);

CREATE INDEX IF NOT EXISTS footprint_type_idx_1419
ON environ.utix_1419_co2_edit USING btree (tixtype);

CREATE INDEX IF NOT EXISTS footprint_city_idx_1419
ON environ.utix_1419_co2_edit USING btree (city);

CREATE INDEX IF NOT EXISTS footprint_state_idx_1419
ON environ.utix_1419_co2_edit USING btree (stateprov);

CREATE INDEX IF NOT EXISTS footprint_opponent_idx_1419
ON environ.utix_1419_co2_edit USING btree (opponent);
-- Environ footprinting indexes
CREATE INDEX IF NOT EXISTS footprint_hotel_idx_1419
ON environ.utix_1419_co2_edit USING btree (hotelsco2eq_1night);

CREATE INDEX IF NOT EXISTS footprint_waste_idx_1419
ON environ.utix_1419_co2_edit USING btree (wasteco2eq);

CREATE INDEX IF NOT EXISTS footprint_food_idx_1419
ON environ.utix_1419_co2_edit USING btree (foodco2eq);

CREATE INDEX IF NOT EXISTS footprint_stad_idx_1419
ON environ.utix_1419_co2_edit USING btree (stadiumco2eq);

CREATE INDEX IF NOT EXISTS footprint_car_idx_1419
ON environ.utix_1419_co2_edit USING btree (automobileco2eq)
;  -- 25sec run for all idx creations

CREATE INDEX IF NOT EXISTS footprint_totco2_idx_1419
ON environ.utix_1419_co2_edit USING btree (totco2eq)
;
CREATE INDEX IF NOT EXISTS footprint_totdist_idx_1419
ON environ.utix_1419_co2_edit USING btree (totmilesdrvn)
;
CREATE INDEX IF NOT EXISTS footprint_lat_idx_1419
ON environ.utix_1419_co2_edit USING btree (lat)
;
CREATE INDEX IF NOT EXISTS footprint_lon_idx_1419
ON environ.utix_1419_co2_edit USING btree (lon)
;
GRANT SELECT ON ALL TABLES IN SCHEMA skratch, adminareas, tickets, environ TO alexuser;
