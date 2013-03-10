// Copyright (C) 2013 - Michael Baudin
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

function scidoe_plotlhs(H)
    // Plot a LHS design
    //
    // Calling Sequence
    //    scidoe_plotlhs(H)
    //
    // Parameters
    //    H : a n-by-2 or n-by-3 matrix of doubles, the LHS sampling
    //    
    // Description
    //    Plots a 2D or 3D Latin Hypercube Sampling.
    //
    // Examples
    // // 2D
    // H = scidoe_lhsdesign(2,5);
    // scf();
    // scidoe_plotlhs(H)
    // xtitle("LHS design","X1","X2")
    // // Add labels:
    // xstring(H(:,1),H(:,2),string(1:5));
    // 
    // // 3D
    // H = scidoe_lhsdesign(3,5);
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
    nbvar=size(H,"c")
    if (nbvar<>2) then
        apifun_checkdims("scidoe_plotlhs",H,"H",1,[n,3])
    end
    //
    // Check content
    // Nothing to do.
    //
    // Plot this design
    if (nbvar==2) then
        plot ( H(:,1) , H(:,2) , "bo" );
        cut = linspace(0,1,n+1);
        for i=1:n+1
            plot([cut(i) cut(i)],[0 1],"-")
        end
        for i=1:n+1
            plot([0 1],[cut(i) cut(i)],"-")
        end
    else
        scidoe_plotcube(3,[0,1]);
        param3d(H(:,1),H(:,2),H(:,3));
        e=gce();
        e.mark_mode="on";
        e.mark_size=2;
        e.line_mode="off";
        e.mark_style=9;
        e.mark_foreground=2;
        n=5;
        cut = linspace(0,1,n+1);
        // On Z=0
        for i=1:n+1
            param3d([cut(i) cut(i)],[0 1],[0 0])
        end
        for i=1:n+1
            param3d([0 1],[cut(i) cut(i)],[0 0])
        end
        // On X=0
        for i=1:n+1
            param3d([0 0],[cut(i) cut(i)],[0 1])
        end
        for i=1:n+1
            param3d([0 0],[0 1],[cut(i) cut(i)])
        end
        // On Y=0
        for i=1:n+1
            param3d([cut(i) cut(i)],[0 0],[0 1])
        end
        for i=1:n+1
            param3d([0 1],[0 0],[cut(i) cut(i)])
        end
    end
endfunction
