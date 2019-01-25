libname pg1 "/folders/myfolders/EPG194/data";
run; 

/*lists first 20 obs*/
proc print data=pg1.np_summary (obs=20);
	var Reg Type ParkName DayVisits TentCampers RVCampers;
run;

/*summary statistics: mean vaules, standev, min/max*/
proc means data=pg1.np_summary;
  var DayVisits TentCampers RVCampers;
run;

/*shows extreme values*/
proc univariate data=pg1.np_summary;
  var DayVisits TentCampers RVCampers;
run;

/*freq table of listed variables*/
proc freq data=pg1.np_summary;
  tables Reg Type;
run;

/*Eliminating Case Sensitivity in WHERE conditions
	upcase(variable) in WHERE statements to not perm convert to 
	   uppercase*/
proc print data=pg1.np_traffic;
	var ParkName Location Count;
	where Count ne 0 and upcase(Location) like '%MAIN ENTRANCE%';
run;	