*Reading Data Values Seperated by Blanks;

data demographics;
	infile '/folders/myfolders/byexample/mydata.txt';
	input Gender $ Age Height Weight;
run;	

title "Listing of data set DEMOGRAPHICS";
Proc PRINT data=demographics;
run; 

*Alternative Method to Specify an External File;
	*fileref=preston; 
	
filename preston '/folders/myfolders/byexample/mydata.txt';

data demographics;
	infile preston;
	input Gender $ Age Height Weight;
run; 	

* Data Lines Directly into Program;

data demogrpahics;
	input Gender$ Age Height Weight;
datalines;
M 50 68 155
F 23 60 101
M 65 72 220
F 35 65 133
M 15 71 166
;	
run;

* INFILE Options with DATALINES Statement;

data demographics;
	infile datalines dsd;
	input Gender $ Age Height Weight;
datalines;
"M", 50, 68, 155
"F", 23, 69, 101
"M", 65, 72, 220
"F", 35, 65, 133
"M", 15, 71, 166
;
	
* Reading Raw Data from Fixed Columns;
	*METHOD 1: Column Input;

data financial; 
	infile '/folders/myfolders/byexample/bank.txt';
	input Subj $ 1-3
		  DOB $ 4-13
		  Gender $ 14
		  Balance 15-21;
run; 		  
	
title "Listing of FINANCIAL";
Proc Print data=financial;
run; 

	*Method 2: Formatted Input;

data financial;
	infile '/folders/myfolders/byexample/bank.txt';
	input @1 Subj $3.
		  @4 DOB mmddyy10.
		  @14 Gender $1.
		  @15 Balance 7.;
run;

*Placing a FORMAT statement in a procedure step can override an formats
	that were before this statement;
title "Listing of FINANCIAL";
Proc Print data=financial;
	format DOB mmddyy10.
		   Balance doallar11.2;	
run; 

*Using INFORMATS with List Input
	for data containinng dates and character values longer than 8 bytes;
	

data list_example;
	infile '/folders/myfolders/byexample/list.csv' dsd;
	input subj : $3.
		  name : $20.
		  DOB : mmddyy10.
		  salary : dollar8.;
	format DOB date9. salary dollar8.;
run; 

*Alternative List Input with INFORMAT Statement;

data list_example;
	informat Subj $3.
			 Name $20.
			 DOB mmddyy10.
			 Salary dollar8.;
	infile '/folders/myfolders/byexample/list.csv' dsd;
	input Subj
		  Name	
		  DOB
		  Salary;
	format DOB date9. Salary dollar8.;
run; 	

title "Listing of LIST_EXAMPLE";
proc print data=list_example;
run; 


/* Example 1: Reading Data from Text File*/

data scores; 
	infile '/folders/myfolders/byexample/scores.txt';
	input Gender $ English History Math Science;
	Average = (English + History + Math + Science) / 4; 
run;

title "Listing of SCORES";
proc print data=scores noobs;
run; 

/* Example 2: Temp SAS Data set from Delimtted Txt File*/

data Company;
	infile '/folders/myfolders/byexample/company.txt'
		dsd dlm='$';
	input LastName $ EmpNo $ Salary;
	format Salary dollar10.;
run; 

title "Listing of COMPANY";
proc print data=company noobs;
run; 

/*Example 3: CSV file with List Obs & Freq statement*/

data Vote;
	infile '/folders/myfolders/byexample/political.csv' dsd;
	input State $ Party $ Age;
run; 		  

title "Listing of VOTE";
proc print data=Vote;
run;

title "Lisiting of Party Frequencies";
proc freq data=Vote;
	tables Party;
run; 	

/*Example 4: CSV file with List Obs & Freq statement Using FILENAME Statement*/

filename policy '/folders/myfolders/byexample/political.csv';

data Vote1;
	infile policy dsd;
	input State $ Party $ Age;
run; 		  

title "Listing of VOTE1";
proc print data=Vote1;
run;

title "Lisiting of Party Frequencies";
proc freq data=Vote1;
	tables Party;
run; 	

/* Example 5: Create Test Data with DATALINEs Statement with new Z variable 
	Z= 100 +50X + 2X^2 -25Y + Y^2 using (X,Y) data pairs*/
	
data testdata;
	input X Y;
	z =  100 + 50*X + 2*X**2 - 25*Y + Y**2;
datalines;
1 2
3 5
5 9
9 11
;

title "Listing of TESTDATA";
proc print data=testdata noobs;
run; 

/* Example 6: Column Input */ 

data Bank;
	infile '/folders/myfolders/byexample/bankdata.txt';
	input Name $ 1-15
	      Acct $ 16-20
	      Balance 21-26
	      Rate 27-30;
	      Interest = Balance * Rate;
run; 	   

proc print data=Bank;
run;    
	
	
/* Example 7: Formatted  Input */

data Bank;
	infile '/folders/myfolders/byexample/bankdata.txt';
	input @1 Name $15.
	      @16 Acct $5.
	      @21 Balance 6.
	      @27 Rate 4.;
	      Interest = Balance * Rate;
run; 	   

proc print data=Bank;
run;    	

/* Example 8: Another Formatted Input*/

data Stocks; 
	infile '/folders/myfolders/byexample/stockprices.txt';
	input @1 Stock $4.
		  @5 PurDate mmddyy10.
		  @15 PurPrice dollar6.
		  @21 Number 4.
		  @25 SellDate mmddyy10.
		  @35 SellPrice dollar6.;
		  TotalPur = Number * PurPrice;
		  TotalSell = Number * SellPrice;
		  Profit = TotalSell - TotalPur; 
	format PurDate date9. PurPrice dollar6. SellDate date9. SellPrice dollar6.;
run; 		  
		  
	