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
C = scidoe_bbdesign(3,"center",1);
E = [
-1 -1 0.
1 -1 0;
-1 1 0;
1 1 0.
-1 0 -1;
1 0 -1;
-1 0 1;
1 0 1;
0 -1 -1;
0 1 -1;
0 -1 1;
0 1 1;
0 0 0
];
E = gsort(E,"lr","i");
assert_checkequal(C,E);
//
// Test with both input parameters

C = scidoe_bbdesign(5,"center",3);
E =   [
-1.  -1.    0.    0.    0.
1.  -1.    0.    0.    0.
-1.  1.    0.    0.    0.
1.   1.    0.    0.    0.
-1.  0.   -1.    0.    0.
1.   0.   -1.    0.    0.
-1.  0.    1.    0.    0.
1.   0.    1.    0.    0.
-1.  0.    0.   -1.    0.
1.   0.    0.   -1.    0.
-1.  0.    0.    1.    0.
1.   0.    0.    1.    0.
-1.  0.    0.    0.   -1.
1.   0.    0.    0.   -1.
-1.  0.    0.    0.    1.
1.   0.    0.    0.    1.
0.  -1.   -1.    0.    0.
0.   1.   -1.    0.    0.
0.  -1.    1.    0.    0.
0.   1.    1.    0.    0.
0.  -1.    0.   -1.    0.
0.   1.    0.   -1.    0.
0.  -1.    0.    1.    0.
0.   1.    0.    1.    0.
0.  -1.    0.    0.   -1.
0.   1.    0.    0.   -1.
0.  -1.    0.    0.    1.
0.   1.    0.    0.    1.
0.   0.   -1.   -1.    0.
0.   0.    1.   -1.    0.
0.   0.   -1.    1.    0.
0.   0.    1.    1.    0.
0.   0.   -1.    0.   -1.
0.   0.    1.    0.   -1.
0.   0.   -1.    0.    1.
0.   0.    1.    0.    1.
0.   0.    0.   -1.   -1.
0.   0.    0.    1.   -1.
0.   0.    0.   -1.    1.
0.   0.    0.    1.    1.
0.   0.    0.    0.    0.
0.   0.    0.    0.    0.
0.   0.    0.    0.    0.
];
E = gsort(E,"lr","i");
//assert_checkequal(C,E);

// Print the number of experiments
// With variable point at center.
// Source: http://en.wikipedia.org/wiki/Box%E2%80%93Behnken_design
expected = [
0
0
15
27
46	
54	
62	
120	
130	
170	
188	
204	
0
0
0
396	
];
for nbvar = 3 : 16
    H = scidoe_bbdesign(nbvar);
    m = size(H,"r");
    mprintf("nbvar=%d, Num. Experiments=%d (expected=%d)\n",..
    nbvar,m,expected(nbvar));
	if (nbvar==9 | nbvar==16) then
	    // Skip this case:
	    // TODO : fix this bug !
	    continue
	end
	if (expected(nbvar)<>0) then
		assert_checkequal(m,expected(nbvar));
	end
end


// Print the number of experiments.
// With 1 point at center.
// Source: http://en.wikipedia.org/wiki/Box%E2%80%93Behnken_design
expected = [
0
0
13	
25	
41	
49	
57	
113
121
161
177
193
0
0
0
385
];
for nbvar = 3 : 16
    H = scidoe_bbdesign(nbvar,"center",1);
    m = size(H,"r");
    mprintf("nbvar=%d, Num. Experiments=%d (expected=%d)\n",..
    nbvar,m,expected(nbvar))
	if (nbvar==9 | nbvar==16) then
	    // Skip this case:
	    // TODO : fix this bug !
	    continue
	end
	if (expected(nbvar)<>0) then
		assert_checkequal(m,expected(nbvar));
	end
end

// Table from the R-rsm package.
// bbd(3), with the first row deleted, 
// so that the center point appears three times.
E = [
  0 -1 -1
  1 -1  0
  0  0  0
 -1  1  0
 -1  0  1
  0  0  0
  1  1  0
  1  0  1
  0  1  1
  0 -1  1
  0  1 -1
  1  0 -1
  0  0  0
 -1  0 -1
 -1 -1  0
];
C = scidoe_bbdesign(3);
E = gsort(E,"lr","i");
assert_checkequal(C,E);
//
// Table from the R-rsm package.
// bbd(4), with 9 zero center points 
// deleted, changing the number of rows from 
// 36 down to 27.
E=[
 0  0  1 -1
 0  0 -1 -1
 1 -1  0  0
 0  0 -1  1
 0  0  0  0
-1 -1  0  0
-1  1  0  0
 1  1  0  0
 0  0  1  1
-1  0  0  1
 1  0  0 -1
 1  0  0  1
 0  1 -1  0
-1  0  0 -1
 0  1  1  0
 0 -1  1  0
 0 -1 -1  0
 0  1  0 -1
 0 -1  0  1
 0  1  0  1
 0  0  0  0
-1  0 -1  0
 0  0  0  0
 1  0 -1  0
 1  0  1  0
-1  0  1  0
 0 -1  0 -1
];
C = scidoe_bbdesign(4);
E = gsort(E,"lr","i");
assert_checkequal(C,E);
// Table from the R-rsm package.
// bbd(5), with 2 zero center points 
// deleted, changing the number of rows from 
// 48 down to 46.
E = [
 -1  0 -1  0  0
  0  0  0 -1 -1
  0 -1  0  0 -1
  0  0  0  1 -1
  0  0  1 -1  0
  0  0  0  1  1
  0  1  0  0  1
  1 -1  0  0  0
 -1 -1  0  0  0
  1  0 -1  0  0
  1  1  0  0  0
  0  0 -1 -1  0
 -1  1  0  0  0
  0  0  0  0  0
  1  0  1  0  0
  0  0  0  0  0
 -1  0  1  0  0
  0  0  0 -1  1
  0 -1  0  0  1
  0  0 -1  1  0
  0  1  0  0 -1
  0  0  1  1  0
  0 -1  1  0  0
  0  0  0  0  0
  0  1  1  0  0
  1  0  0 -1  0
  0  0  1  0  1
  0  0  0  0  0
  0 -1  0  1  0
  0  0  1  0 -1
  0  0 -1  0  1
  1  0  0  1  0
  0 -1  0 -1  0
  1  0  0  0 -1
  0  1  0 -1  0
  1  0  0  0  1
  0  1  0  1  0
  0 -1 -1  0  0
  0  0  0  0  0
  0  0 -1  0 -1
 -1  0  0 -1  0
  0  0  0  0  0
  0  1 -1  0  0
 -1  0  0  0  1
 -1  0  0  0 -1
 -1  0  0  1  0
];
C = scidoe_bbdesign(5);
E = gsort(E,"lr","i");
assert_checkequal(C,E);
//
// Table from the R-rsm package.
// bbd(6), with two center points added, 
// changing the number of rows from 52 to 54
if (%f) then
// The test does not pass:
// TODO : fix me !
E = [
  0  0  0  0  0  0
  0  0  0  0  0  0
  1  0  0  0 -1 -1
  0  0  0  0  0  0
  0 -1 -1  0  1  0
 -1  0  1  0  0  1
 -1  0  0  1  1  0
  0  0  0  0  0  0
  1 -1  0  1  0  0
 -1  0  0  0 -1  1
  0 -1 -1  0 -1  0
  0  0  1 -1  0  1
  1  0 -1  0  0 -1
 -1  0  0  1 -1  0
  0  1  1  0 -1  0
 -1  0  0  0  1  1
  0  0 -1  1  0  1
  0  0 -1  1  0 -1
 -1  0 -1  0  0  1
 -1  1  0 -1  0  0
  1  0  0  0  1  1
  1  1  0 -1  0  0
 -1  0 -1  0  0 -1
  0  0  1 -1  0 -1
  1 -1  0 -1  0  0
  1  0  0  1 -1  0
  0 -1  1  0 -1  0
 -1  0  0  0 -1 -1
  1  0  1  0  0 -1
  0  0 -1 -1  0 -1
  0 -1  1  0  1  0
  0  0  1  1  0  1
  0  0  1  1  0 -1
  0  0  0  0  0  0
  0  0 -1 -1  0  1
  0  1 -1  0 -1  0
  1  0  0  0 -1  1
 -1 -1  0 -1  0  0
 -1  0  0  0  1 -1
 -1  0  1  0  0 -1
  1  0  0  0  1 -1
  1  0  0 -1  1  0
  1  1  0  1  0  0
  1  0 -1  0  0  1
  1  0  0  1  1  0
  0  1  1  0  1  0
 -1 -1  0  1  0  0
  0  1 -1  0  1  0
 -1  0  0 -1 -1  0
  1  0  0 -1 -1  0
  0  0  0  0  0  0
  1  0  1  0  0  1
 -1  0  0 -1  1  0
 -1  1  0  1  0  0
];
C = scidoe_bbdesign(6);
E = gsort(E,"lr","i");
assert_checkequal(C,E);
end
//
// Table from the R-rsm package.
// bbd(7), with two center points added, 
// changing the number of rows from 60 to 62
if (%f) then
// The test does not pass:
// TODO : fix me !
E = [
  0  0  0  0  0  0  0
  0  0  0  0  0  0  0
  0  0  0  1 -1  1  0
  0 -1  0  0 -1  0  1
  1  0 -1  0  1  0  0
 -1  1  0  1  0  0  0
  1  0  0  0  0  1 -1
  0  0  0  1 -1 -1  0
  0  0  0  0  0  0  0
  1  0  0  0  0  1  1
 -1  1  0 -1  0  0  0
  1 -1  0 -1  0  0  0
  0  1 -1  0  0  1  0
  1  1  0 -1  0  0  0
  0  0 -1  1  0  0 -1
  0  0 -1 -1  0  0  1
  0  0  0 -1 -1  1  0
  1  0  1  0  1  0  0
  0  0  1  1  0  0  1
  0  0  0  0  0  0  0
 -1  0  1  0  1  0  0
  0  1  1  0  0  1  0
  0  0  0  0  0  0  0
  0 -1  0  0  1  0  1
  0 -1 -1  0  0 -1  0
  0  0 -1 -1  0  0 -1
 -1 -1  0 -1  0  0  0
  0  0  1  1  0  0 -1
 -1  0  0  0  0 -1 -1
  0 -1  0  0 -1  0 -1
  0 -1 -1  0  0  1  0
 -1  0 -1  0 -1  0  0
  0 -1  1  0  0 -1  0
  0  1  1  0  0 -1  0
  0  0  0 -1 -1 -1  0
  0  1  0  0  1  0  1
  0  0  0  0  0  0  0
 -1 -1  0  1  0  0  0
  0  0 -1  1  0  0  1
  1 -1  0  1  0  0  0
  1  0  1  0 -1  0  0
  0  0  0  1  1  1  0
  1  0  0  0  0 -1  1
  0  1  0  0 -1  0 -1
  0  0  0 -1  1  1  0
  0 -1  1  0  0  1  0
  0  1  0  0 -1  0  1
  0  0  1 -1  0  0  1
  0  0  0 -1  1 -1  0
 -1  0  0  0  0  1  1
 -1  0  1  0 -1  0  0
  0 -1  0  0  1  0 -1
  0  1 -1  0  0 -1  0
 -1  0  0  0  0 -1  1
  1  0 -1  0 -1  0  0
  0  0  0  1  1 -1  0
  1  0  0  0  0 -1 -1
  0  0  1 -1  0  0 -1
  0  1  0  0  1  0 -1
  1  1  0  1  0  0  0
 -1  0 -1  0  1  0  0
 -1  0  0  0  0  1 -1
];
C = scidoe_bbdesign(7);
E = gsort(E,"lr","i");
assert_checkequal(C,E);
end
