// Copyright (C) 2012 - Michael Baudin
// Copyright (C) 2012 - Maria Christopoulou
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution. The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt␊

// <-- JVM NOT MANDATORY -->
//
// Test with only one parameter
nb_var = 3;
C = scidoe_bbdesign(3);
E = [-1 -1 0.;
1 -1 0;
-1 1 0;
1 1 0.;
-1 0 -1;
1 0 -1;
-1 0 1;
1 0 1;
0 -1 -1;
0 1 -1;
0 -1 1;
0 1 1;
0 0 0];
E = gsort(E,"lr","i");
assert_checkequal(C,E);
//
// Test with both input parameters

C = scidoe_bbdesign(5,3);

E =   [-1.  -1.    0.    0.    0.;
1.  -1.    0.    0.    0.;
-1.  1.    0.    0.    0.;
1.   1.    0.    0.    0.;
-1.  0.   -1.    0.    0.;
1.   0.   -1.    0.    0.;
-1.  0.    1.    0.    0.;
1.   0.    1.    0.    0.;
-1.  0.    0.   -1.    0.;
1.   0.    0.   -1.    0.;
-1.  0.    0.    1.    0.;
1.   0.    0.    1.    0.;
-1.  0.    0.    0.   -1.;
1.   0.    0.    0.   -1.;
-1.  0.    0.    0.    1.;
1.   0.    0.    0.    1.;
0.  -1.   -1.    0.    0.;
0.   1.   -1.    0.    0.;
0.  -1.    1.    0.    0.;
0.   1.    1.    0.    0.;
0.  -1.    0.   -1.    0.;
0.   1.    0.   -1.    0.;
0.  -1.    0.    1.    0.;
0.   1.    0.    1.    0.;
0.  -1.    0.    0.   -1.;
0.   1.    0.    0.   -1.;
0.  -1.    0.    0.    1.;
0.   1.    0.    0.    1.;
0.   0.   -1.   -1.    0.;
0.   0.    1.   -1.    0.;
0.   0.   -1.    1.    0.;
0.   0.    1.    1.    0.;
0.   0.   -1.    0.   -1.;
0.   0.    1.    0.   -1.;
0.   0.   -1.    0.    1.;
0.   0.    1.    0.    1.;
0.   0.    0.   -1.   -1.;
0.   0.    0.    1.   -1.;
0.   0.    0.   -1.    1.;
0.   0.    0.    1.    1.;
0.   0.    0.    0.    0.;
0.   0.    0.    0.    0.;
0.   0.    0.    0.    0.];
    
E = gsort(E,"lr","i");
assert_checkequal(C,E);
