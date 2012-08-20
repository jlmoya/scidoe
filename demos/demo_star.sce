// Copyright (C) 2012 - Maria Christopoulou
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

mprintf("\nThis function computes a star points design of experiments, used as an additional block in Central Composite Designs.\n")
mprintf("\nThe default Star points Design is ''Faced''\n")
mprintf("\nH = scidoe_star(3)\n")
[H,a] = scidoe_star(3)
mprintf("\na =")
disp(a)
mprintf("\nH =\n")
disp(H)
//
// Generate an orthogonal design with 3 variables
mprintf("\n\nGenerate an orthogonal design with 3 variables:\n\n")
mprintf("H = scidoe_star(3,''alpha'',''orthogonal'')\n\n")
[H,a] = scidoe_star(3,"alpha","orthogonal")
mprintf("\na =")
disp(a)
mprintf("\nH =\n")
disp(H)
//
// Set number of center point to change value of alpha
mprintf("\n\nWe can set the number of center points for the factorial block and the star points block of a Central Composite Design,\nchanging the value of alpha.\n")
mprintf("Scidoe_star.sci will not produce additional center points, but alpha will be changed:\n\n")
mprintf("H = scidoe_star(3,''alpha'',''orthogonal'',''center'',[2 3])\n\n")
[H,a] = scidoe_star(3,'alpha','orthogonal','center',[2 3])
mprintf("\na =")
disp(a)
mprintf("\nH =\n")
disp(H)
mprintf("\n\nSetting center point is meaningful only for orthogonal designs.")
//
// Generate a rotatable design for 4 variables
mprintf("\n\nGenerate a rotatable design for 4 variables\n")
mprintf("\nH = scidoe_star(4,''alpha'',''rotatable'')\n")
[H,a] = scidoe_star(4,"alpha","rotatable")
mprintf("\na =")
disp(a)
mprintf("\nH =\n")
disp(H)
//
// Load this script into the editor
//
filename = "demo_star.sce";
dname = get_absolute_file_path(filename);
editor ( fullfile(dname,filename) )