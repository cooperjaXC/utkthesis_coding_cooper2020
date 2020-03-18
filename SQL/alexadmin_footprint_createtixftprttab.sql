-- Create table based off of ticketing data in tickets schema.
-- Do so in a way that calculates the carbon footprint for each CO2 index 
-- then after the table is created, compile in various ways. 
CREATE TABLE environ.utix_14to18_co2indices_og AS SELECT
-- All fields from the original tix table
id_tixall as id, zip5, event_code as eventcode, opponent, count_seat_id as ntix, city, province_or_state AS stateprov, price_type_name as tixtype, postal_code as postalcode,
polygeom, ptgeom, lat, lon, miles_to_utk, 

-- The values in these fields represent total CO2eq values for all tourists (ntix) in row. These values are NOT co2eqs per person. 
--		Ex: hotelsco2eq_1night value in a row = co2eq estimation for all people in that ticket order (ntix)

-- kg CO2eq per tourist for hotels  -- 23.21 kgCO2e/OccupiedRoom | 2 leisure travelers per room | if the tourist traveled over 150 miles
--	 	https://www.postgresql.org/docs/8.4/functions-conditional.html
CASE 
	WHEN miles_to_utk >= 150 
	THEN 11.605 * count_seat_id 
	ELSE 0
END AS hotelsco2eq_1night,
-- waste kg CO2eq/tourist  -- 1.102 = (131000000000/325700000)/365 ie (epa USA kg waste per year / ACS people in USA)/days in year for kg co2eq/person/day in USA
1.102 * count_seat_id as wasteco2eq,
-- food  -- Berners-Lee et al. (2012)
7.4 * count_seat_id AS foodco2eq,
-- stadium  -- Hedayati et al. (2014)
14.74 * count_seat_id AS stadiumco2eq,
-- automobile   
((((0.000409 * 1000) * miles_to_utk) -- EPA: 4.09x10^-4 metric tons CO2E/mile/car 
	/ 3)  -- 3 people per car (Cooper 2020) <-- co2eq val per person at this distance from Knox
	* count_seat_id)  -- co2eq val per person * # of people in order
	* 2 AS automobileco2eq  -- x2 for both initial and return trip.

FROM tickets.utix_14to18_all_edit 

;  -- 26 seconds!

CREATE TABLE environ.utix_14to18_co2indices_edit AS SELECT * FROM environ.utix_14to18_co2indices_og;

GRANT SELECT ON ALL TABLES IN SCHEMA environ TO alexuser;

-- Now index everything. (check old .sql to find a good list of fields to index)
CREATE INDEX IF NOT EXISTS footprint_milesutk_idx 
ON environ.utix_14to18_co2indices_edit USING btree (miles_to_utk);

CREATE INDEX IF NOT EXISTS footprint_ptgeom_idx 
ON environ.utix_14to18_co2indices_edit USING gist (ptgeom);

CREATE INDEX IF NOT EXISTS footprint_polygeom_idx 
ON environ.utix_14to18_co2indices_edit USING gist (polygeom);

CREATE INDEX IF NOT EXISTS footprint_zip5_idx 
ON environ.utix_14to18_co2indices_edit USING btree (zip5);

CREATE INDEX IF NOT EXISTS footprint_eventcode_idx 
ON environ.utix_14to18_co2indices_edit USING btree (eventcode);

CREATE INDEX IF NOT EXISTS footprint_tixtot_idx 
ON environ.utix_14to18_co2indices_edit USING btree (ntix);

CREATE INDEX IF NOT EXISTS footprint_type_idx 
ON environ.utix_14to18_co2indices_edit USING btree (tixtype);

CREATE INDEX IF NOT EXISTS footprint_city_idx 
ON environ.utix_14to18_co2indices_edit USING btree (city);

CREATE INDEX IF NOT EXISTS footprint_state_idx 
ON environ.utix_14to18_co2indices_edit USING btree (stateprov);

CREATE INDEX IF NOT EXISTS footprint_opponent_idx 
ON environ.utix_14to18_co2indices_edit USING btree (opponent);
-- Environ footprinting indexes
CREATE INDEX IF NOT EXISTS footprint_hotel_idx 
ON environ.utix_14to18_co2indices_edit USING btree (hotelsco2eq_1night);

CREATE INDEX IF NOT EXISTS footprint_waste_idx 
ON environ.utix_14to18_co2indices_edit USING btree (wasteco2eq);

CREATE INDEX IF NOT EXISTS footprint_food_idx 
ON environ.utix_14to18_co2indices_edit USING btree (foodco2eq);

CREATE INDEX IF NOT EXISTS footprint_stad_idx 
ON environ.utix_14to18_co2indices_edit USING btree (stadiumco2eq);

CREATE INDEX IF NOT EXISTS footprint_car_idx 
ON environ.utix_14to18_co2indices_edit USING btree (automobileco2eq)
;  -- 25sec run for all idx creations


-- Now calculate total co2eq emissions per order (row)
ALTER TABLE environ.utix_14to18_co2indices_edit
ADD COLUMN totco2eq double precision;

UPDATE environ.utix_14to18_co2indices_edit
SET totco2eq = hotelsco2eq_1night + wasteco2eq + foodco2eq + stadiumco2eq + automobileco2eq
;  -- 1m16sec
CREATE INDEX IF NOT EXISTS footprint_totco2_idx 
ON environ.utix_14to18_co2indices_edit USING btree (totco2eq)
;

