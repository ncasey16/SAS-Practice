libname pg1 "/folders/myfolders/EPG194/data";
run; 

/*Creation of Macro Variables*/
%let ParkCode=ZION;
%let SpeciesCat=Bird;

/*Creates 2 freq tables of variables, Abundance & Conservation Status
	only includes rows with species_id=YOSE & category=mammal*/ 
proc freq data=pg1.np_species;
	tables Abundance Conservation_Status;
	where Species_ID like "&ParkCode%" and 
		Category="&SpeciesCat";
run;	

proc print data=pg1.np_species;
	var Species_ID Category Scientific_Name Common_Names;
	where Species_ID like "&ParkCode%" and 
		Category="&SpeciesCat";
run;		
