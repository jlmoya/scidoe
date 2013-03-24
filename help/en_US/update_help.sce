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
mprintf("Updating models\n");
funarray = [
  "scidoe_ryates"
  "scidoe_yates"
  ];
helpdir = fullfile(cwd,"models");
macrosdir = fullfile(cwd ,"..","..","macros");
demosdir = [];
modulename = "scidoe";
helptbx_helpupdate ( funarray , helpdir , macrosdir , demosdir , modulename , %t );
//
mprintf("Updating support\n");
funarray = [
  "scidoe_compare"
  "scidoe_plotcube"
  "scidoe_plotlhs"
  "scidoe_sort"
  "scidoe_sortdesign"
  "scidoe_squareform"
  "scidoe_string"
  ];
helpdir = fullfile(cwd,"support");
macrosdir = fullfile(cwd ,"..","..","macros");
demosdir = [];
modulename = "scidoe";
helptbx_helpupdate ( funarray , helpdir , macrosdir , demosdir , modulename , %t );
//
mprintf("Updating support\n");
funarray = [
  "scidoe_pdist"
  ];
helpdir = fullfile(cwd,"support");
macrosdir = fullfile(cwd ,"pseudomacros");
demosdir = [];
modulename = "scidoe";
helptbx_helpupdate ( funarray , helpdir , macrosdir , demosdir , modulename , %t );
//
mprintf("Updating designs\n");
funarray = [
  "scidoe_bbdesign"
  "scidoe_ccdesign"
  "scidoe_ff2n"
  "scidoe_fracfact"
  "scidoe_fullfact"
  "scidoe_lhsdesign"
  "scidoe_star"
  ];
helpdir = fullfile(cwd,"designs");
macrosdir = fullfile(cwd ,"..","..","macros");
demosdir = [];
modulename = "scidoe";
helptbx_helpupdate ( funarray , helpdir , macrosdir , demosdir , modulename , %t );
