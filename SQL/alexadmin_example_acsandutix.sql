-- Example of how to join ACS data to UTix data

DROP TABLE IF EXISTS skratch.florida18_test1 CASCADE;
DROP TABLE IF EXISTS skratch.florida18_test2 CASCADE;


CREATE TABLE skratch.florida18_test2 AS
SELECT 
comparetable.HC01_VC03 AS totalpop, 
comparetable.HC03_VC04 AS pct_male, 
comparetable.HC03_VC05 AS pct_female,
targettable.*

FROM 
environ.utix_14to18_co2indices_edit targettable
left 
-- inner 
join 
ACS.ACS_14_5YR_DP05_with_ann 
comparetable 
on 
	targettable.zcta
	= 
	comparetable.geoid2
WHERE 

targettable.polygeom
IS NOT NULL
AND targettable.eventcode LIKE '%F18%F03%'
;

GRANT SELECT ON ALL TABLES IN SCHEMA ACS, skratch, environ TO ALEXUSER;
