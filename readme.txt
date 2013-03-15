
Design of Experiments Toolbox


Purpose
-------

The goal of this toolbox is to provide design of experiments 
techniques, along with functions for model building.

Features
--------

Designs

 * scidoe_bbdesign — Box-Benhken design of experiments
 * scidoe_ccdesign — A Central Composite Design of Experiments
 * scidoe_ff2n — Full factorial design with 2 levels
 * scidoe_fracfact — Fractional Factorial Design
 * scidoe_fullfact — Full factorial design
 * scidoe_lhsdesign — Latin Hypercube Sampling
 * scidoe_star — Produces a star point design of experiments

Models

 * scidoe_ryates — Reverse Yates algorithm to give estimated responses
 * scidoe_yates — Calculates main and interaction effects using Yate's algorithm.

Support

 * scidoe_compare — The default comparison function used in the sort-merge.
 * scidoe_pdist — Pairwise point distances of a matrix
 * scidoe_plotcube — Plots a d dimensions cube in [-1,1].
 * scidoe_plotlhs — Plot a LHS design
 * scidoe_sort — A flexible sorting function.
 * scidoe_sortdesign — Sort the experiments of a design of experiments
 * scidoe_squareform — Format distance matrix
 * scidoe_string — Sort the experiments of a design of experiments

Dependencies
------------

 * This module depends on Scilab (>= v5.4).
 * This module depends on the helptbx module (to update the help pages).
 * This module depends on the apifun module (>= v0.3).
 * This module depends on the specfun module (>=v0.2).
 * This module depends on the stixbox module (>=v2.2).

Authors
-------

 * Copyright (C) 2012 - 2013 - Michael Baudin
 * Copyright (C) 2012 - Maria Christopoulou 
 * Copyright (C) 2009 - Yann Collette
 * Copyright (C) 2001 - Per A. Brodtkorb

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
 
