DATA grades; 
	input subj 1-4 name $ 5-23 sex e1 e2 e3 e4 e5 proj final;
	Totalmarks= e1+e2+e3+e4+e5+proj+final; *also SUM(e1,e2,e3,e4,e5,proj,final);
	AvgTotalmarks=mean(e1,e2,e3,e4,e5,proj,final);
	Rounded_avg=Round(AvgTotalmarks,1); *comma after avg in rounded func is what nearest number to round to 1=round to nearest whole number;
	Datalines;
1011 Alia        Bhatt 2 100 65 83 84 99 91 96
1012 Maria       Smith 1 78  82 86 .  100 95 97
1111 Thomas      Jones 2 68 82 82 89  89 93 99
1121 Benedictine Methew 1 51 69 79 59 85 64 100
1301 Trisha      White 1 51 69 79 59 85 64 100
;
Run;
Proc print data=grades;
	var name e1 e2 e3 e4 e5 proj final Totalmarks AvgTotalmarks rounded_avg; *var statement pulls relevant variables of interest; 
	*can rearrange variables; 
run; 
	*new_varaible=expression/old variable; 
	*new_variable must be valid SAS name; 
	*totalamarks is example of new_variable 