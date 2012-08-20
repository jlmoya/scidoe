// Copyright (C) 2012 - Maria Christopoulou
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

// Generate a full factorial design with 2 factors, with levels = [2 3]
mprintf("\nSuppose in an experiment there are two factors, each one having 2 and 3 levels.\n\n")
mprintf("Generate the full factorial design:\n\n")
mprintf("levels=[2 3]\n\n")
mprintf("H = scidoe_fullfact(levels)\n\n")
levels=[2 3];
H = scidoe_fullfact(levels)
disp(H)
mprintf("\nThe total number of runs is %d*%d\n",levels(1),levels(2))

// Generate a full factorial design with 3 factors with levels = [2 3 4]

mprintf("\nSuppose in an experiment there are three factors, each one having 2, 3 and 4 levels.\n\n")
mprintf("Generate the full factorial design:\n\n")
mprintf("levels=[2 3 4]\n\n")
mprintf("H = scidoe_fullfact(levels)\n\n")
levels=[2 3 4];
H = scidoe_fullfact(levels)
disp(H)
mprintf("\nThe total number of runs is %d*%d*%d\n\n",levels(1),levels(2),levels(3))
//
// Load this script into the editor
//
filename = "demo_fullfact.sce";
dname = get_absolute_file_path(filename);
editor ( fullfile(dname,filename) )