--  add column to designate the actual opponent for each game 
-- Allows to filter by opponent over multiple years 
ALTER TABLE tickets.utix_14to18_all_edit 
ADD COLUMN opponent varchar;

-- Manually input the opponent names. 
UPDATE tickets.utix_14to18_all_edit 
SET opponent = 'Utah St.' 
WHERE event_code = 'F14-F01'
;

UPDATE tickets.utix_14to18_all_edit 
SET opponent = 'Arkansas St.' 
WHERE event_code = 'F14-F02'
;

UPDATE tickets.utix_14to18_all_edit 
SET opponent = 'Florida' 
WHERE event_code = 'F14-F03' OR event_code = 'F16-F03' OR event_code = 'F18-F03'
;

UPDATE tickets.utix_14to18_all_edit 
SET opponent = 'UT-Chat' 
WHERE event_code = 'F14-F04' OR event_code = 'F19-F03'
;

UPDATE tickets.utix_14to18_all_edit 
SET opponent = 'Alabama' 
WHERE event_code = 'F14-F05' OR event_code = 'F16-F04' OR event_code = 'F18-F04'
;

UPDATE tickets.utix_14to18_all_edit 
SET opponent = 'Kentucky' 
WHERE event_code = 'F14-F06' OR event_code = 'F16-F06' OR event_code = 'F18-F06'
;

UPDATE tickets.utix_14to18_all_edit 
SET opponent = 'Missouri' 
WHERE event_code = 'F14-F07' OR event_code = 'F16-F07' OR event_code = 'F18-F07'
;

UPDATE tickets.utix_14to18_all_edit 
SET opponent = 'Oklahoma' 
WHERE event_code = 'F15-F01'
;

UPDATE tickets.utix_14to18_all_edit 
SET opponent = 'Western Carolina' 
WHERE event_code = 'F15-F02'
;

UPDATE tickets.utix_14to18_all_edit 
SET opponent = 'Arkansas' 
WHERE event_code = 'F15-F03'
;

UPDATE tickets.utix_14to18_all_edit 
SET opponent = 'Georgia' 
WHERE event_code = 'F15-F04' OR event_code = 'F17-F03' OR event_code = 'F19-F04'
;

UPDATE tickets.utix_14to18_all_edit 
SET opponent = 'South Carolina' 
WHERE event_code = 'F15-F05' OR event_code = 'F17-F04' OR event_code = 'F19-F06'
;

UPDATE tickets.utix_14to18_all_edit 
SET opponent = 'North Texas' 
WHERE event_code = 'F15-F06'
;

UPDATE tickets.utix_14to18_all_edit 
SET opponent = 'Vanderbilt' 
WHERE event_code = 'F15-F07' OR event_code = 'F17-F07' OR event_code = 'F19-F08'
;

UPDATE tickets.utix_14to18_all_edit 
SET opponent = 'Appalachian St.' 
WHERE event_code = 'F16-F01'
;

UPDATE tickets.utix_14to18_all_edit 
SET opponent = 'Ohio' 
WHERE event_code = 'F16-F02'
;

UPDATE tickets.utix_14to18_all_edit 
SET opponent = 'Tennessee Tech' 
WHERE event_code = 'F16-F05'
;

UPDATE tickets.utix_14to18_all_edit 
SET opponent = 'Indiana St.' 
WHERE event_code = 'F17-F01'
;

UPDATE tickets.utix_14to18_all_edit 
SET opponent = 'UMass' 
WHERE event_code = 'F17-F02'
;

UPDATE tickets.utix_14to18_all_edit 
SET opponent = 'LSU' 
WHERE event_code = 'F17-F06'
;

UPDATE tickets.utix_14to18_all_edit 
SET opponent = 'Southern Miss' 
WHERE event_code = 'F17-F05'
;

UPDATE tickets.utix_14to18_all_edit 
SET opponent = 'ETSU' 
WHERE event_code = 'F18-F01'
;

UPDATE tickets.utix_14to18_all_edit 
SET opponent = 'UTEP' 
WHERE event_code = 'F18-F02'
;

UPDATE tickets.utix_14to18_all_edit 
SET opponent = 'Charlotte' 
WHERE event_code = 'F18-F05'
;

-- now index everything. 
CREATE INDEX IF NOT EXISTS fy14to18_opponent_idx 
ON tickets.utix_14to18_all_edit  USING btree (opponent);

-- Congrats! You've got half a decade of UTK tix data now filter-able by opponent
