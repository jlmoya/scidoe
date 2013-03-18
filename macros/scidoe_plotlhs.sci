// Copyright (C) 2013 - Michael Baudin
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

function scidoe_plotlhs(varargin)
    // Plot a LHS design
    //
    // Calling Sequence
    //    scidoe_plotlhs(H)
    //    scidoe_plotlhs(H,plotcuts)
    //    scidoe_plotlhs(H,plotcuts,plotcircles)
    //
    // Parameters
    // H : a n-by-2 or n-by-3 matrix of doubles, the LHS sampling
    // plotcuts : a 1-by-1 matrix of booleans, set to true to plot the horizontal and vertical cuts (default=%t)
    // plotcircles : a 1-by-1 matrix of booleans, set to true to plot the greatest circles without crossing (default=%f). This works only 2D.
    // 
    // Description
    // Plots a 2D or 3D Latin Hypercube Sampling.
    //
    // Add 
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
    // // 2D with circles
    // H = scidoe_lhsdesign(2,5);
    // scf();
    // scidoe_plotlhs(H,%f,%t)
    // xtitle("LHS design","X1","X2")
    // 
    // // 3D
    // H = scidoe_lhsdesign(3,5);
    // scf();
    // scidoe_plotlhs(H)
    // xtitle("LHS design","X1","X2")
    //
    // Authors
    // Copyright (C) 2013 - Michael Baudin

    function scidoe_plotEllipse(x,y,a,b,fill)
        // Plot an ellipse
        //
        // Calling Sequence
        //   bounds=scidoe_plotEllipse(x,y,a,b,fill)
        //
        // Parameters
        //   x : a 1-by-1 matrix of doubles, the x coordinate of the center
        //   y : a 1-by-1 matrix of doubles, the y coordinate of the center
        //   a : a 1-by-1 matrix of doubles, the x semi axis
        //   b : a 1-by-1 matrix of doubles, the y semi axis
        //   fill : a 1-by-1 matrix of doubles, integer value, the color
        //   bounds : a 2-by-2 matrix of doubles, [xmin,ymin;xmax,ymax] of the circle
        //
        // Description
        // Plots an ellipse with center (x,y) and semi axes a and b
        // The color "fill" is the argument of xfpoly: 
        // see the help of xfpoly for details.
        //
        // Examples
        // h=scf();
        // h.children.isoview="on";
        // scidoe_plotEllipse(0,0,2,2,1);
        // scidoe_plotEllipse(5,5,1,1,2);
        // scidoe_plotEllipse(2,-1,3,3,3);
        // drawaxis(x=-3:2:7,y=-4,dir='d',tics='v'); // X-axis
        // drawaxis(x=-3,y=-4:2:6,dir='l',tics='v'); // Y-axis
        // 
        // Authors
        // Copyright (C) 2013 - Michael Baudin

        n=100
        t=2*%pi*(0:n-1)/n
        xv=x+a*sin(t)
        yv=y+b*cos(t)
        xfpoly(xv,yv,fill);
    endfunction

    function scidoe_plotLHScircles(H)
        d = min(scidoe_pdist(H));
        a=d/2;
        b=a;
        fill=0;
        for i=1:n
            x=H(i,1);
            y=H(i,2);
            scidoe_plotEllipse(x,y,a,b,fill);
            e=gce();
            e.fill_mode='off'
        end
    endfunction

    [lhs,rhs] = argn();
    apifun_checkrhs("scidoe_plotlhs",rhs,1:3)
    apifun_checklhs("scidoe_plotlhs",lhs,0:1)
    //
    H=varargin(1)
    plotcuts=apifun_argindefault(varargin,2,%t)
    plotcircles=apifun_argindefault(varargin,3,%f)

    //
    // Check input
    //
    // Check type
    apifun_checktype("scidoe_plotlhs",H,"H",1,"constant")
    apifun_checktype("scidoe_plotlhs",plotcuts,"plotcuts",2,"boolean")
    apifun_checktype("scidoe_plotlhs",plotcircles,"plotcircles",3,"boolean")
    //
    // Check size
    n=size(H,"r")
    nbvar=size(H,"c")
    if (nbvar<>2) then
        apifun_checkdims("scidoe_plotlhs",H,"H",1,[n,3])
    end
    apifun_checkscalar("scidoe_plotlhs",plotcuts,"plotcuts",2)
    apifun_checkscalar("scidoe_plotlhs",plotcircles,"plotcircles",3)
    //
    // Check content
    if (nbvar==3&plotcircles) then
        error(msprintf(gettext("%s: Number of variables is 3, which is not compatible with plotcircles."),"scidoe_plotlhs"))
    end
    //
    // Plot this design
    if (nbvar==2) then
        plot ( H(:,1) , H(:,2) , "bo" );
        if (plotcuts) then
            cut = linspace(0,1,n+1);
            for i=1:n+1
                plot([cut(i) cut(i)],[0 1],"-")
            end
            for i=1:n+1
                plot([0 1],[cut(i) cut(i)],"-")
            end
        end
        if (plotcircles) then
            scidoe_plotLHScircles(H)
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
        if (plotcuts) then
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
    end
    h=gcf();
    h.children.isoview="on";
endfunction
