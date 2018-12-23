Data Patients;
Infile '/folders/myfolders/PtBP.txt';
Input Name $ Gender $ Weight SysBP DiaBP;
Run;
proc print data=patients;
title 'Patient BP';
Run;