// Copyright (C) 2012 - Michael Baudin
// Copyright (C) 2012 - Maria Christopoulou
// Copyright (C) 2009 - Yann Collette
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution. The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

function [H, a] = scidoe_star(varargin)
// Produces a star point design of experiments
//
// Calling Sequences
// H = scidoe_star(nbvar)
// [H, a] = scidoe_star(nbvar)
// H = scidoe_star(nbvar,"Name","Parameter")
// [H, a] = scidoe_star(nbvar,"Name","Parameter")
//
// Parameters
// nbvar : a 1-by-1 matrix of doubles, positive integer, the number of variables of the experiments
// Name : a 1-by-n matrix of strings. The only option is "alpha"
// Parameter : a 1-by-n matrix of strings, the desirable type of design, which defines the value of alpha. Computation of alpha is described in "Description". Default is "one".
// H : a 2*nbvar-by-nbvar matrix of doubles, the design of experiments
// a : a 1-by-1 matrix of doubles, a positive integer, the value of aplha
//
// Description
// The function computes a star points design of experiments, used as an additional block of runs in Central Composite Designs (CCD).
// Each factor is sequentially placed at +/-alpha, while all other factors are at zero. The value of alpha is determined by the designer, because some values may give the design desirable properties.
//
// A CCD also includes a factorial block of exeprimental runs and a block of center points.These points are used to calculate alpha, as follows:
// If the design is orthogonal, alpha = sqrt(nbvar*(1+(nao/na))/(1+(nco/nc))), nc the factorial points, nco the center points added to the factorial design, na the axial points, nao the center points added to the axial points.
// If the design is rotatable, alpha = nc^1/4, where nc=2^nbvar are the factorial points.
// If the design is faced, then alpha=1.
//
// Example
// // Star points placed on the face of a factorial design
// H = scidoe_star(3) or
// H = scidoe_star(3,"alpha","one")
// // Star points block for orthogonal design with 3 factors
// H = scidoe_star(3,"alpha","orthogonal")
// // Star points block for rotatable design with 3 factors
// H = scidoe_star(3,"alpha,"rotatable")

//
// Bibliography
// http://en.wikipedia.org/wiki/Central_composite_design
// http://www.itl.nist.gov/div898/handbook/pri/section3/pri3361.htm
//
// Authors
// Copyright (C) 2012 - Michael Baudin
// Copyright (C) 2012 - Maria Christopoulou
// Copyright (C) 2009 - Yann Collette

[lhs,rhs] = argn()
apifun_checkrhs("scidoe_star",rhs,1:3)
apifun_checklhs("scidoe_star",lhs,1:2)

nbvar=varargin(1)
//
// Check type, size, content of nbvar
apifun_checktype("scidoe_star",nbvar,"nbvar",1,"constant")
apifun_checkscalar("scidoe_star",nbvar,"nbvar",1)
apifun_checkgreq("scidoe_star",nbvar,"nbvar",1,1)
apifun_checkflint("scidoe_star",nbvar,"nbvar",1)
//
// Choose alpha to produce a design with desirable properties
// Set default value
default.alpha = "one"
options = apifun_keyvaluepairs(default,varargin(2:$))
//
// Set optional values
alphavalue = options.alpha
apifun_checktype("scidoe_star",alphavalue,"alphakey",3,"string")
apifun_checkoption("scidoe_star",alphavalue,"alphakey",3,["orthogonal" "rotatable" "one"])
//
// Orthogonal Design
if (alphavalue == "orthogonal") then
nc = 2^nbvar; // Factorial points
nco = 4; // Center points to factorial
na=2*nbvar; // Axial points
nao=4; // Center points to axial design
a = sqrt((nbvar*(1+(nao/na)))/(1+(nco/nc))); // Value of alpha in orthogonal design
end
//
// Rotatable Design
if (alphavalue == "rotatable") then
nc = 2^nbvar; // Number of Factorial points
a = nc^(1/4); // Value of alpha in rotatable design
end
//
// Star points are at the center of each face of the factorial
if (alphavalue == "one") then
a=1;
end
//
//
H = eye(nbvar, nbvar);
H = [H -H]';
H=scidoe_sortdesign(a*H);
H=flipdim(H,2);

endfunction