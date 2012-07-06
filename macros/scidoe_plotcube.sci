// Copyright (C) 2012 - Michael Baudin
// Copyright (C) 2012 - Maria Christopoulou
//
// This file is released under the terms of the CeCILL_V2 license : http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt


function scidoe_plotcube(d)   
    // Plots a d dimensions cube in [-1,1].
	//
    // Calling Sequence
    //    scidoe_plotcube(d)
    //
    // Parameters
    //    d : a 1-by-1 matrix of doubles, the number of dimensions of the cube. The available values are d=2 or d=3.
    //
    // Description
    //    Plots a d dimensions cube in [-1,1].
    //
    // Examples
    // // Plot a 2D cube:
    // scf();
    // scidoe_plotcube(2)
    //
    // // Plot a 3D cube:
    // scf();
    // scidoe_plotcube(3)
    //
    // Authors
    // Copyright (C) 2012 - Michael Baudin
    // Copyright (C) 2012 - Maria Christopoulou
    //
    // Check type
    apifun_checktype("scidoe_plotcube",d,"d",1,["constant"])
    //
    // Check size
    apifun_checkscalar("scidoe_plotcube",d,"d",1)
    //
    // Check content
    apifun_checkflint("scidoe_plotcube",d,"d",1)
    
    drawlater()
    if (d==2) then
            O = ones(1,2);
            L = linspace(-1,1,2)
            plot(L,O)
            plot(L,-O)
            plot(O,L)
            plot(-O,L)
    elseif (d==3) then
            O = ones(1,2);
            L = linspace(-1,1,2)
            param3d(L,O,O)
            param3d(L,O,-O)
            param3d(L,-O,O)
            param3d(L,-O,-O)
            param3d(O,L,O)
            param3d(O,L,-O)
            param3d(-O,L,O)
            param3d(-O,L,-O)
            param3d(O,O,L)
            param3d(O,-O,L)
            param3d(-O,O,L)
            param3d(-O,-O,L)
    else
            error("Dimension is not available")
    end
    h = gcf()
    h.children.data_bounds = (1+0.1)*h.children.data_bounds
    drawnow()
endfunction