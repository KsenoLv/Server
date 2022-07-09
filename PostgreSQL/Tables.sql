-- TABLE CREATION.
-- NYSE Ticker Table. List of all shares in NYSE. (nyse_ticker_list)

CREATE table nyse_ticker_list(
  ,ticker   VARCHAR(5) NOT NULL
  ,name     VARCHAR(100)
);

-- Schema of the original table. (nyse_data)
-- Schema is the same for the table (nyse_data_new)

CREATE TABLE nyse_data(
   Date      DATE  NOT NULL
  ,Symbols   VARCHAR(10) NOT NULL
  ,Adj_Close NUMERIC(21, 15) NOT NULL
  ,Close     NUMERIC(21, 15) NOT NULL
  ,High      NUMERIC(21, 15) NOT NULL
  ,Low       NUMERIC(21, 15) NOT NULL
  ,Open      NUMERIC(21, 15) NOT NULL
  ,Volume    NUMERIC(13, 2) NOT NULL
);

-- Creating a VIEW on the nyse_data table as VIEW_nyse_data.
-- Table for public use.
-- Features: Choose data period, rename columns, round values, add Gap column (price difference between current day close and next day open), add price difference columns between high, low, open and close (For further analysis).

CREATE VIEW NYSE_view AS (
select 
    date AS date, 
    symbols AS Ticker, 
	ROUND(close, 2) AS close_price, 
	ROUND(high, 2) AS high_price, 
	ROUND(low, 2) AS low_price, 
	ROUND(open, 2) AS open_price,
	ROUND(open - close, 2) AS open_close, 
	ROUND(high - low, 2) AS high_low,
	ROUND(open - high, 2) AS open_high, 
	ROUND(close - low, 2) AS close_low,
	ROUND(open - low, 2) AS open_low,
	ROUND(high - close, 2) AS high_close,
	ROUND(lag(close) over (order by date), 2) AS gep
from mytable WHERE date > '1983-05-09');

