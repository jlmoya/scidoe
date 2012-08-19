// Copyright (C) 2012 - Maria Christopoulou
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

// <-- JVM NOT MANDATORY -->

// Tests are generated with the functions rsmDesign and star of R

// Generate an orthogonal star point doe with 3 factors, 2 center points in the factorial cube and 3 center points in the star points block
// design=rsmDesign(k=3,alpha="orthogonal",cc=2,cs=3)
// star(design)
B =[
-1.897367  0.000000  0.000000
 1.897367  0.000000  0.000000
 0.000000 -1.897367  0.000000
 0.000000  1.897367  0.000000
 0.000000  0.000000 -1.897367
 0.000000  0.000000  1.897367];
E = scidoe_star(3,"alpha","orthogonal","center",[2 3]);
assert_checkalmostequal(B,E,1.0e-4)
 
// Rotatable star doe
// design=rsmDesign(k=3,alpha="rotatable")
// star(design)
B = [
-1.681793  0.000000  0.000000
 1.681793  0.000000  0.000000
 0.000000 -1.681793  0.000000
 0.000000  1.681793  0.000000
 0.000000  0.000000 -1.681793
 0.000000  0.000000  1.681793];
E = scidoe_star(3,"alpha","rotatable");
assert_checkalmostequal(B,E,1.0e-4)
 