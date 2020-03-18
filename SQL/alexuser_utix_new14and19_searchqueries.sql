SELECT
eventcode, opponent,  -- game parsing
-- SUBSTRING(eventcode,1,3),  -- year parsing
-- COUNT(eventcode) as n_games,
-- ROUND(sum(ntix) /COUNT(DISTINCT(eventcode)),0) AS avtixsum,
SUM(ntix) as tixsum
-- round(cast(sum(totco2eq) AS numeric),2) AS totco2eq_round

-- -- *
,SUM(totco2eq) AS sumtotco2eq
,ROUNd(CAST(SUM(totco2eq)/SUM(ntix) AS NUMERIC),3) AS totCFpppn
-- ,count(DISTINCT (eventcode)) AS nappearances
-- , ROUND(round(cast(sum(totco2eq) AS numeric),2)/COUNT(DISTINCT(eventcode)),2) AS avgco2eqperopponent
-- ,COUNT(hotelsco2eq_1night) AS norders_150plus_hotel
-- ,
-- ST_IsValid(polygeom),
-- ST_MakeValid(polygeom) as validpolygeom
-- , polygeom
,sum(totmilesdrvn) as totmilesdrivn
,sum(totmilesdrvn)/sum(ntix) as totalmilespp

,SUM(hotelsco2eq_1night) as hotelsum,
ROUND(SUM(hotelsco2eq_1night)/sum(ntix),3 )as hotelspp,
SUM(wasteco2eq) as wastesum,
	SUM(foodco2eq) as foodsum,SUM(stadiumco2eq) as stadsum,
	SUM(automobileco2eq) as carsum
	, ROUND(cast(SUM(automobileco2eq)/sum(ntix) as numeric),3 )as carghgspp
,(sum(lat*ntix)/sum(ntix)) as avglat, (sum(lon*ntix)/sum(ntix)) as avglon

FROM 
environ.utix_1419_co2_edit--utix_14new_to19_co2indices_og

-- WHERE  -- NOTE: Use this where clause to filter out by game. 
-- lower(tixtype) 
-- not LIKE '%student%'
-- 	-- Group by polygeom means you lose metadata on which game and season they're connected to. 
-- zip5='37921'
-- (eventcode LIKE 'F17%' OR eventcode LIKE 'F18%' )
-- hotelsco2eq_1night != 0
-- AND lower(opponent) NOT LIKE 'lsu' AND lower(opponent) NOT LIKE 'alabama'

GROUP BY 
eventcode, opponent  -- game parsing
-- SUBSTRING(eventcode,1,3)  -- year parsing

ORDER BY 
eventcode, opponent  -- game parsing
-- SUBSTRING(eventcode,1,3)  -- year parsing

-- ST_IsValid(polygeom) asc,
-- SUM(totco2eq) desc
-- CAST(ROW_NUMBER() OVER (ORDER BY polygeom) AS TEXT)  -- new unique id for group by clauses
-- ROUND(round(cast(sum(totco2eq) AS numeric),2)/COUNT(DISTINCT(eventcode)),2) DESC
-- LIMIT 11
;