// Copyright (C) 2012-2013 - Michael Baudin
// Copyright (C) 2012 - Maria Christopoulou
//
// This file is released under the terms of the CeCILL_V2 license : http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt


function scidoe_plotcube(varargin)   
    // Plots a d dimensions cube.
    //
    // Calling Sequence
    //    scidoe_plotcube(d)
    //    scidoe_plotcube(d,xrange)
    //
    // Parameters
    //    d : a 1-by-1 matrix of doubles, the number of dimensions of the cube. The available values are d=2 or d=3.
    //    xrange : a 1-by-2 or 2-by-1 matrix of doubles, the x range (default xrange=[-1,1]). xrange(2)>=xrange(1)
    //
    // Description
    // <literal>scidoe_plotcube(d)</literal> plots a d 
    // dimensions cube in [-1,1]^d (default).
    // 
    // <literal>scidoe_plotcube(d,xrange)</literal> plots a d 
    // dimensions cube in [xrange(1),xrange(2)]^d.
    //
    // Examples
    // // Plot a 2D cube in [-1,1]^2
    // scf();
    // scidoe_plotcube(2)
    //
    // // Plot a 3D cube in [-1,1]^3
    // scf();
    // scidoe_plotcube(3)
    //
    // // Plot a 2D cube in [0,1]^2
    // scf();
    // scidoe_plotcube(2,[0,1])
    //
    // // Plot a 3D cube in [0,1]^3
    // scf();
    // scidoe_plotcube(3,[0,1])
    //
    // Authors
    // Copyright (C) 2012-2013 - Michael Baudin
    // Copyright (C) 2012 - Maria Christopoulou

    [lhs, rhs]=argn()
    apifun_checkrhs("scidoe_plotcube",rhs,1:2)
    apifun_checklhs("scidoe_plotcube",lhs,1)
    //
    d=varargin(1)
    xrange=apifun_argindefault(varargin,2,[-1,1])
    //
    // Check type
    apifun_checktype("scidoe_plotcube",d,"d",1,"constant")
    apifun_checktype("scidoe_plotcube",xrange,"xrange",2,"constant")
    //
    // Check size
    apifun_checkscalar("scidoe_plotcube",d,"d",1)
    apifun_checkvector("scidoe_plotcube",xrange,"xrange",2,2)
    //
    // Check content
    apifun_checkflint("scidoe_plotcube",d,"d",1)
    apifun_checkgreq("scidoe_plotcube",xrange(2),"xrange(2)",2,xrange(1))
    //
    xmin=xrange(1)
    xmax=xrange(2)
    drawlater()
    if (d==2) then
        Omin = ones(1,2)*xmin;
        Omax = ones(1,2)*xmax;
        L = linspace(xmin,xmax,2)
        plot(L,Omin)
        plot(L,Omax)
        plot(Omin,L)
        plot(Omax,L)
    elseif (d==3) then
        Omin = ones(1,2)*xmin;
        Omax = ones(1,2)*xmax;
        L = linspace(xmin,xmax,2)
        param3d(L,Omax,Omax)
        param3d(L,Omax,Omin)
        param3d(L,Omin,Omax)
        param3d(L,Omin,Omin)
        param3d(Omax,L,Omax)
        param3d(Omax,L,Omin)
        param3d(Omin,L,Omax)
        param3d(Omin,L,Omin)
        param3d(Omax,Omax,L)
        param3d(Omax,Omin,L)
        param3d(Omin,Omax,L)
        param3d(Omin,Omin,L)
    else
        error(msprintf(gettext("%s: Dimension is not available"),"scidoe_plotcube"))
    end
    h = gcf()
    for i=1:2
        bounds = h.children.data_bounds(i,:)
        if (and(bounds==zeros(1,d))) then
            h.children.data_bounds(i,:) = -0.1
        else
            h.children.data_bounds(i,:) = (1+0.1)*bounds
        end
    end
    drawnow()
endfunction
