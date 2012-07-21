// Copyright (C) 2012 - Maria Christopoulou
// Copyright (C) 2001 - Per A. Brodtkorb
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

// <-- JVM NOT MANDATORY -->

// "Statistics for experimenters Design,Innovation and Discovery",
// Second Edition, George E.P Box, J. Stuart Hunter, William Hunter, Wiley Series, 2005
// Table 5.2 - Pilot Plant Investigation, page 177
y = [60 72 54 68 52 83 45 80]';
ef_expected = [64.25
23
-5
1.5
1.5
10
0
0.5];

id_expected = [1.    0.    0.  
              2.    0.    0.  
              1.    2.    0.  
              3.    0.    0.  
              1.    3.    0.  
              2.    3.    0.  
              1.    2.    3.  ];
              
[ef_computed, id_computed] = scidoe_yates(y);
assert_checkequal(ef_expected, ef_computed);
assert_checkequal(id_expected, id_computed);
//
// Check sort_eff = %T option
// In this particular example, ef_expected is the same for both calls.
id_expected2 = [1.    0.    0.  
                2.    0.    0.  
                3.    0.    0.  
                1.    2.    0.  
                1.    3.    0.  
                2.    3.    0.  
                1.    2.    3.];
[ef_computed, id_computed2] = scidoe_yates(y,%T);
assert_checkequal(ef_expected, ef_computed);
assert_checkequal(id_expected2, id_computed2);

// "Statistics for experimenters Design,Innovation and Discovery",
// Second Edition, George E.P Box, J. Stuart Hunter, William Hunter, Wiley Series, 2005
// Table 5.2 - Yarn Experiment

y = [28 36 22 31 25 33 19 26]';
[ef_computed,id_computed] = scidoe_yates(y);

ef_expected = [27.5 8. -6. 0. -3.5 -0.5 -0.5 -0.5]';
                 
id_expected = [1.    0.    0.  
                   2.    0.    0.  
                   1.    2.    0.  
                   3.    0.    0.  
                   1.    3.    0.  
                   2.    3.    0.  
                   1.    2.    3.  ];
                   
assert_checkequal(ef_expected, ef_computed);
assert_checkequal(id_expected, id_computed);

// Check sort_eff = %T option

id_expected=[1.    0.    0.  
    2.    0.    0.  
    3.    0.    0.  
    1.    2.    0.  
    1.    3.    0.  
    2.    3.    0.  
    1.    2.    3.  ];
    
ef_expected=[27.5 8. -6. -3.5 0. -0.5 -0.5 -0.5]';
  
[ef_computed,id_computed] = scidoe_yates(y,%T);
assert_checkequal(ef_expected, ef_computed);
assert_checkequal(id_expected, id_computed);
