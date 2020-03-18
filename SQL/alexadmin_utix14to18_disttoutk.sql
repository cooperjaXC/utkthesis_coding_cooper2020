--  add column to designate the actual opponent for each game 
-- Allows to filter by opponent over multiple years 
ALTER TABLE tickets.utix_14to18_all_edit 
ADD COLUMN miles_to_utk double precision;

-- Neyland Stadium: 35.954987, -83.924972
--ST_Distance(ST_SetSRID(ST_MakePoint(-83.924972, 35.954987), 4326)::geography, (ptgeom::geography)) * 0.000621371 as miles_to_utk

-- Manually input the opponent names. 
UPDATE tickets.utix_14to18_all_edit 
SET miles_to_utk = ST_Distance(
						ST_SetSRID(ST_MakePoint(-83.924972, 35.954987), 4326)::geography, 
						(ptgeom::geography)) 
					* 0.000621371
WHERE ptgeom IS NOT NULL
;


-- now index everything. 
CREATE INDEX IF NOT EXISTS fy14to18_milesutk_idx 
ON tickets.utix_14to18_all_edit  USING btree (miles_to_utk);
