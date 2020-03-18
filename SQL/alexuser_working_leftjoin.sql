

-- select the rows of target table that are not in compare table comparing multiple columns
SELECT 
comparetable.HC01_VC03 AS totalpop, 
comparetable.HC03_VC04 AS pct_male, 
comparetable.HC03_VC05 AS pct_female,
targettable.*
-- DISTINCT(targettable.polygeom) as distpolygeom--zip5)
-- ,comparetable.*
-- targettable.osm_id, targettable.way, targettable.admin_level, targettable.boundary, targettable.natural, targettable.tags
FROM 
-- adminareas.us_zips_latlon
-- adminareas.us_zips_poly
environ.utix_14to18_co2indices_edit
-- ACS.ACS_14_5YR_DP05_with_ann 
targettable
left 
-- inner 
join 
-- adminareas.us_zips_latlon 
-- adminareas.us_zips_poly
-- skratch.missingzips_zippolysnotzcta1
ACS.ACS_14_5YR_DP05_with_ann 
comparetable 
-- using (targettable.country_na, comparetable.lsib_name)
on 
-- cast(
-- 	targettable.zip5
	targettable.zcta
-- 	targettable.polygeom
-- 	as text)
	= 
	comparetable.geoid2
-- 	comparetable.geom
WHERE 
-- order by 
-- comparetable.geoid2  
-- comparetable.geom
targettable.polygeom
-- IS NULL
IS NOT NULL
-- AND targettable.polygeom IS NOT NULL -- where utix zip5 is in the USA
AND targettable.eventcode LIKE '%F18%F03%'
-- NULLs first