/* Below code is taken from:
	-Snippets
	-Data	
	-Import XLSX file 
	Replace data file with location XLSX file */


/** Import an XLSX file.  **/

PROC IMPORT DATAFILE="/folders/myfolders/byexample/Wages.xlsx"
		    OUT=WORK.wages_temporary
		    DBMS=XLSX
		    REPLACE;
RUN;

/** Print the results. **/

PROC PRINT DATA=WORK.wages_temporary;
RUN;


title "The First Four Observations of Wages Temporary";
proc print data=work.wages_temporary (obs=4);
run; 

/* SAS Output Delivery System (ODS) to convert to Excel Spreadsheet*/

libname learn '/folders/myfolders/byexample'; 	

ods csv file='/folders/myfolders/byexample/odsexample.csv';

proc print data=learn.survey noobs ; *noobs removes obs column from output;
run; 

ods csv close; *important to close file with ods close staement; 

