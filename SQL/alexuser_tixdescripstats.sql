SELECT 
-- * 
-- sum(fy18.tix_consol_tot)
-- ((sum(td14.tennessee_14)*7)+sum(td14.utk14snglgametotals))
sum(count_seat_id)
-- occupants, COUNT(*)  -- Frequency cmd (along with GROUP BY occupants below)
-- ROUND(AVG(occupants), 4),PERCENTILE_DISC(.5) WITHIN GROUP (ORDER BY occupants) -- measures of central tendency
FROM 
-- ENVIRON.CAROCCUPANCYSAMPLE
-- skratch.fy18_test1 fy18
-- ehc_sec.ehcsec_alltixdonats td14
tickets.edit_utk_football_2015to18_tickets_all
WHERE 
-- -- access_point LIKE '%eyland%'
-- -- access_point LIKE '%hillip%'
-- polygeom IS NULL
event_code LIKE '%F15%'

-- GROUP BY occupants