// Copyright (C) - 2012 - Maria christopoulou
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

// References
//    http://www.itl.nist.gov/div898/handbook/pri/section3/pri3331.htm

// Generate a two level full factorial design with 2 factors
mprintf("\nSuppose in an experiment there are two factors, each one having two levels\n");
mprintf("Generate the two level factorial design:\n\n");
mprintf("H = scidoe_ff2n(2)\n");
nbvar = 2;
H = scidoe_ff2n(nbvar)
disp(H)
mprintf("\nThe total number of runs is 2^%d\n",nbvar)
mprintf("\nTo see this design graphically, we need to scale it in [-1,1]:\n\n")
mprintf("\nH = 2*scidoe(2)-1\n")
H = 2*scidoe_ff2n(nbvar)-1
disp(H)
h = scf(1);
scidoe_plotcube(2)
plot(H(:,1),H(:,2),'bo')
xtitle("Two level Factorial Design with Two factors")
//
// Generate a two level full factorial with 3 factors
mprintf("\nWe repeat the demonstration for three factors, each one having two levels\n");
mprintf("Generate the two level factorial design:\n\n");
mprintf("H = scidoe_ff2n(3)\n");
nbvar = 3;
H = scidoe_ff2n(nbvar)
disp(H)
mprintf("\nThe total number of runs is 2^%d\n",nbvar)
mprintf("\nTo see this design graphically, we need to scale it down first:\n\n")
mprintf("\nH = 2*scidoe(3)-1\n")
H = 2*scidoe_ff2n(nbvar)-1
disp(H)
h = scf(2);
param3d(H(:,1),H(:,2),H(:,3))
h.children.children.mark_mode="on";
h.children.children.line_mode="off";
h.children.children.mark_size=1;
scidoe_plotcube(3)
xtitle("Two level Factorial Design with Three factors","X1","X2","X3")
//
// Load this script into the editor
//
filename = 'demo_ff2n.sce';
dname = get_absolute_file_path(filename);
editor ( dname + filename );