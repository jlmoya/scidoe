// Copyright (C) 2012 - Michael Baudin
// Copyright (C) 2012 - Maria Christopoulou
// Copyright (C) 2009 - Yann Collette
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

function H = scidoe_ccdesign(varargin) // In progress
    // A Central Composite Design of Experiments
    //
    // Calling Sequence
    //     H = scidoe_ccdesign(nbvar)
    //     H = scidoe_ccdesign(nbvar,"Name1","Parameter1","Name2","Parameter2")
    //
    // Parameters
    //     nbvar : a 1-by-1 matrix of doubles, positive integer, the number of variables of the experiment
    //     Name : a 1-by-n matrix of strings. The options are "type", "alpha" and "center".
    //     Parameter : a 1-by-n matrix of strings, describing the design.
    //                 If Name=="type" then "Parameter" can be "circumscribed" (Default), "inscribed" or "faced"
    //                 If Name=="alpha", then "Parameter" can be either "orthogonal" (Default) or "rotatable"
    //                 If Name=="center", then "Parameter" is a positive integer, the number of center points in each block of the design
    // Description
    //     
    //     The function produces a Central Composite Design of experiments.
    //     A CCD is composed by a factorial block design, a block of axial (star) points and a matrix of center points (zeros)
    //     
    //     The CCD can be specified, as described in "Parameters".
    //     The default design is "circumscribed" and "orthogonal".
    //
    //     Circumscribed and Inscribed can be rotatable designs, but Faced cannot. For Faced CCD, alpha =1.
     //    If "type" is specified, while "alpha" is not, then default value is "orthogonal".
    //     If the design is orthogonal, alpha = sqrt(nbvar*(1+(nao/na))/(1+(nco/nc))), nc the factorial points, nco the center points added to the factorial design, na the axial points, nao the center points added to the axial points.
    //     If the design is rotatable, alpha = nc^1/4, where nc=2^nbvar are the factorial points.
    //
    //     The user can specify the number of center points in each block of the design (factorial and axial).
    //     If "Parameter" is 3, then there are 3 center points in the factorial block and 3 points in the axial points block.
    //     Default value is 4 (a total of 8 center points in the CCD).
    //     Specifying different number of center points for the factorial and the axial block, is not implemented yet.
    //
    //     There is no strict order in the input of the above options.
    //     scidoe_ccdesign(2,"type","inscribed","center",2) will output the same as scidoe_ccdesign(2,"center",2,"type","inscribed")
    //
    // Examples
    // // Circumscribed orthogonal design
    // H = scidoe_ccdesign(2)
    // // Inscribed orthogonal design
    // H = scidoe_ccdesign(3,"type","inscribed")
    // // Faced CCD
    // H = scidoe_ccdesign(2,"type","faced")
    // // Inscribed rotatable CC Design
    // H = scidoe_ccdesign(3,"type","inscribed","alpha","rotatable")
    // // TODO - Plot the design with scidoe_plotcube.sci
    // 
    // Bibliography:
    //    George E. P. Box, J. Stuart Hunter, William G. Hunter, "Statistics for experimenters Design,Innovation and Discovery", Second Edition, 2005
    //    http://en.wikipedia.org/wiki/Central_composite_design
    //    http://rgm2.lab.nig.ac.jp/RGM2/func.php?rd_id=rsm:ccd
    //    http://www.mathworks.com/help/toolbox/stats/f56635.html
    //    http://www.itl.nist.gov/div898/handbook/pri/section3/pri3361.htm
    //
    // Authors
    // Copyright (C) 2012 - Michael Baudin
    // Copyright (C) 2012 - Maria Christopoulou
    // Copyright (C) 2009 - Yann Collette

    [lhs, rhs] = argn()
    apifun_checkrhs("scidoe_ccdesign",rhs,1:7)
    apifun_checklhs("scidoe_ccdesign",lhs,1)

    nbvar = varargin(1)
    // Check type, size, content of nbvar
    apifun_checktype("scidoe_ccdesign",nbvar,"nbvar",1,"constant")
    apifun_checkscalar("scidoe_ccdesign",nbvar,"nbvar",1)
    apifun_checkgreq("scidoe_ccdesign",nbvar,"nbvar",1,2)
    apifun_checkflint("scidoe_ccdesign",nbvar,"nbvar",1)
    //
    // Set default CCD, alpha value and number of center points
    default.type = "circumscribed"
    default.alpha = "orthogonal"
    default.center = 4;
    options = apifun_keyvaluepairs(default,varargin(2:$))
    
    typevalue = options.type
    apifun_checktype("scidoe_ccdesign",typevalue,"typekey",3,"string")
    apifun_checkoption("scidoe_ccdesign",typevalue,"typekey",3,["circumscribed" "inscribed" "faced"])
    
    alphavalue = options.alpha
    apifun_checktype("scidoe_ccdesign",alphavalue,"alphakey",5,"string")
    apifun_checkoption("scidoe_ccdesign",alphavalue,"alphakey",5,["orthogonal" "rotatable"])

    centervalue = options.center
    apifun_checktype("scidoe_ccdesign",centervalue,"centerkey",7,"constant")

    // Orthogonal Design
    if (alphavalue == "orthogonal") then
                    [H2,a] = scidoe_star(nbvar,"alpha","orthogonal");
    end        
    //
    // Rotatable Design
     if (alphavalue == "rotatable") then
                    [H2,a] = scidoe_star(nbvar,"alpha","rotatable")
    end 
    //
    //
    // Inscribed CCD
    if (typevalue == "inscribed") then
            H1 = 2*scidoe_ff2n(nbvar)-1;
            H1 = H1./a; // Scale down the factorial points
            H2 = scidoe_star(nbvar)
    end
    // Faced CCD
    if (typevalue == "faced") then
           H2 = scidoe_star(nbvar); // Value of alpha is always 1 in Faced ccd
           H1 = 2*scidoe_ff2n(nbvar)-1;
    end
    // Circumscribed Design
    if (typevalue == "circumscribed") then
           H1 = 2*scidoe_ff2n(nbvar)-1;
    end
    //
    // Center points
    C1 = zeros(centervalue,nbvar);
    //
    // Central Composite Design
    H=[H1;C1;H2;C1];

endfunction
