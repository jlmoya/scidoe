// Copyright (C) 2012 - Maria Christopoulou
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution. The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt␊

// <-- JVM NOT MANDATORY -->

// Results confirmed from licensed Matlab version R2011b
H = [
    0.3185689    0.684731   
    0.7688531    0.3089766  
    0.5430379    0.5694503  
    0.9205527    0.1715891  
    0.1097627    0.9247127
    ];
H_comp = scidoe_pdist(H);
H_exp = [0.5865 0.2523 0.7910 0.3181 0.3447 0.2047 0.9020 0.5485 0.5603 1.1066];
assert_checkalmostequal(H_comp,H_exp,1.0e-3)
//
H  =[
    0.7388326    0.3958625    0.7399886    0.2840223    0.9180394  
    0.1917208    0.9060844    0.2644475    0.6963924    0.4627983];
H_comp = scidoe_pdist(H);
H_exp = 1.0787;
assert_checkalmostequal(H_comp,H_exp,1.0e-3);
//
// Check if empty matrix is generated when we have only one sample point
H = [0.3682415    0.8326198    0.9571552];
H_comp = scidoe_pdist(H);
H_exp = [];
assert_checkequal(H_comp,H_exp);