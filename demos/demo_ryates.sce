// Copyright (C) 2012 - Maria Christopoulou
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

// Bibliography
// "Statistics for experimenters Design,Innovation and Discovery", Second Edition, George E.P Box, J. Stuart Hunter, William Hunter, Wiley Series, 2005. 177-183, 191.

mprintf("\nInverse Yates algorithm uses the average response, main and interaction effects of an experiment to estimate the response.\n\n")
mprintf("Suppose the response of an experiment is \n\ny = ")

y = [28 36 22 31 25 33 19 26]';
disp(y)
mprintf("\nUsing scidoe_yates.sci, we compute the main and interaction effects:\n\n")
mprintf("ef = scidoe_yates(y)\n\n")
mprintf("ef = \n")
disp(ef)
mprintf("\nWe input the ef vector in scidoe_ryates.sci:\n\n")
mprintf("y = scidoe_ryates(ef)\n")
mprintf("\ny =")
disp(y)
mprintf("\nThe function calculated the initial response.\n\n")
//
// Load this script into the editor
//
filename = "demo_ryates.sce";
dname = get_absolute_file_path(filename);
editor ( fullfile(dname,filename) )