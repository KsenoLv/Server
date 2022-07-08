<a id="anchor"></a>
# Python and PostgreSQL on financial markets.<br>

Private server with an archive of quotes from the world's largest exchanges. Daily, updated databases and automatic addition to PostgreSQL<br>

The project is open for everyone but was created for personal use.<br>

# Technical requirements.

VPS/VDS - Windows server.<br>
- Minimum requirements: WS 2012R, 1x2.2GHz, 1Gb RAM, 30Gb HDD, 1IP<br>
- Python - Anaconda, Jupiter notebook. Optional VScode.<br>
- PostgreSQL - PgAdmin, PgAgent.<br>

# Description.

Fully automate VPS/VDS server.<br>
Using Python we create a script for parsing quotes from the site Yahoo Finance.<br>
The script is activated at a certain time every day to load new data.<br>
Import the obtained quote file into the PostgreSQL database.<br>
Create a table of the whole database and tables for integrity and validation.<br>
Also create a view for further market analysis (final user table).<br>
Using PostrgeSQL and PgAgent we create triggers to transfer new quotes into the database.<br>
Create triggers, scripts and time transactions to check the database.<br>
Simple audit of tables and the entire database.<br>
Gathering information about missing quotes, duplicate errors, etc.<br>

# File Structure:

Python(parser)/<br>
- ParserYahoo.ipynb - Structure and description of Yahoo Finance parser.<br>

PostgreSQL(db)/<br>
- Tables.sql - Scripts to create tables.<br>
- PgAdmin.sql - Scripts to work with the ready data table.<br>
- PgAgent.sql - Scripts to automate database with the help of PgAgent extension for PostgreSQL.<br>
- Triggers.sql - Triggers and functions for working with the database.<br>

# PostgreSQL database structure:

Database/.
- nyse_ticker_list - Tickers of all NYSE stocks and their names.
- nyse_data_new - Table where daily updates are placed.
- nyse_data - The main table with all data.
- VIEW_nyse_data - Table for analytics and public access.

----

Author: Mihail Ksenofontov<br>
Contact: ksenofontov.mihail@gmail.com<br>
Web Page: [www.kseno.site](https://www.kseno.site)<br>

[Up](#anchor)