Data Patients;
	Infile '/folders/myfolders/PtBP.txt'; *pulls data file by computer; 
	Input Name $ Gender $ Age Weight SysBP DiaBP;
Run;
proc print data=patients;
	title 'Patient BP';
Run;
proc means data=patients n nmiss mean std min q1 median q3 median max maxdec=2;
	var sysbp;
	class gender;
run; *mean table by gender analyzing sysbp;
proc univariate data=patients plot;
	var sysbp;
	class gender;
	histogram sysbp;
		inset mean median std; 
run;
proc sgplot data=patients;
	scatter x=age y=sysbp;
		yaxis label='SysBP';
		xaxis label='age';
run;
proc freq data=patients; *print freq table;
	tables sysbp /plots=freqplot;
run;
