-- Joining spatial and Ticketing data work alexadmin PSQL Queries

ALTER TABLE tickets.edit_utk_football_2015to18_tickets_all
DROP COLUMN IF  EXISTS zip5;
ALTER TABLE tickets.edit_utk_football_2015to18_tickets_all
ADD COLUMN zip5 varchar(5);
UPDATE ehc_sec.utix_14_sesn_edit
SET zip5 = LPAD(postal_code::varchar(5), 5, '0');  -- Where postal_code is the OG zip code column


CREATE INDEX IF NOT EXISTS zip5_tix_idx 
ON tickets.edit_utk_football_2015to18_tickets_all
USING btree (zip5);
GRANT SELECT ON ALL TABLES IN SCHEMA skratch, adminareas, tickets TO alexuser;

-- Add spatial columns to editing tix table
ALTER TABLE tickets.edit_utk_football_2015to18_tickets_all
DROP COLUMN IF  EXISTS ptgeom;

ALTER TABLE tickets.edit_utk_football_2015to18_tickets_all
ADD COLUMN IF NOT EXISTS ptgeom geometry;

ALTER TABLE tickets.edit_utk_football_2015to18_tickets_all
ADD COLUMN IF NOT EXISTS polygeom geometry;

ALTER TABLE tickets.edit_utk_football_2015to18_tickets_all
ADD COLUMN IF NOT EXISTS lat double precision;

ALTER TABLE tickets.edit_utk_football_2015to18_tickets_all
ADD COLUMN IF NOT EXISTS lon double precision;

---------------------------------

--  update the target field by cross-table query
UPDATE tickets.edit_utk_football_2015to18_tickets_all tixtab
SET polygeom = compareziptab.geom
FROM adminareas.us_zips_poly compareziptab
WHERE 
tixtab.polygeom IS NULL
AND tixtab.zip5 = compareziptab.zip
--ST_Intersects(miss.regeocode_ptgeom,plytb.geom)
; -- 15 sec run

--  update the target fields by cross-table query
UPDATE tickets.edit_utk_football_2015to18_tickets_all tixtab
SET ptgeom = compareziptab.geomcent,
lat = compareziptab.latitude,
lon = compareziptab.longitude
FROM adminareas.us_zips_poly compareziptab
WHERE 
tixtab.ptgeom IS NULL
AND tixtab.zip5 = compareziptab.zip
; -- 22 sec run

CREATE INDEX IF NOT EXISTS polygeom_latlon_idx 
ON adminareas.us_zips_latlon
USING gist (polygeom_from_zippoly);

--  update empty target field by cross-table query
UPDATE tickets.edit_utk_football_2015to18_tickets_all tixtab
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
UPDATE tickets.edit_utk_football_2015to18_tickets_all
SET zip5 = '37916' 
-- blank out the other geography fields so the fill query will refresh them
, ptgeom = NULL,polygeom=NULL,lat = NULL,lon = NULL
WHERE
zip5 IS NULL 
OR 
zip5 = '09494' OR zip5= '09142'  --missing zips
;
-- Panama City FL postal zip
UPDATE tickets.edit_utk_football_2015to18_tickets_all
SET zip5 = '32408' 
-- blank out the other geography fields so the fill query will refresh them
, ptgeom = NULL,polygeom=NULL,lat = NULL,lon = NULL
WHERE
zip5= '32411';
-- Seffner FL
UPDATE tickets.edit_utk_football_2015to18_tickets_all
SET zip5 = '33584' 
-- blank out the other geography fields so the fill query will refresh them
, ptgeom = NULL,polygeom=NULL,lat = NULL,lon = NULL
WHERE
zip5 = '33583' 
;
-- New Iberia LA postal zip
UPDATE tickets.edit_utk_football_2015to18_tickets_all
SET zip5 = '70560' 
-- blank out the other geography fields so the fill query will refresh them
, ptgeom = NULL,polygeom=NULL,lat = NULL,lon = NULL
WHERE
zip5= '70562';
-- Willoughby, OH 44096
UPDATE tickets.edit_utk_football_2015to18_tickets_all
SET zip5 = '44094' 
-- blank out the other geography fields so the fill query will refresh them
, ptgeom = NULL,polygeom=NULL,lat = NULL,lon = NULL
WHERE
zip5 = '44096' 
;

--  update empty target field by cross-table query
UPDATE tickets.edit_utk_football_2015to18_tickets_all tixtab
SET ptgeom = compareziptab.geomcent,
polygeom=compareziptab.geom,
lat = CAST(compareziptab.latitude AS DOUBLE PRECISION),
lon = CAST(compareziptab.longitude AS DOUBLE PRECISION)
FROM adminareas.us_zips_poly compareziptab
WHERE 
tixtab.ptgeom IS NULL
AND tixtab.zip5 = compareziptab.zip
; -- <1 sec run

-- index fields now that they're ready. 
-- -- 1 example shown here
CREATE INDEX IF NOT EXISTS edit_eventcode_idx 
ON tickets.edit_utk_football_2015to18_tickets_all
USING btree (event_code);

GRANT SELECT ON ALL TABLES IN SCHEMA skratch, adminareas, tickets TO alexuser;
