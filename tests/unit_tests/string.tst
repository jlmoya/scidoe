// Copyright (C) 2012 - Michael Baudin
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

// <-- JVM NOT MANDATORY -->
// A DOE with no obvious structure.
D = [
-1 1 0
-1 -1 0
0 0 0
1 -1 0
0 -1 1
-1 0 -1
0 1 1
-1 0 1
1 0 1
0 -1 -1
1 0 -1
0 1 -1
1 1 0
];
S = scidoe_string(D);
E = [
"0"  "0"  "0"  
"0"  "*"  "*" 
"*"  "0"  "*" 
"*"  "*"  "0" 
];
assert_checkequal(E,S);
