-- Template for SQL query to import tix data into arcgis by add query layer. 
-- 	Utilizes a GROUP BY polygeom so there's 1 feature per zip polygeom
-- 	and a validation of the geom to avoid drawing errors. 
-- Remember to delete all -- comments before using in ArcGIS

-- CREATE TABLE environ.utix_all_co2_groupbyvalidpolygeom AS  -- For use with alexadmin to create new table
SELECT 
CAST(ROW_NUMBER() OVER (ORDER BY polygeom) AS TEXT) AS mapid,  -- new unique id for group by clauses
SUM(ntix) as tixsum,
SUM(hotelsco2eq_1night) as hotelsum,
SUM(wasteco2eq) as wastesum,
	SUM(foodco2eq) as foodsum,SUM(stadiumco2eq) as stadsum,
	SUM(automobileco2eq) as carsum
,ROUNd(CAST(SUM(totco2eq) AS numeric),2) AS sumtotco2eq
,ROUNd(CAST(SUM(totco2eq)/SUM(ntix) AS NUMERIC),3) AS totCFpppn
, ST_MakeValid(polygeom) as validpolygeom
, sum(CASE WHEN eventcode LIKE 'F14%' THEN (ntix) ELSE 0 END) AS ntix14
, sum(CASE WHEN eventcode LIKE 'F15%' THEN ntix ELSE 0 END) AS ntix15
, sum(CASE WHEN eventcode LIKE 'F16%' THEN ntix ELSE 0 END) AS ntix16
, sum(CASE WHEN eventcode LIKE 'F17%' THEN ntix ELSE 0 END) AS ntix17
, sum(CASE WHEN eventcode LIKE 'F18%' THEN ntix ELSE 0 END) AS ntix18
, sum(CASE WHEN eventcode LIKE 'F19%' THEN ntix ELSE 0 END) AS ntix19  -- remember to normalize for 8 games and not do any stratight comparisons
-- % change = ((new val - old val)/old val)* 100
,ROUND(
	100*(( (sum(CASE WHEN eventcode LIKE 'F19%' THEN ntix ELSE 0 END)/8.0) -  -- 100 * ((new val -
((CASE WHEN (
	  sum(CASE WHEN eventcode LIKE 'F14%' THEN ntix ELSE 0 END) > 0 )
	THEN sum(CASE WHEN eventcode LIKE 'F14%' THEN ntix ELSE 0 END) 
	ELSE (CASE WHEN (
	  		sum(CASE WHEN eventcode LIKE 'F15%' THEN ntix ELSE 0 END) > 0 )
			THEN sum(CASE WHEN eventcode LIKE 'F15%' THEN ntix ELSE 0 END) 
			ELSE (CASE WHEN (
	  			sum(CASE WHEN eventcode LIKE 'F16%' THEN ntix ELSE 0 END) > 0 )
				THEN sum(CASE WHEN eventcode LIKE 'F16%' THEN ntix ELSE 0 END) 
				ELSE (CASE WHEN (
	  				sum(CASE WHEN eventcode LIKE 'F17%' THEN ntix ELSE 0 END) > 0 )
					THEN sum(CASE WHEN eventcode LIKE 'F17%' THEN ntix ELSE 0 END) 
					ELSE (CASE WHEN (
							sum(CASE WHEN eventcode LIKE 'F18%' THEN ntix ELSE 0 END) > 0 )
							THEN sum(CASE WHEN eventcode LIKE 'F18%' THEN ntix ELSE 0 END) 
							ELSE (NULL) -- null if no 14-18 val and 2019 = first time this zip appears in tix dataset. 
							  END) 
					  END) 
				   END) 
		  END)
	END	) / 7.0) ) 	-- old value)
	   /			-- divided by
	  ((CASE WHEN (
	  sum(CASE WHEN eventcode LIKE 'F14%' THEN ntix ELSE 0 END) > 0 )
	THEN sum(CASE WHEN eventcode LIKE 'F14%' THEN ntix ELSE 0 END) 
	ELSE (CASE WHEN (
	  		sum(CASE WHEN eventcode LIKE 'F15%' THEN ntix ELSE 0 END) > 0 )
			THEN sum(CASE WHEN eventcode LIKE 'F15%' THEN ntix ELSE 0 END) 
			ELSE (CASE WHEN (
	  			sum(CASE WHEN eventcode LIKE 'F16%' THEN ntix ELSE 0 END) > 0 )
				THEN sum(CASE WHEN eventcode LIKE 'F16%' THEN ntix ELSE 0 END) 
				ELSE (CASE WHEN (
	  				sum(CASE WHEN eventcode LIKE 'F17%' THEN ntix ELSE 0 END) > 0 )
					THEN sum(CASE WHEN eventcode LIKE 'F17%' THEN ntix ELSE 0 END) 
					ELSE (CASE WHEN (
							sum(CASE WHEN eventcode LIKE 'F18%' THEN ntix ELSE 0 END) > 0 )
							THEN sum(CASE WHEN eventcode LIKE 'F18%' THEN ntix ELSE 0 END) 
							ELSE (NULL) -- null if no 14-18 val and 2019 = first time this zip appears in tix dataset. 
							  END) 
					  END) 
				   END) 
		  END)
	END	) / 7.0) )  	-- old value )
	, 3)
AS pctchgntix
FROM 
environ.utix_14newto19_co2_edit

-- -- WHERE clauses
-- lower(tixtype) LIKE '%season% -- '%student%'
-- eventcode LIKE 'F14%'

GROUP BY 
--ST_MakeValid(polygeom)
polygeom
ORDER BY 
--ST_IsValid(polygeom) asc,
CAST(ROW_NUMBER() OVER (ORDER BY polygeom) AS TEXT)  -- new unique id for group by clauses
-- SUM(totco2eq) desc
;


