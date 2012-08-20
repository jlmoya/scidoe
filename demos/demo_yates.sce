// Copyright (C) 2012 - Maria Christopoulou
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

// Bibliography
// "Statistics for experimenters Design,Innovation and Discovery", Second Edition, George E.P Box, J. Stuart Hunter, William Hunter, Wiley Series, 2005. 177-183, 191.

mprintf("\nYates algorithm computes the interaction and main effects from the responses of factorial design\n\n")
mprintf("Suppose the responses of an experiment are the following:\n\n")
mprintf("y = ")
y = [28 36 22 31 25 33 19 26]';
disp(y)
mprintf("\n[ef,id] = scidoe_yates(y)\n\n")
mprintf("ef = ")
[ef,id] = scidoe_yates(y)
disp(ef)
mprintf("\nid =")
disp(id)
mprintf("\nThe entry ef(1,1) is the average response of the experiment.\nThe following entries ef(2:$,1) are the effects of each interaction in the id matrix.\n")
mprintf("\nThe results are arranged in Yates order\n\n")
mprintf("Lets sort the effects:\n\n")
mprintf("H = scidoe_yates(y,%s)\n",'%T')
[ef,id] = scidoe_yates(y,%T)
disp(ef,id)
//
// Load this script into the editor
//
filename = "demo_yates.sce";
dname = get_absolute_file_path(filename);
editor ( fullfile(dname,filename) )