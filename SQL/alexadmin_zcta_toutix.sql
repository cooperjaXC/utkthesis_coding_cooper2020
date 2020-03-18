-- Add an ACS zip code tract area (ZCTA) Column to utix data 

ALTER TABLE environ.utix_14to18_co2indices_edit
ADD COLUMN ZCTA VARCHAR (5);

-- Make manual adjustments to update environ table ZCTAs where polygeom zip != ACS ZCTA
-- https://stackoverflow.com/questions/2763817/sql-update-fields-of-one-table-from-fields-of-another-one
UPDATE environ.utix_14to18_co2indices_edit targettable 
SET zcta = '38106'  -- from targettable
FROM skratch.missingzips_zippolysnotzcta1 comparetable  -- polyzip zipcode 5s not in ACS ZCTA  -- table created from left join comparetable where polyzip not = acs zcta
WHERE targettable.polygeom = comparetable.geom
AND comparetable.zip = '38113';

UPDATE environ.utix_14to18_co2indices_edit targettable SET zcta = '32612'  FROM skratch.missingzips_zippolysnotzcta1 comparetable WHERE targettable.polygeom = comparetable.geom AND comparetable.zip = '32611';
UPDATE environ.utix_14to18_co2indices_edit targettable SET zcta = '79902'  FROM skratch.missingzips_zippolysnotzcta1 comparetable WHERE targettable.polygeom = comparetable.geom AND comparetable.zip = '79968';
UPDATE environ.utix_14to18_co2indices_edit targettable SET zcta = '35401'  FROM skratch.missingzips_zippolysnotzcta1 comparetable WHERE targettable.polygeom = comparetable.geom AND comparetable.zip = '35487';
UPDATE environ.utix_14to18_co2indices_edit targettable SET zcta = '30540'  FROM skratch.missingzips_zippolysnotzcta1 comparetable WHERE targettable.polygeom = comparetable.geom AND comparetable.zip = '30539';
UPDATE environ.utix_14to18_co2indices_edit targettable SET zcta = '28607'  FROM skratch.missingzips_zippolysnotzcta1 comparetable WHERE targettable.polygeom = comparetable.geom AND comparetable.zip = '28608';
UPDATE environ.utix_14to18_co2indices_edit targettable SET zcta = '28604'  FROM skratch.missingzips_zippolysnotzcta1 comparetable WHERE targettable.polygeom = comparetable.geom AND comparetable.zip = '28691';
UPDATE environ.utix_14to18_co2indices_edit targettable SET zcta = '38237'  FROM skratch.missingzips_zippolysnotzcta1 comparetable WHERE targettable.polygeom = comparetable.geom AND comparetable.zip = '38238';
UPDATE environ.utix_14to18_co2indices_edit targettable SET zcta = '65201'  FROM skratch.missingzips_zippolysnotzcta1 comparetable WHERE targettable.polygeom = comparetable.geom AND comparetable.zip = '65211';
UPDATE environ.utix_14to18_co2indices_edit targettable SET zcta = '73521'  FROM skratch.missingzips_zippolysnotzcta1 comparetable WHERE targettable.polygeom = comparetable.geom AND comparetable.zip = '73523';
UPDATE environ.utix_14to18_co2indices_edit targettable SET zcta = '85142'  FROM skratch.missingzips_zippolysnotzcta1 comparetable WHERE targettable.polygeom = comparetable.geom AND comparetable.zip = '85242';
UPDATE environ.utix_14to18_co2indices_edit targettable SET zcta = '85121'  FROM skratch.missingzips_zippolysnotzcta1 comparetable WHERE targettable.polygeom = comparetable.geom AND comparetable.zip = '85247';
UPDATE environ.utix_14to18_co2indices_edit targettable SET zcta = '85139'  FROM skratch.missingzips_zippolysnotzcta1 comparetable WHERE targettable.polygeom = comparetable.geom AND comparetable.zip = '85239';
UPDATE environ.utix_14to18_co2indices_edit targettable SET zcta = '84321'  FROM skratch.missingzips_zippolysnotzcta1 comparetable WHERE targettable.polygeom = comparetable.geom AND comparetable.zip = '84322';
UPDATE environ.utix_14to18_co2indices_edit targettable SET zcta = '57006'  FROM skratch.missingzips_zippolysnotzcta1 comparetable WHERE targettable.polygeom = comparetable.geom AND comparetable.zip = '57007';



-- now update the rest by setting to zip of zippoly based on polygeoms equaling
-- Do this because except for the 15 above, the zip_poly table's zip code registers in 
UPDATE environ.utix_14to18_co2indices_edit targettable 
SET zcta = comparetable.zip  -- from targettable
FROM adminareas.us_zips_poly comparetable  -- polyzip zipcode 5s not in ACS ZCTA
WHERE targettable.polygeom = comparetable.geom
AND targettable.zcta IS NULL
;

CREATE INDEX zcta_utix14oldto18_idx
ON environ.utix_14to18_co2indices_edit USING btree (zcta);


-- Link the state to each tix purchase using zcta
-- Current utix state is user-input based and not reliable for stats testing or GIS consolidation
-- Use zippoly to get your state info
ALTER TABLE environ.utix_14to18_co2indices_edit
ADD COLUMN statefromzip VARCHAR (2);

UPDATE environ.utix_14to18_co2indices_edit targettable 
SET statefromzip = comparetable.state  -- 1st field from targettable
FROM adminareas.us_zips_poly comparetable 
WHERE targettable.zcta = comparetable.zip;

-- For those manually updated zctas, set the state by comparing polygonz' geoms
UPDATE environ.utix_14to18_co2indices_edit targettable 
SET statefromzip = comparetable.state  -- 1st field from targettable
FROM adminareas.us_zips_poly comparetable 
WHERE targettable.polygeom = comparetable.geom
AND statefromzip IS NULL AND polygeom IS NOT NULL;

CREATE INDEX zipfstate_utix14oldto18env_idx
ON environ.utix_14to18_co2indices_edit USING btree (statefromzip);