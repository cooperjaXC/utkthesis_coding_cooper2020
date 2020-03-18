-- CREATE TABLE environ.utix_all_co2_groupbyvalidpolygeom AS  -- For use with alexadmin to create new table
SELECT 
CAST(ROW_NUMBER() OVER (ORDER BY polygeom) AS TEXT) AS id_grpby,  -- new unique id for group by clauses
-- eventcode, 
-- opponent, 
-- ROUND(sum(ntix) /COUNT(DISTINCT(eventcode)),0) AS avtixsum,
-- substring(eventcode,1,3),  -- year parsing
SUM(ntix) as tixsum,
-- round(cast(sum(totco2eq) AS numeric),2) AS totco2eq_round
SUM(hotelsco2eq_1night) as hotelsum,
SUM(wasteco2eq) as wastesum,
	SUM(foodco2eq) as foodsum,SUM(stadiumco2eq) as stadsum,
	SUM(automobileco2eq) as carsum
-- -- *
,SUM(totco2eq) AS sumtotco2eq
,ROUNd(CAST(SUM(totco2eq)/SUM(ntix) AS NUMERIC),3) AS totCFpppn
-- ,count(DISTINCT (eventcode)) AS nappearances
-- , ROUND(round(cast(sum(totco2eq) AS numeric),2)/COUNT(DISTINCT(eventcode)),2) AS avgco2eqperopponent
-- ,COUNT(hotelsco2eq_1night) AS norders_150plus_hotel
,
-- ST_IsValid(polygeom),
ST_MakeValid(polygeom) as validpolygeom
-- , polygeom
FROM 
environ.utix_14to18_co2indices_edit

-- WHERE  -- NOTE: Use this where clause to filter out by game. 
-- 	-- Group by polygeom means you lose metadata on which game and season they're connected to. 
-- zip5='37921'
-- -- eventcode NOT LIKE 'F14%'
-- hotelsco2eq_1night != 0

GROUP BY 
-- eventcode, 
-- opponent
polygeom
-- substring(eventcode,1,3) -- year parsing
ORDER BY 
ST_IsValid(polygeom) asc,
-- SUM(totco2eq) desc
CAST(ROW_NUMBER() OVER (ORDER BY polygeom) AS TEXT)  -- new unique id for group by clauses
--eventcode
-- ROUND(round(cast(sum(totco2eq) AS numeric),2)/COUNT(DISTINCT(eventcode)),2) DESC
-- LIMIT 11
;


