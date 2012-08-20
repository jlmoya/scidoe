// Copyright (C) 2012 - Maria Christopoulou
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

// Generate a fractional factorial design
mprintf("\nIn fractional factorial designs we represent some of the factors as interactions of the main factors of the experiment.\nThe total number of runs is 2^k, where k is the number of the main factors.\n\n")
mprintf("Suppose we have an experiment with three factors and we set the third factor equal to the interaction of the first two:\n\n")
gen = "a b ab"
mprintf("gen = %s\n",gen)
disp('H = scidoe_fracfact(gen)')
H = scidoe_fracfact(gen)
disp(H)
mprintf("\nTotal number of runs is 2^2")
//
// Uppercase letters
mprintf("\n\nThe same with uppercase letters:\n\n")
gen = "A B AB"
mprintf("gen = %s\n",gen)
disp('H = scidoe_fracfact(gen)')
H = scidoe_fracfact(gen);
disp(H)
//
// Use of the operators "-" and "+"
mprintf("\n\nHere we use the operators %s and %s :\n\n",'-','+')
gen = "a b c -ab +ac"
mprintf("gen = %s\n",gen)
disp('H = scidoe_fracfact(gen)')
H = scidoe_fracfact(gen);
disp(H)
mprintf("\nTotal number of runs is 2^3\n\n")
//
// Load this script into the editor
//
filename = "demo_fracfact.sce";
dname = get_absolute_file_path(filename);
editor ( fullfile(dname,filename) )