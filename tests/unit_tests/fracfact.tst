// Copyright (C) 2012 - Maria Christopoulou
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

// <-- JVM NOT MANDATORY -->

// Design from R-BHH2 package
// ffDesMatrix(5,gen=list(c(3,1,2)))
B_exp = [
   -1   -1    1
    1   -1   -1
   -1    1   -1
    1    1    1
];
B_exp = scidoe_sortdesign(B_exp);
B_comp = scidoe_fracfact("a b ab");
B_comp = scidoe_sortdesign(B_comp);
assert_checkequal(B_comp,B_exp);
//
// Design from R-BHH2 package
// ffDesMatrix(5,gen=list(c(3,1,2)))
// Test with Uppecase letters
B_exp = [
   -1   -1    1
    1   -1   -1
   -1    1   -1
    1    1    1
];
B_exp = scidoe_sortdesign(B_exp);
B_comp = scidoe_fracfact("A B AB");
B_comp = scidoe_sortdesign(B_comp);
assert_checkequal(B_comp,B_exp);
//
// Design from R-BHH2 package
// ffDesMatrix(5,gen=list(c(5,1,2,3,4)))
B_exp=[
   -1   -1   -1   -1    1
    1   -1   -1   -1   -1
   -1    1   -1   -1   -1
    1    1   -1   -1    1
   -1   -1    1   -1   -1
    1   -1    1   -1    1
   -1    1    1   -1    1
    1    1    1   -1   -1
   -1   -1   -1    1   -1
    1   -1   -1    1    1
   -1    1   -1    1    1
    1    1   -1    1   -1
   -1   -1    1    1    1
    1   -1    1    1   -1
   -1    1    1    1   -1
    1    1    1    1    1
];
B_exp=scidoe_sortdesign(B_exp);
B_comp = scidoe_fracfact("a b c d abcd");
B_comp = scidoe_sortdesign(B_comp);
assert_checkequal(B_exp,B_comp)
//
// 
// Design from R-BHH2 package
// ffDesMatrix(5,gen=list(c(-5,1,2,3,4)))
B_exp = [
   -1   -1   -1   -1   -1
    1   -1   -1   -1    1
   -1    1   -1   -1    1
    1    1   -1   -1   -1
   -1   -1    1   -1    1
    1   -1    1   -1   -1
   -1    1    1   -1   -1
    1    1    1   -1    1
   -1   -1   -1    1    1
    1   -1   -1    1   -1
   -1    1   -1    1   -1
    1    1   -1    1    1
   -1   -1    1    1   -1
    1   -1    1    1    1
   -1    1    1    1    1
    1    1    1    1   -1
];
B_exp = scidoe_sortdesign(B_exp);
B_comp = scidoe_fracfact("a b c d -abcd");
B_comp = scidoe_sortdesign(B_comp);
assert_checkequal(B_exp,B_comp)
 

