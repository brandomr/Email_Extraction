Email_Extraction
================

Ever had a list of e-mails in a CSV (spreadsheet) that you have wanted to get into semi-colon delimitted list for batch e-mailing purposes?

Ever had this list of e-mails embedded in cells containing things **other** than e-mails? For example, someone decided to put
"brandomr, 888-888-8888, brandomr@brandomr.com"
all in the same cell!?

Well, this R script will look for the "contact" column in your .CSV file and deal with this for you.


What you need to do
===================

Make sure that you set the appropriate working directory at the top of the R script (this should point to where you've left your .CSV file). Next, make sure that the column in the .CSV we are looking at has a "contact" as the header (aka the first row of that column should read "contact").


What you get
============
A cleaned CSV with the extracted e-mails in a seperate column, plus a .txt file with your delimitted e-mails.
