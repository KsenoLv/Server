-- SCRIPTS FOR WORKING WITH THE DATABASE
-- Number of attributes in the table.

select count(*) from nyse_data;

select symbols, count(*) from nyse_data 
    WHERE symbols = 'AAPL' GROUP BY symbols;

-- Scripts in a lightweight form, shows the last 10 attributes grouped by date and number of records.

select date, count(*) from nyse_data group by date order by date desc limit 10;

-- The script checks duplicates in a certain period.

select symbols, date, count(*) from nyse_data group by symbols , date 
    HAVING count(*) > 1 AND date BETWEEN '2022-01-29' AND '2022-12-31'; 

-- Check missing tickers by date.

SELECT ticker FROM nyse_ticker_list 
WHERE ticker NOT IN 
    (select symbols from nyse_data
     WHERE date = '2022-06-28' GROUP BY symbols)
GROUP BY ticker;

-- Adding a row to a table.

INSERT INTO nyse_data (date, symbols, adj_close, close, High, Low, Open, volume) 
SELECT date, symbols, adj_close, close, High, Low, Open, volume FROM nyse_data
WHERE date = '2022-06-09';

-- Copy all data for a certain period.

insert into nyse_data select * from nyse_data WHERE date = '2022-06-24';

-- DELETING DATA
-- All data for a specified period.

DELETE from nyse_data WHERE date = '2022-06-28';

-- Data for a certain period and ticker.

DELETE from nyse_data WHERE date = '2022-06-28' AND symbol = 'AAPL';

-- All data of a certain ticker.

DELETE from nyse_data WHERE symbol = 'AAPL';




