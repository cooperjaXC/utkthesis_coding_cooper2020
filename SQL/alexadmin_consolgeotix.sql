--CREATE TABle test Florida 2018 using GROUP BY statement.
CREATE TABLE skratch.florida18_test1 AS
SELECT 
zip5
, ptgeom , polygeom
, event_code
, sum(count_seat_id) as tix_consol_tot
FROM tickets.edit_utk_football_2015to18_tickets_all
WHERE
event_code LIKE '%F18-F03%'--Florida18

GROUP BY zip5, ptgeom, polygeom, event_code

ORDER BY zip5;

GRANT SELECT ON ALL TABLES IN SCHEMA skratch, adminareas, tickets TO alexuser;

-- -- Fully year 18 test
-- Refresh Table
DROP TABLE IF EXISTS skratch.fy18_test1;
--CREATE TABle test FY 2018 using GROUP BY statement.
CREATE TABLE skratch.fy18_test1 AS
SELECT 
zip5
, ptgeom , polygeom
, event_code
, sum(count_seat_id) as tix_consol_tot
FROM tickets.edit_utk_football_2015to18_tickets_all
WHERE
event_code LIKE '%F18%'--Full Year 2018 --Florida18

GROUP BY zip5, ptgeom, polygeom, event_code

ORDER BY zip5;


CREATE INDEX IF NOT EXISTS fy18test_ptgeom_idx 
ON skratch.fy18_test1
USING gist (ptgeom);

CREATE INDEX IF NOT EXISTS fy18test_polygeom_idx 
ON skratch.fy18_test1
USING gist (polygeom);

CREATE INDEX IF NOT EXISTS fy18test_zip5_idx 
ON skratch.fy18_test1
USING btree (zip5);

CREATE INDEX IF NOT EXISTS fy18test_eventcode_idx 
ON skratch.fy18_test1
USING btree (event_code);

CREATE INDEX IF NOT EXISTS fy18test_tixtot_idx 
ON skratch.fy18_test1
USING btree (tix_coonsol_tot);

GRANT SELECT ON ALL TABLES IN SCHEMA skratch, adminareas, tickets TO alexuser;
