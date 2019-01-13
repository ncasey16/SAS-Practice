Data DriveTest;
	Infile '/folders/myfolders/read4.csv' delimiter= "," ;
	Input A_Test B_Test C_Test D_Test;

	If A_Test =  .  then S1 = .;
else if A_Test <= 4 then S1 = 5;
else if 4 < A_Test <=5 then S1 = 10;
else if A_Test > 5 then S1 = 15; 

	If B_Test =  .  then S2 = .;
else if B_Test > 0.66 then S2 = 5;
else if 0.52 < B_Test <= 0.66 then S2 = 10;
else if B_Test <= 0.52 then S2 = 15; 

	If C_Test =  .  then S3 = .;
else if C_Test <= 0.55 then S3 = 5;
else if 0.55 < C_Test <= 0.65 then S3 = 10;
else if C_Test > 0.65 then S3 = 15; 

	If D_Test =  .  then S4 = .;
else if D_Test <= 6 then S4 = 5;
else if 6 < D_Test <= 7 then S4 = 10;
else if D_Test > 7 then S4 = 15; 

Tscore = S1 + S2 + S3 + S4;

Run;

proc print data=DriveTest;
	Title "Drive Test Read4";
Run; 	

Data DriveTest;
	Infile '/folders/myfolders/read5.csv' delimiter= "," ;
	Input A_Test B_Test C_Test D_Test;

	If A_Test =  .  then S1 = .;
else if A_Test <= 4 then S1 = 5;
else if 4 < A_Test <=5 then S1 = 10;
else if A_Test > 5 then S1 = 15; 

	If B_Test =  .  then S2 = .;
else if B_Test > 0.66 then S2 = 5;
else if 0.52 < B_Test <= 0.66 then S2 = 10;
else if B_Test <= 0.52 then S2 = 15; 

	If C_Test =  .  then S3 = .;
else if C_Test <= 0.55 then S3 = 5;
else if 0.55 < C_Test <= 0.65 then S3 = 10;
else if C_Test > 0.65 then S3 = 15; 

	If D_Test =  .  then S4 = .;
else if D_Test <= 6 then S4 = 5;
else if 6 < D_Test <= 7 then S4 = 10;
else if D_Test > 7 then S4 = 15; 

Tscore = S1 + S2 + S3 + S4;

Run;

proc print data=DriveTest;
	Title "Drive Test Read5";
Run; 