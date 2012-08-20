// Copyright (C) 2012 - Maria Christopoulou
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

mprintf("\n\nA Central Composite Design is composed by a Factorial block, a star points block and a center points block.\nLets see how to call the function to get the desirable design:\n\n")
// Generate the default CCD
mprintf("The default CCD in Scidoe is circumscribed and orthogonal with 4 center points in the factorial block and 4 points in the star points block.\n")
disp('H = scidoe_ccdesign(3)')
H = scidoe_ccdesign(3);
disp(H)
//
// Generate an orthogonal CCD with 2 center points in the factorial block and 3 center points in the star points block.
mprintf("\n\nOrthogonal CCD with 2 center points in the factorial block and 3 center points in the star points block\n\n")
mprintf('H = scidoe_ccdesign(3,''center'',[2 3])\n')
H = scidoe_ccdesign(3,"center",[2 3]);
disp(H)
//
// Generate a rotatable CCD
mprintf("\nGenerate a rotatable CCD:\n\n")
mprintf('H = scidoe_ccdesign(3,''alpha'',''rotatable'')\n')
H = scidoe_ccdesign(3,"alpha","rotatable")
disp(H)
//
// Generate a Faced CCD
mprintf("\nGenerate a Faced CCD\n\n")
mprintf('H = scidoe_ccdesign(3,''type'',''faced'')\n')
H = scidoe_ccdesign(3,"type","faced")
disp(H)
//
// Generate an Inscribed CCD
mprintf("\nGenerate an Inscribed CCD\n\n")
mprintf('H = scidoe_ccdesign(3,''type'',''inscribed'')\n')
H = scidoe_ccdesign(3,"type","inscribed")
disp(H)
//
// Load this script into the editor
//
filename = "demo_ccdesign.sce";
dname = get_absolute_file_path(filename);
editor ( fullfile(dname,filename) )