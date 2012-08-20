// Copyright (C) 2012 - Michael Baudin
// Copyright (C) 2012 - Maria Christopoulou 
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

// <-- JVM NOT MANDATORY -->

// The Dataset used is provided by NIST in 
// http://www.itl.nist.gov/div898/strd/lls/data/LINKS/DATA/Norris.dat
// Norris.dat contains 1 response variable y, 1 predictor variable  and 36 observations.
// The model used is Y = B(1) + B(2)*X.
X = [
    0.2    
    337.4  
    118.2  
    884.6  
    10.1   
    226.5  
    666.3  
    996.3  
    448.6  
    777.   
    558.2  
    0.4    
    0.6    
    775.5  
    666.9  
    338.   
    447.5  
    11.6   
    556.   
    228.1  
    995.8  
    887.6  
    120.2  
    0.3    
    0.3    
    556.8  
    339.1  
    887.2  
    999.   
    779.   
    11.1   
    118.3  
    229.2  
    669.1  
    448.9  
    0.5    
];

Y = [
    0.1    
    338.8  
    118.1  
    888.   
    9.2    
    228.1  
    668.5  
    998.5  
    449.1  
    778.9  
    559.2  
    0.3    
    0.1    
    778.1  
    668.8  
    339.3  
    448.9  
    10.8   
    557.7  
    228.3  
    998.   
    888.8  
    119.6  
    0.3    
    0.6    
    557.6  
    339.3  
    888.   
    998.5  
    778.9  
    10.2   
    117.6  
    228.9  
    668.4  
    449.2  
    0.2    
];
expected = [
-0.262323073774029
1.00211681802045
];
B = scidoe_simplelinreg(X,Y);
assert_checkalmostequal(B,expected,[],[],"element");
// Check more data
[B,bint,r,rint,stats,fullstats] = scidoe_simplelinreg(X,Y);
Bintexpected = [
  -0.7354667    0.2108205  
   1.0012434    1.0029903  
];
assert_checkalmostequal(bint,Bintexpected,1.e-6,[],"element");
Rexpected = [
   0.1618997  
   0.9481087  
  -0.0878848  
   1.7897859  
  -0.6590568  
   1.3828638  
   1.0518872  
   0.3533373  
  -0.1872815  
   0.5175555  
   0.0807153  
   0.1614763  
  -0.2389470  
   1.2207307  
   0.7506171  
   0.8468386  
   0.7150470  
  -0.5622320  
   0.7853723  
  -0.0205231  
   0.3543957  
  -0.4165646  
  -0.5921185  
   0.2616880  
   0.5616880  
  -0.1163212  
  -0.2554899  
  -0.8157179  
  -2.3523781  
  -1.4866782  
  -0.6611736  
  -0.6880965  
  -0.5228516  
  -1.8540399  
  -0.3879165  
  -0.0387353  
];
assert_checkalmostequal(r,Rexpected,1.e-6,[],"element");
assert_checkalmostequal(fullstats.R2,0.999993745883712,1.e-15);
assert_checkalmostequal(fullstats.ResidualSS,26.6173985294224,1.e-13);
assert_checkalmostequal(fullstats.ResidualMean,0.782864662630069,1.e-13);

//
// "Introduction to probability and statistics for engineers and scientists.", 
// Third Edition, Sheldon Ross, Elsevier Academic Press, 2004
// Example 9.4a
// X : Speed
// Y : Miles per Gallon

X = [
45
50
55
60
65
70
75
];
Y = [
24.2
25.0
23.0
22.0
21.5
20.6
19.8
];
[B,bint] = scidoe_simplelinreg(X,Y);
Bintexpected = [
   29.094968   35.647889  
  -0.2217218  -0.1139925  
];
Bexpected = [
   32.371429  
  -0.1678571  
];
assert_checkalmostequal(B,Bexpected,1.e-6,[],"element");
assert_checkalmostequal(bint,Bintexpected,1.e-6,[],"element");
if (%f) then
scf();
plot(X,Y,"bo")
xtitle("","Speed","Miles per Gallon")
end

// http://en.wikipedia.org/wiki/Simple_linear_regression
// "Okun's law in macroeconomics is an example of the simple 
// linear regression. Here the dependent variable (GDP growth) 
// is presumed to be in a linear relationship with the changes 
// in the unemployment rate."
gdpch = [
   1.5671  
   0.4097  
   0.1913  
  -1.4     
  -0.2775  
   1.1326  
  -1.0303  
   4.1384  
   2.9991  
   3.8703  
   1.7934  
   1.1175  
   1.7028  
   2.0014  
   0.1902  
   1.161   
   0.0804  
   0.6323  
   3.312   
   1.8452  
   0.8198  
  -0.6375  
  -1.6014  
  -0.498   
   0.1496  
   1.0819  
   1.9827  
   2.8587  
   1.5986  
   1.3343  
   0.5286  
  -0.4272  
   0.7874  
  -0.1123  
   1.6438  
   0.5667  
  -0.2291  
   0.9735  
  -1.0414  
  -2.693   
   0.5809  
   2.2444  
   2.2503  
   2.0885  
   2.6133  
  -0.0429  
   0.3303  
   2.2188  
  -0.4935  
   0.1849  
  -1.288   
   0.578   
   1.872   
   1.6426  
   2.0405  
   1.7437  
   1.081   
   0.9839  
   0.2503  
   1.1831  
   1.3022  
   1.9188  
   0.728   
   2.2304  
   1.1891  
   1.348   
   0.2611  
   2.4518  
   1.3491  
   2.0335  
   2.3896  
   2.4811  
   0.378   
   0.6349  
   0.8721  
   0.9197  
  -0.0638  
   0.7235  
   0.7485  
   2.034   
   1.7204  
   0.7042  
   0.427   
   1.5468  
   0.2614  
   0.5802  
  -0.471   
  -0.1372  
   0.2075  
   0.8758  
  -1.0734  
   2.7927  
   0.5483  
   0.7677  
   0.2504  
   1.963   
   2.2887  
   0.9913  
   1.7388  
   2.5511  
   1.0019  
  -0.3944  
   0.8283  
  -0.7661  
   0.2695  
  -1.1113  
  -0.5509  
  -1.2802  
   0.8778  
   1.7354  
   1.2587  
   2.3733  
   0.8298  
   0.4743  
   0.8214  
   1.2186  
   1.798   
   1.7996  
   0.1203  
   0.2797  
   3.8528  
   0.9652  
   1.3363  
   0.2523  
   0.0634  
   0.7115  
   0.3329  
   0.3298  
  -2.0388  
  -0.1544  
   1.7793  
   1.9426  
  -0.6995  
   1.1906  
  -1.1806  
  -1.657   
   0.4314  
  -0.4741  
   0.0713  
   1.1555  
   2.361   
   1.78    
   2.0539  
   2.1847  
   1.6937  
   0.8646  
   0.7543  
   0.8347  
   0.7833  
   1.4946  
   0.8231  
   0.9111  
   0.4165  
   0.9281  
   0.5322  
   0.7337  
   1.0626  
   0.8376  
   1.7346  
   0.6657  
   1.1775  
   0.5118  
   1.2989  
   1.2157  
   0.544   
   0.4742  
   0.3464  
   1.2482  
   0.2293  
  -0.1827  
  -0.8215  
  -0.4922  
   0.5595  
   0.2459  
   0.5385  
   0.9284  
   0.9361  
   0.7726  
   1.3174  
  -0.0272  
   0.6081  
   0.438   
   1.5109  
   0.8467  
   1.3943  
   0.5457  
   1.2333  
   0.3699  
   0.195   
   0.7743  
   0.8001  
   0.715   
   1.6479  
   0.4998  
   1.14    
   1.073   
   1.4408  
   1.0416  
   0.6852  
   1.4916  
   0.555   
   1.0139  
   1.6345  
   0.7534  
   0.4844  
   1.2694  
   1.7239  
   0.6338  
   1.1905  
   0.1412  
   0.2723  
  -0.1504  
  -0.3987  
  -0.0729  
   0.6793  
   1.2369  
   0.3119  
   0.9923  
   0.3437  
];
unempch = [
  -0.0666667  
   0.1        
   0.0666667  
   0.8333333  
   1.2        
   0.8333333  
   0.2666667  
  -0.5666667  
  -0.8333333  
  -0.9333333  
  -0.4        
  -0.7333333  
  -0.4        
   0.0666667  
   0.2        
  -0.3        
  -0.1        
   0.2666667  
  -0.4        
  -0.1333333  
  -0.1333333  
   0.1666667  
   0.9666667  
   1.5666667  
   0.5333333  
   0.1666667  
  -0.6333333  
  -0.6        
  -0.3333333  
  -0.3        
   0.1333333  
  -0.2        
   0.1666667  
  -0.0666667  
   0.         
  -0.2        
   0.1666667  
   0.1333333  
   0.7        
   1.3666667  
   1.0666667  
  -0.0333333  
  -0.9666667  
  -0.5333333  
  -0.7333333  
   0.1666667  
   0.3333333  
  -0.4666667  
   0.1        
   0.3        
   0.7333333  
   0.5333333  
   0.2        
  -0.2333333  
  -0.5666667  
  -0.5666667  
  -0.1        
   0.0333333  
  -0.0333333  
   0.2333333  
  -0.0333333  
  -0.2333333  
   0.0666667  
  -0.1        
  -0.2666667  
  -0.2        
  -0.0333333  
  -0.0666667  
  -0.2333333  
  -0.3        
  -0.2666667  
  -0.2333333  
  -0.0333333  
  -0.0666667  
  -0.0666667  
   0.1333333  
   0.         
  -0.0333333  
   0.1        
  -0.1666667  
  -0.1666667  
  -0.0333333  
  -0.1333333  
   0.         
   0.0333333  
   0.1333333  
   0.         
   0.6        
   0.6        
   0.4        
   0.6666667  
   0.1        
  -0.0333333  
   0.1333333  
  -0.1        
  -0.1666667  
  -0.0666667  
  -0.1333333  
  -0.2        
  -0.4333333  
   0.         
  -0.1333333  
  -0.0333333  
   0.3666667  
   0.0666667  
   0.4333333  
   0.9666667  
   1.6666667  
   0.6        
  -0.4        
  -0.1666667  
  -0.5666667  
  -0.1666667  
   0.1666667  
   0.0333333  
  -0.2666667  
  -0.3666667  
  -0.2333333  
  -0.2333333  
  -0.3333333  
  -0.3333333  
   0.0333333  
  -0.1333333  
  -0.0333333  
  -0.1666667  
   0.1666667  
   0.1        
   0.3333333  
   1.0333333  
   0.3333333  
  -0.2666667  
   0.0333333  
  -0.0333333  
   0.         
   0.8333333  
   0.6        
   0.6        
   0.4666667  
   0.7666667  
  -0.3        
  -0.2333333  
  -0.7666667  
  -0.8333333  
  -0.6666667  
  -0.4333333  
   0.         
  -0.1333333  
  -0.0666667  
   0.0666667  
  -0.1        
  -0.1666667  
   0.         
   0.1333333  
  -0.2        
  -0.1333333  
  -0.2333333  
  -0.3333333  
  -0.2666667  
  -0.1666667  
  -0.1333333  
  -0.2333333  
   0.         
  -0.1333333  
  -0.1333333  
   0.0333333  
   0.         
   0.1333333  
  -0.0666667  
   0.0333333  
   0.3666667  
   0.4333333  
   0.4666667  
   0.2333333  
   0.0333333  
   0.2333333  
   0.2666667  
   0.2333333  
   0.0333333  
  -0.2666667  
  -0.2333333  
  -0.0666667  
  -0.2666667  
  -0.1666667  
  -0.0666667  
  -0.3666667  
  -0.2        
  -0.3666667  
  -0.1666667  
   0.2        
   0.         
  -0.1        
  -0.0333333  
  -0.0333333  
  -0.2333333  
   0.0666667  
  -0.1        
  -0.2333333  
  -0.1333333  
  -0.2        
  -0.0333333  
  -0.2333333  
   0.1333333  
  -0.1        
  -0.1333333  
  -0.0333333  
  -0.0333333  
  -0.1666667  
  -0.0333333  
  -0.0666667  
   0.1        
  -0.1333333  
   0.2333333  
   0.3        
   0.3666667  
   0.7666667  
   0.0333333  
   0.2        
  -0.0666667  
   0.1333333
	];
if (%f) then
scf();
plot(unempch,gdpch,"bo")
xtitle("","Quaterly change in the unemployment rate (D%)",..
"Quaterly change in GDP (D%)")
end
[B,bint] = scidoe_simplelinreg(unempch,gdpch);
Bexpected = [
0.859
-1.817
];
Bintexpected = [
0.76 0.96
-2.06 -1.58
];
assert_checkalmostequal(B,Bexpected,[],1.e-3,"element");
assert_checkalmostequal(bint,Bintexpected,[],1.e-2,"element");
//
// http://en.wikipedia.org/wiki/Simple_linear_regression
Height = [1.47	1.50	1.52	1.55	1.57	1.60	1.63	1.65	1.68	1.70	1.73	1.75	1.78	1.80	1.83];
Mass =[52.21	53.12	54.48	55.84	57.20	58.57	59.93	61.29	63.11	64.47	66.28	68.10	69.92	72.19	74.46];
[B,bint] = scidoe_simplelinreg(Height',Mass');
Bexpected = [
-39.062
61.272
];
Bintexpected = [
-45.4 -32.7
57.4 65.1
];
assert_checkalmostequal(B,Bexpected,[],1.e-2,"element");
assert_checkalmostequal(bint,Bintexpected,[],1.e-1,"element");
//
// Same as previously, with row vectors
[B,bint] = scidoe_simplelinreg(Height,Mass);
Bexpected = [
-39.062
61.272
];
Bintexpected = [
-45.4 -32.7
57.4 65.1
];
assert_checkalmostequal(B,Bexpected,[],1.e-2,"element");
assert_checkalmostequal(bint,Bintexpected,[],1.e-1,"element");
//
//
// "Introduction to probability and statistics for engineers and scientists.", 
// Third Edition, Sheldon Ross, Elsevier Academic Press, 2004
// Example 9.2a
// X : Relative Humidity
// Y : Moisture Content
X = [46 53 29 61 36 39 47 49 52 38 55 32 57 54 44];
Y = [12 15 7 17 10 11 11 12 14 9 16 8 18 14 12];
[B,bint] = scidoe_simplelinreg(X,Y);
Bexpected = [
-2.51
-0.32
];
Bintexpected = [
-6.240 1.238
0.263 0.383
];
[flag,errormsg]=assert_checkalmostequal(B,Bexpected,1.e-2,[],"element");
[flag,errormsg]=assert_checkalmostequal(bint,Bintexpected,1.e-2,[],"element");
//
//
// The previous example with column vectors:
[B,bint]=scidoe_simplelinreg(X',Y');
Bexpected = [
-2.51
-0.32
];
Bintexpected = [
-6.240 1.238
0.263 0.383
];
[flag,errormsg]=assert_checkalmostequal(B,Bexpected,1.e-2,[],"element");
[flag,errormsg]=assert_checkalmostequal(bint,Bintexpected,1.e-2,[],"element");
