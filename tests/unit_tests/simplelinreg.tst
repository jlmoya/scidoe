// Copyright (C) 2012 - Michael Baudin
// Copyright (C) 2012 - Maria Christopoulou 
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

// <-- JVM NOT MANDATORY -->

// The Dataset used are provided by NIST in 
// http://www.itl.nist.gov/div898/strd/lls/data/LINKS/DATA/Norris.dat
// Norris.dat contains 1 response variable y, 1 predictor variable  and 36 observations.
// The model used is Y = B1*X + B0.
// We use the function assert_checkalmostequal() of the Assert toolbox.   

// Known Inputs and Outputs

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

B = [
-0.262323073774029
1.00211681802045
];

H = scidoe_simplelinreg(X,Y);
assert_checkalmostequal(H,B,[],[],"element");

