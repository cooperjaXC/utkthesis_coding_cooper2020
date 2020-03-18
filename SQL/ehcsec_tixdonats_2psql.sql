CREATE SCHEMA IF NOT EXISTS ehc_sec;

GRANT USAGE on SCHEMA ehc_sec TO alexuser;

DROP TABLE IF EXISTS ehc_sec.ehcsec_alltixdonats;

CREATE TABLE IF NOT EXISTS ehc_sec.ehcsec_alltixdonats(
    psql_id serial  PRIMARY KEY, 
    zips_all varchar(5) , 
    sesntixsum integer , 
    sesntixtie varchar(6) , 
    team_w_most_sesntix text , 
    arkansas_14 integer , 
    missouri_14 integer , 
    olemiss_15 integer , 
    tennessee_14 integer , 
    mississippist_15 integer , 
    lsu_14 integer , 
    georgia_14 integer , 
    kentucky_14 integer , 
    donatsum integer , 
    donattie varchar(6) , 
    team_w_most_donats text , 
    tidepride_ala_14 integer , 
    olemissfoundation_15 integer , 
    tigerscholarshipfund_miz_14 integer , 
    razorbackfoundation_ark_14 integer , 
    tennesseefoundation_14 integer , 
    bulldogclub_msu_15 integer , 
    gatorboosters_fla_14 integer , 
    tigersunlimited_aub_15 integer , 
    bulldogclub_uga_14 integer , 
    tigerathleticfoundation_lsu_14 integer , 
    kfund_ky_14 integer , 
    kysesntix2015 integer , 
    kysesntix14to15diff integer , 
    kfund15donats integer , 
    kfund_14to15donatdiff integer , 
    crimtidefound14 integer , 
    ugabldgclb15donatqty integer , 
    ugabldgcl_14to15diff integer , 
    utk14snglgametotals integer , 
    utk14snglgame1utahst integer , 
    utk14snglgame2_arkansasst integer , 
    utk14snglgame3_florida integer , 
    utk14snglgame4_chattanooga integer , 
    utk14snglgame5_alabama integer , 
    utk14snglgame6_kentucky integer , 
    utk14snglgame7_missouri integer 
);

GRANT SELECT ON ALL TABLES IN SCHEMA ehc_sec TO alexuser;