/* Adding Labels to Variables in SAS Data Set*/

libname learn '/folders/myfolders/byexample';
	
	data learn.test_scores;
	length ID $ 3
		   Name $ 15;
	input ID $ Score1-Score3;
	label ID = 'Student ID'
		  Score1 = 'Math Score'
		  Score2 = 'Science Score'
		  Score3 = 'English Score';
datalines;
1 90 95 98
2 78 77 75
3 88 91 92 
; 
 *Notice how labels from DATA step are in output;	  
proc means data=learn.test_scores;
run;
		
/* User-Defined Formats*/
	
libname learn '/folders/myfolders/byexample';
run;

data learn.survey;
	input ID Gender$ Age Salary Ques1-Ques5;
datalines;
001 M 23 28000 1 2 1 2 3
002 F 55 76123 4 5 2 1 1 
003 M 38 36500 2 2 2 2 1
004 F 67 128000 5 3 2 2 4
005 M 22 23060 3 3 3 4 2
006 M 63 90000 2 3 5 4 3 
007 F 45 76100 5 3 4 3 3 
;
run; 
	
proc format;
	value $gender 'M' = 'Male'
				  'F'= 'Female'
				  ' ' = 'Not entered'
				  other = 'Miscoded';
	value age low-29 = 'Less than 30'
	          30-50 = '30 to 50'
	          51-high = '51+';
	value $likert '1' = 'Strongly disagree'          
	  			  '2'= 'Disagree'
	  			  '3' = 'No opinion'
	  			  '4' = 'Agree'
	  			  '5' = 'Strongly agree';
run; 
/*Adding FORMAT Statment in Proc Print*/

title "Data";
proc print data=learn.survey;
id ID;
var Gender Age Salary Ques1-Ques5;
format Gender      $Gender.
       Age         Age.
       Ques1-Ques5 Likert.
       Salary      Dollar11.2;
run;

/*Regrouping Values Using a Format*/

proc format;
	value $three'1', '2' = 'Disagreement'
		   '3' = 'No opinion'
		   '4', '5' = 'Agreement';
run; 


proc freq data=learn.survey;
	title "Question Frequencies Using the $three Format";
	tables Ques1-Ques5;
	format Ques1-Ques5 three.;
run; 	

/*Creating Permanent Format Library*/
		   
libname myfmts '/folders/myfolders/byexample';

proc format library=myfmts;
	value $gender 'M' = 'Male'
				  'F'= 'Female'
				  ' ' = 'Not entered'
				  other = 'Miscoded';
	value age low-29 = 'Less than 30'
	          30-50 = '30 to 50'
	          51-high = '51+';
	value $likert '1' = 'Strongly disagree'          
	  			  '2'= 'Disagree'
	  			  '3' = 'No opinion'
	  			  '4' = 'Agree'
	  			  '5' = 'Strongly agree';
run; 

/*Adding LABEL and FORMAT Statements in DATA Step*/

libname learn '/folders/myfolders/byexample';
libname myfmts '/folders/myfolders/byexample';
	*format search, search previously saved formats; 
options fmtsearch=(myfmts); 

data learn.survey;
	infile '/folders/myfolders/byexample/survey.txt' pad;
	input ID : $3.
		  Gender : $1.
		  Age
		  Salary
		  (Ques1-Ques5) (: $1.);
	format Gender  $Gender.
       Age         Age.
       Ques1-Ques5 $Likert.
       Salary      Dollar10.0;	  
    label ID = 'Subject ID'
    	  Gender = 'Gender'
    	  Age = 'Age as of 1/1/2006'
    	  Salary = 'Yearly Salary'
    	  Ques1 = 'The governer is doing a good job?'
    	  Ques2 = 'The property tax should be lowered'
    	  Ques3 = 'Guns should be banned'
    	  Ques4 = 'Expand the Green Acre program'
    	  Ques5 = 'The School needs to be expaned';
run;    

title "Data set Survey";
proc contents data=learn.survey varnum;
run;  	  

/*Display Format Definitions in User-Created Format Library*/
	
title 'Format Definitions in MYFMTS Library';
proc format library=myfmts fmtlib;
run; 	
	*SELECT statement shows formats only for selected variables;
proc format library=myfmts;
	select age $likert;
run; 	

/*EXAMPLE 1: User Defined Formatting*/

proc format;
	value agegroup low-30 = 'Less than 30'
			  31-50 = '31 to 50'
			  51-70 = '51 to 70'
			  71-high = '71 and older';
	value $party 'D' = 'Democrat'
				 'R' = 'Republican';
	value $likert '1' = 'Strongly disagree'          
	  			  '2'= 'Disagree'
	  			  '3' = 'No opinion'
	  			  '4' = 'Agree'
	  			  '5' = 'Strongly agree';
run; 	  			  

data voter;
	input Age Party : $1. (Ques1-Ques4) ($1. + 1);
	label Age = 'Age'
    	  Party = 'Politcial Party'
    	  Ques1 = 'The president is doing a good job?'
    	  Ques2 = 'Congress is doing a good job'
    	  Ques3 = 'Taxes are too high'
    	  Ques4 = 'Government should cut spending';
   format Age agregroup.
   		  Party $party.
   		  Ques1-Ques4 $likert.;
datalines;
23 D 1 1 2 2
45 R 5 5 4 1
67 D 2 4 3 3
39 R 4 4 4 4
19 D 2 1 2 1
75 D 3 3 2 3 
57 R 4 3 4 4
; 

title "Listing of Voter";
proc print data=VOTER;
run;

title "Frequencies of 4 Questions";
proc freq data=voter;
	tables Ques1-Ques4;
run; 	

/*Example 2: Regrouping into smaller Groups*/

data colors;
	input Color : $ 1. @@;
datalines;
R R B G Y Y . . B G R B G Y P O O V V B
; 

proc format;
	value $color 'R', 'B', 'G' = 'Group 1'
				   'Y', 'O' = 'Group 2'
				   ' ' = 'Not Given'
				   other = 'Group 3';
run; 				   
			  
proc freq data=colors;
	tables color / nocum missing;
					*missing option includes 'not given' in table;
	format color $color.;
run; 