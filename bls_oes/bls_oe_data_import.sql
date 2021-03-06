USE bls_oe;
LOAD DATA INFILE '../dl_files/econ_data/bls_oes/download.bls.gov/pub/time.series/oe/oe.area'
	INTO TABLE area FIELDS TERMINATED BY '\t'
	LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
	(state_code,area_code,areatype_code,area_name);

LOAD DATA INFILE '../dl_files/econ_data/bls_oes/download.bls.gov/pub/time.series/oe/oe.areatype'
	INTO TABLE areatype FIELDS TERMINATED BY '\t'
	LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
	(areatype_code,areatype_name);

LOAD DATA INFILE '../dl_files/econ_data/bls_oes/download.bls.gov/pub/time.series/oe/oe.datatype'
	INTO TABLE datatype FIELDS TERMINATED BY '\t'
	LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
	(datatype_code,datatype_name);

LOAD DATA INFILE '../dl_files/econ_data/bls_oes/download.bls.gov/pub/time.series/oe/oe.footnote'
	INTO TABLE footnote FIELDS TERMINATED BY '\t'
	LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
	(footnote_code,footnote_text);

LOAD DATA INFILE '../dl_files/econ_data/bls_oes/download.bls.gov/pub/time.series/oe/oe.industry'
	INTO TABLE industry FIELDS TERMINATED BY '\t'
	LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
	(industry_code,industry_name,display_level,selectable,sort_sequence);

LOAD DATA INFILE '../dl_files/econ_data/bls_oes/download.bls.gov/pub/time.series/oe/oe.occupation'
	INTO TABLE occupation FIELDS TERMINATED BY '\t'
	LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
	(occupation_code,occupation_name,display_level,selectable,sort_sequence);

LOAD DATA INFILE '../dl_files/econ_data/bls_oes/download.bls.gov/pub/time.series/oe/oe.release'
	INTO TABLE oe_release FIELDS TERMINATED BY '\t'
	LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
	(release_date,description);

LOAD DATA INFILE '../dl_files/econ_data/bls_oes/download.bls.gov/pub/time.series/oe/oe.seasonal'
	INTO TABLE seasonal FIELDS TERMINATED BY '\t'
	LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
	(seasonal,seasonal_text);

LOAD DATA INFILE '../dl_files/econ_data/bls_oes/download.bls.gov/pub/time.series/oe/oe.sector'
	INTO TABLE sector FIELDS TERMINATED BY '\t'
	LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
	(sector_code,sector_name);

LOAD DATA INFILE '../dl_files/econ_data/bls_oes/download.bls.gov/pub/time.series/oe/oe.data.1.AllData'
	INTO TABLE alldata FIELDS TERMINATED BY '\t'
	LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
	(series_id, year, period, value, footnote_codes);

LOAD DATA INFILE '../dl_files/econ_data/bls_oes/download.bls.gov/pub/time.series/oe/oe.series'
	INTO TABLE series FIELDS TERMINATED BY '\t'
	LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
	(series_id, seasonal, areatype_code, industry_code, occupation_code, datatype_code,
   state_code, area_code, sector_code, series_title, footnote_codes,
   begin_year, begin_period, end_year, end_period);