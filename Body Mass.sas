options ps=58 ls= 80;
Data BodyMass; 
	Infile "/folders/myfolders/weight.dat";
	input Subj $ 1-4 Height $ 5-9 initial_wt $ 10-15 final_wt 16-21;
 
 Height = Input(Height,5.);
 initial_wt = Input(initial_wt,6.);
 
*UNIT CONVERSION; 
*BMI = weight in kg/ height in meter squared;
*First, need to convert height & weight variables to metric units;
	* 1 inch = .0254 meter ;
	* 1 kg = 2.2 pounds ;
	
 Height = Height * 0.0254;
 initial_wt = initial_wt / 2.2;
 final_wt = final_wt / 2.2; 

 BMI_ini = (initial_wt) / (Height*Height);
 BMI_fin = (final_wt) / (Height*Height); 
 BMI_dif = (BMI_fin) - (BMI_ini); 

Run;

Proc print data=BodyMass;
	Title 'Weight Lose Program';
Run; 	