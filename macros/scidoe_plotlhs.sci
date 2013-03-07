// Copyright (C) 2013 - Michael Baudin
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

function scidoe_plotlhs(H)
    // Plot a 2D LHS design
    //
    // Calling Sequence
    //    scidoe_plotlhs(H)
    //
    // Parameters
    //    H : a n-by-2 matrix of doubles, the LHS sampling
    //    
    // Description
    //    Plots a 2D Latin Hypercube Sampling.
    //
    // Examples
    // H = scidoe_lhsdesign(2,5);
    // scf();
    // scidoe_plotlhs(H)
    // xtitle("LHS design","X1","X2")
    //
    // Authors
    // Copyright (C) 2013 - Michael Baudin

    [lhs,rhs] = argn();
    apifun_checkrhs("scidoe_plotlhs",rhs,1)
    apifun_checklhs("scidoe_plotlhs",lhs,0:1)
    //
    // Check input
    //
    // Check type
    apifun_checktype("scidoe_plotlhs",H,"H",1,"constant")
    //
    // Check size
    n=size(H,"r")
    apifun_checkdims("scidoe_plotlhs",H,"H",1,[n,2])
    //
    // Check content
    // Nothing to do.
    //
    // Plot this design
    plot ( H(:,1) , H(:,2) , "bo" );
    cut = linspace(0,1,n+1);
    for i=1:n+1
        plot([cut(i) cut(i)],[0 1],"-")
    end
    for i=1:n+1
        plot([0 1],[cut(i) cut(i)],"-")
    end
endfunction
