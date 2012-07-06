
Design of Experiments Toolbox


Purpose
-------

The goal of this toolbox is to provide design of experiments 
techniques, along with functions for model building.

Features
--------

Factorial Design
 * scidoe_fullfact
 * scidoe_ff2n

Response Surface Designs

 * scidoe_bbdesign

Polynomial Regression
 * scidoe_multilinreg
 * scidoe_simplelinreg

Dependencies
------------

 * This module depends on the helptbx module (to update the help pages).
 * This module depends on the apifun module (>= v0.3).
 * This module depends on the assert module.
 * This module depends on the specfun module (>=v0.2).

Authors
-------

 * Copyright (C) 2012 - Michael Baudin
 * Copyright (C) 2012 - Maria Christopoulou 
 * Copyright (C) 2009 - Yann Collette

Licence
------

This toolbox is released under the CeCILL_V2 licence :

http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

TODO
----
 * Extend scidoe_multilinreg to manage other types of regressions.
   Split the stats output argument into stats vector (as in Octave) 
   and fullstats.
   Once done, remove scidoe_simplelinreg and rename it regress.
   Move the print of the analysis of variance table into a 
   separate scidoe_regressprint function to keep the 
   options simple.
 