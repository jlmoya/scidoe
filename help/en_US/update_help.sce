// Copyright (C) 2012 - Michael Baudin
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt


////////////////////////////////////////////////////////////////////////////
cwd = get_absolute_file_path("update_help.sce");
mprintf("Working dir = %s\n",cwd);
//
mprintf("Updating library\n");
funarray = [
  "scidoe_ff2n"
  "scidoe_fullfact"
  "scidoe_multilinreg"
  "scidoe_simplelinreg"
  ];
helpdir = fullfile(cwd);
macrosdir = fullfile(cwd ,"..","..","macros");
demosdir = [];
modulename = "scidoe";
helptbx_helpupdate ( funarray , helpdir , macrosdir , demosdir , modulename , %t );
