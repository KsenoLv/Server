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

## Description.

Fully automate VPS/VDS server.
<br><br>
Using Python we create a script for parsing quotes from the site Yahoo Finance.<br>
The script is activated at a certain time every day to load new data.<br>
Import the obtained quote file into the PostgreSQL database.<br>
Create a table of the whole database and tables for integrity and validation.<br>
Also create a view for further market analysis (final user table).<br>
Using PostrgeSQL and PgAgent we create triggers to transfer new quotes into the database.<br>
Create triggers, scripts and time transactions to check the database.<br>
Simple audit of tables and the entire database.<br>

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

_Update every business day from 06:00 Am. till 06:30 Am._
<br><br>
List of shares:<br>
__Download:__ [nyse_ticker_list.csv](http://193.124.65.84/NYSE/nyse_ticker_list.csv)
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
