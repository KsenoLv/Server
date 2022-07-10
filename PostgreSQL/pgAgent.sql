-- SCRIPTS FOR pgAgent 
-- Script for adding new data to nyse_data_new

copy nyse_data_new FROM 'C:\folder_name\file_name.csv' DELIMITER ',' CSV HEADER;

-- Data checking script.
-- If there is no ticker for the previous day in the database, then file file_name.txt is created with a list of tickers in the format ['GAPL', 'GIPL']

COPY (SELECT '[' || array_to_string(array_agg(''''||ticker||''','), ' ') || ']' FROM nyse_ticker_list 
WHERE ticker NOT IN 
    (select symbols from nyse_data 
     WHERE date = CURRENT_DATE-1 GROUP BY symbols))
TO 'C:\folder_name\file_name.csv';