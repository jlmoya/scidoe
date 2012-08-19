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
//    H = scidoe_star(nbvar)
//    [H, a] = scidoe_star(nbvar)
//    H = scidoe_star(nbvar,"Name","Parameter")
//    [H, a] = scidoe_star(nbvar,"Name","Parameter")
//
// Parameters
//    nbvar : a 1-by-1 matrix of doubles, positive integer, the number of variables of the experiments
//    Name : a 1-by-n matrix of strings. The options are "alpha" and "center". 
//    Parameter : a 1-by-n matrix of strings. If "Name"=="alpha", "Parameter" can be "orthogonal", "rotatable" or "faced" (default). If "Name"=="center", then "Parameter" is a 1-by-2 row vector of doubles, positive integers, indicating the number of center points assigned in each block of the response surface design. Default is [1 1]. See "Description" for more details.
//    H : a 2*nbvar-by-nbvar matrix of doubles, the design of experiments
//    a : a 1-by-1 matrix of doubles, a positive integer, the value of alpha
//
// Description
//    The function computes a star points design of experiments, used as an additional block of runs in Response Surface Designs (RSM).
//    Each factor is sequentially placed at +/-alpha, while all other factors are at zero. The value of alpha is determined by the user to give the design desirable properties.
//
//    A RSM design includes a factorial block of exeprimental runs and a block of center points.These points are used to calculate alpha, as follows:
//    If the design is orthogonal, alpha = sqrt(nbvar*(1+(nao/na))/(1+(nco/nc))), nc the factorial points, nco the center points added to the factorial design, na the axial points, nao the center points added to the axial points.
//    If the design is rotatable, alpha = nc^1/4, where nc=2^nbvar are the factorial points.
//    If the design is faced, then alpha=1.
//
//    The center points is a 1-by-2 row vector of doubles, positive integers, indicating the number of center points assigned in each block of the response surface design.
//    The default number of center points is [1,1], meaning 1 center point in the factorial block of the doe and 1 center point in the star points block.
//    Seting the number of center points is meaningful only for the "orthogonal" design.
//
// Examples
// // Star points placed on the face of a factorial design
// H = scidoe_star(3) or
// H = scidoe_star(3,"alpha","faced")
// // Star points block for orthogonal design with 3 factors
// H = scidoe_star(3,"alpha","orthogonal")
// // Star points block for rotatable design with 3 factors
// H = scidoe_star(3,"alpha,"rotatable")
// // Star doe with 2 center points in the factorial block and 3 center points in the star points block
// H = scidoe_star(3,"alpha","orthogonal","center",[2 3])
//
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
apifun_checkrhs("scidoe_star",rhs,1:5)
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
default.alpha = "faced"
default.center =[1 1];
options = apifun_keyvaluepairs(default,varargin(2:$))
//
// Set optional values
alphavalue = options.alpha
apifun_checktype("scidoe_star",alphavalue,"alphakey",3,"string")
apifun_checkoption("scidoe_star",alphavalue,"alphakey",3,["orthogonal" "rotatable" "faced"])
//
centervalue = options.center
apifun_checktype("scidoe_star",centervalue,"centerkey",5,"constant")

//
// Orthogonal Design
if (alphavalue == "orthogonal") then
nc = 2^nbvar; // Factorial points
nco = centervalue(1); // Center points to factorial
na=2*nbvar; // Axial points
nao= centervalue(2); // Center points to axial design
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
if (alphavalue == "faced") then
a=1;
end
//
//
H = eye(nbvar, nbvar);
H = [H -H]';
H=scidoe_sortdesign(a*H);
H=flipdim(H,2);

endfunction