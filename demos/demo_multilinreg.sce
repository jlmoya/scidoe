// Copyright (C) 2012 - Michael Baudin
// Copyright (C) 2012 - Maria Christopoulou 
// Copyright (C) 2009 - Yann Collette
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

// References
// "Introduction to probability and statistics for engineers and scientists.", 
// Third Edition, Sheldon Ross, Elsevier Academic Press, 2004
// Example 9.10a
// X1 : Population in Thousands
// X2 : Divorce Rate per 100,000
// X : [X1 X2]
// Y : Suicide Rate per 100,000
// Values computed from Octave 3.0.3

mprintf("\nScidoe_multilinreg.sci computes the coefficients and other statistical measures for the linear model Y = B(1)*x1 + B(2)*x2 +...+ B(n)*xn.\n")
mprintf("Input Data: X =\n")
X = [
679     30.4 
1420   34.1 
1349   17.2 
296     26.8 
6975   29.1 
323     18.7 
4200   32.6 
633     32.5 
];
disp(X)
mprintf("\nY =\n")

Y = [
11.6
16.1
9.3
9.1
8.4
7.7
11.3
8.4
];
disp(Y)
//
mprintf("\n\n[B,Bint,r,rint,stats,fullstats] = scidoe_multilinreg(Y,X)\n\n")
[B,Bint,r,rint,stats,fullstats] = scidoe_multilinreg(Y,X);
mprintf("B =\n")
disp(B)
mprintf("\nBint =\n")
disp(Bint)
mprintf("\nr")
disp(r)
mprintf("\nrint = \n")
disp(rint)
mprintf("\nstats=\n")
disp(stats)
mprintf("\nfullstats =\n")
disp(fullstats)
//
// Load this script into the editor
//
filename = "demo_multilinreg.sce";
dname = get_absolute_file_path(filename);
editor ( fullfile(dname,filename) )