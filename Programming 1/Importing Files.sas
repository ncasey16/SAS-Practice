/*Creates Library named "NP" from Excel File; 3 tables created from excel file*/
libname np xlsx "/folders/myfolders/EPG194/data/np_info.xlsx";

options validvarname=v7;

proc contents data=np.parks;
run;

/*Import Comma Delimitted (CSV) file*/
proc import datafile="/folders/myfolders/EPG194/data/storm_damage.csv"
	dbms=csv out=storm_damage_import replace; 
run;

proc contents data=storm_damage_import;
run;	

/*Import Excel Data from Single Worksheet;create SAS table named eu_sport_trade*/
proc import datafile="/folders/myfolders/EPG194/data/eu_sport_trade.xlsx"
	dbms=xlsx 
	out=eu_sport_trade 
	replace; *replaces if already exists;
run; 

proc contents data=eu_sport_trade; 
run;	