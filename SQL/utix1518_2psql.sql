CREATE SCHEMA IF NOT EXISTS tickets;

GRANT USAGE on SCHEMA tickets TO alexuser;

DROP TABLE IF EXISTS tickets.utk_football_2015to18_tickets_all;

CREATE TABLE IF NOT EXISTS tickets.utk_football_2015to18_tickets_all(
    psql_id serial  PRIMARY KEY, 
	event_code text,
	price_type_name	text,  -- max  len of type column = 35
	count_seat_id integer,
	city text,  -- max len of cities = 27
	province_or_state text,  -- max len of states = 25
	postal_code varchar  -- max len of zips = 10
);

GRANT SELECT ON ALL TABLES IN SCHEMA tickets TO alexuser;
