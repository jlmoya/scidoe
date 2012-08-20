// Copyright (C) 2012 - Michael Baudin
// Copyright (C) 2012 - Maria Christopoulou
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

mprintf("\nScidoe_bbdesign.sci generates Box behnken Designs, where the number of center points depend on the number of variables.\n\n")
mprintf("Lets see how to call this function:\n")
mprintf("\nGenerate a Box Behnken design for 3 variables:\n\n")
mprintf("H = scidoe_bbdesign(3)\n")
H = scidoe_bbdesign(3)
disp(H)
// Generate Box Behnken Design for 4 variables
mprintf("\n\nGenerate a Box-Behnken design for 4 variables:\n\n")
mprintf("H = scidoe_bbdesign(4)\n")
H = scidoe_bbdesign(4)
disp(H)
//
// Define one center point
mprintf("\nGenerate a Box Behnken Design for 5 variables with one center point:\n\n")
mprintf("H = scidoe_bbdesign(5,''center'',1)\n")
H = scidoe_bbdesign(5,'center',1)
disp(H)
//
// Load this script into the editor
//
filename = "demo_bbdesign.sce";
dname = get_absolute_file_path(filename);
editor ( fullfile(dname,filename) )