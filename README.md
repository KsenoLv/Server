<a id="anchor"></a>
# Server with financial data.<br>

Private server with an archive of quotes from the world's largest exchanges.<br>
Automation with the PostgreSQL Database with daily updates.<br>

The project is open for everyone but was created for personal use.<br>
_Вся информация доступна на Русском языке >>> [Gitflic.ru](https://gitflic.ru/project/kseno/servernew)_

## Technical requirements.

VPS/VDS - Windows server.<br>
- Minimum requirements: WS 2012R, 1x2.2GHz, 1Gb RAM, 30Gb HDD, 1IP<br>
- Python - Anaconda, Jupiter notebook. Optional VScode.<br>
- PostgreSQL - PgAdmin, PgAgent.<br>

## Short description.

1 - Python script automatically downloading data to the server in file.csv format.<br>
2 - The script adds new data to the PlpgSql table at a specific time using PgAgent.<br>
3 - Trigger checks missing tikers and creates a file_no_data.csv.<br>
4 - The python script downloading the data for the missing tickers again and creates a new file.csv.<br>
5 - PgAgent adds the missing tickers to the main table.<br>
<br>
The whole process is fully automated.<br>
The cycle works continuously from Tuesday to Saturday.

## Example.

In this example, we'll look at downloading NYSE stock quotes.<br>
Creating a database and setting up automatic updates. 
<br><br>
Example database:
<br><br>
**Period of data** = from 09 may 1983<br>
**Time frame** = daily (D)<br>
**Number of shares** = 2708<br>
**Database size in .csv format** = 1.3 Gb<br>
**Amount of attributes in PostgreSQL database** = from 11 mln. <br>
**Table size in PostgreSQL** = from 1.1 Gb <br>

_Update every business day from 06:00 Am. till 06:30 Am. GMT_
<br><br>
List of shares:<br>
__Download:__ [nyse_ticker_list.csv](http://193.124.65.84/NYSE/nyse_tickers_list.csv)<br>
List of shares for Python script:<br>
__Download:__ [python_ticker_list.txt](http://193.124.65.84/NYSE/python_ticker_list.txt)
<br><br>
Database is in .csv file: <br>
_Attention, file size = > 1.30 Gb._<br>
__Download:__ [nyse_data.csv](http://193.124.65.84/NYSE/nyse_data.csv)
<br><br>
Yesterday's data: <br>
__Download:__ [nyse_data_new.csv](http://193.124.65.84/NYSE/nyse_data_new.csv)
<br><br>

## File Structure:

Python(parser)/<br>
- ParserYahoo.ipynb - Structure and description of Yahoo Finance parser.<br>

PostgreSQL(db)/<br>
- Tables.sql - Scripts to create tables.<br>
- PgAdmin.sql - Scripts to work with the ready data table.<br>
- PgAgent.sql - Scripts to automate database with the help of PgAgent extension for PostgreSQL.<br>
- Triggers.sql - Triggers and functions for working with the database.<br>

## PostgreSQL database structure:

Database/.
- nyse_ticker_list - Tickers of all NYSE stocks and their names.<br>
- nyse_data_new - Table where daily updates are placed.<br>
- nyse_data - The main table with all data.<br>
- VIEW_nyse_data - Table for analytics and public access.<br>

## PostgreSQL tables structure:

The scripts use a query structure based on the tables below.<br>
Don't forget to change the names of the columns and tables to suit your parameters.<br>

#### nyse_ticker_list - table:

| Ticker | Name |
|:-----------:|:------------:|
| Varchar(30) | Varchar(100) |
| GIBL | GibleMibele mobyle company |

#### nyse_data / nyse_data_new - tables:

| Date | Symbols | Adj_close | Close | High | Low | Open | Volume |
|:----:|:-----------:|:--------------:|:--------------:|:--------------:|:--------------:|:--------------:|:--------------:|
| Date | Varchar(10) | Numeric(21,15) | Numeric(21,15) | Numeric(21,15) | Numeric(21,15) | Numeric(21,15) | Numeric(13,2) |
| 1983-05-09 | GIBL | 13.1234.. | 13.1234.. | 13.1234.. | 13.1234.. | 13.1234.. | 123456789.12 |

----

Author: Mihail Ksenofontov<br>
Contact: ksenofontov.mihail@gmail.com<br>
Web Page: [www.kseno.site](https://www.kseno.site)<br>

[Up](#anchor)
