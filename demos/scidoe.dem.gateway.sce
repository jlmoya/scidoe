// ====================================================================
// Yann COLLETTE
// Copyright 2009
// This file is released into the public domain
// ====================================================================
demopath = get_absolute_file_path("scidoe.dem.gateway.sce");

subdemolist = [
"LHS Design","demo_lhsdesign.sce"
"Two level Factorial Design","demo_ff2n.sce"
"Full Factorial Design","demo_fullfact.sce"
"Fractional Factorial Design","demo_fracfact.sce"
"Yates Algorithm","demo_yates.sce"
"Inverse Yates Algorithm","demo_ryates.sce"
"Box-Behnken Design","scidoe_bbdesign.sce"
"Central Composite Design","demo_ccdesign.sce"
"Star Design of Experiments","demo_star.sce"
"Simple Linear Regression","demo_simplelinreg.sce"
"Multivariate Linear Regression","demo_multilinreg.sce"
"Print Regression Statistics","demo_regressprint.sce"
];
subdemolist(:,2) = demopath + subdemolist(:,2);
// ====================================================================
