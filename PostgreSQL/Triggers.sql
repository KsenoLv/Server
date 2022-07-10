-- TRIGGERS TO MOVE DATA FROM THE TEMPORARY TABLE TO THE MAIN TABLE.
-- Trigger and function transfers data from nyse_data_new to the main table nyse_data.
-- Function.

create or replace function nyse_trig() 
returns trigger AS $$
declare
  
  Date   DATE;
  Symbols   VARCHAR(10);
  Adj_Close NUMERIC(21, 15);
  Close     NUMERIC(21, 15);
  High      NUMERIC(21, 15);
  Low       NUMERIC(21, 15);
  Open      NUMERIC(21, 15);
  Volume    NUMERIC(13, 2);

BEGIN

 date = new.date;
 Symbols = new.symbols;
 Adj_close = new.adj_close;
 close = new.close;
 High = new.High;
 Low = new.Low;
 Open = new.Open;
 Volume = new.volume;

if(date = CURRENT_DATE -1) then
insert into nyse_data values(
       new.date, new.symbols, new.adj_close, new.close, new.High, new.Low, new.Open, new.volume
       );
end if;

return new;
END;
$$ language plpgsql

-- Trigger

create trigger nyse_trig_on_insert
after insert on 
nyse_data_new
for each row
execute procedure nyse_trig()