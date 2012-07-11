// ====================================================================
// Yann COLLETTE
// Copyright 2009
// This file is released into the public domain
// ====================================================================
demopath = get_absolute_file_path("scidoe.dem.gateway.sce");

subdemolist = [
"Two level Factorial Design",	"scidoe_ff2n.dem.sce"
"Full Factorial Design",	"scidoe_fullfact.dem.sce"
"Yate's Algorithm",		"scidoe_yates.dem.sce"
"Inverse Yate's Algorithm",	"scidoe_ryates.dem.sce"
"Box-Behnken Design",		"scidoe_bbdesign.dem.sce"
"Simple Linear Regression",	"scidoe_simplelinreg.dem.sce"
];
subdemolist(:,2) = demopath + subdemolist(:,2);
// ====================================================================
