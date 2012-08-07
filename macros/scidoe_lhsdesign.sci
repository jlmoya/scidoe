// Copyright (C) 2012 - Michael Baudin
// Copyright (C) 2012 - Maria Christopoulou
// Copyright (C) 2010 - 2011 - INRIA - Michael Baudin
// Copyright (C) 2009 - Yann Collette
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

function H = scidoe_lhsdesign(varargin)
    // Latin Hypercube Sampling
    //
    // Calling sequence
    //    H = scidoe_lhsdesign(s,n)
    //    H = scidoe_lhsdesign(s,n,"criterion","center")
    //
    // Parameters
    //    s : a 1-by-1 matrix of doubles, integer value, positive, the number of variables
    //    n : a 1-by-1 matrix of doubles, integer value, positive, the number of points
    //    
    // Description
    //    Computes a Latin Hypercube Sampling
    //    
    //    If no criterion is specified, the function computes a random LHS design,
    //    calling the nisp_buildlhs.sci macro of the NISP Toolbox http://forge.scilab.org/index.php/p/nisp/source/tree/99/macros/nisp_buildlhs.sci)
    //    If "criterion" = "center", then the function selects and permutes the center points of the intervals (0,1/n),(1/n,2/n)...(1-1/n,1)
    //
    // This function changes the state of the grand uniform random number generator.
    //
    // TODO : add  H = scidoe_lhsdesign(s,n,"criterion","maximin")
    //
    // TODO : add  H = scidoe_lhsdesign(s,n,"criterion","correlation")
    //
    // Examples
    // // Compute a random LHS with 2 variables and 5 points
    // H = scidoe_lhsdesign(2,5)
    // // Plot this design 
    // scf();
    // plot ( H(:,1) , H(:,2) , "bo" );
    // cut = linspace(0,1,6);
    // for i=1:6
    // plot([cut(i) cut(i)],[0 1],"-")
    // end
    // for i=1:6
    // plot([0 1],[cut(i) cut(i)],"-")
    // end
    // //
    // // Compute a LHS design with center points
    // H = scidoe_lhsdesign(2,5,"criterion","center")
    // // Plot this design
    // scf();
    // plot ( H(:,1) , H(:,2) , "bo" );
    // cut = linspace(0,1,6);
    // for i=1:6
    // plot([cut(i) cut(i)],[0 1],"-")
    // end
    // for i=1:6
    // plot([0 1],[cut(i) cut(i)],"-")
    // end
    //
    // Bibliography
	// McKay, M.D. Beckman, R.J. Conover, W.J. (May 1979). "A Comparison of Three Methods for Selecting Values of Input Variables in the Analysis of Output from a Computer Code" Technometrics (American Statistical Association) 21 (2): 239–245.
	// http://en.wikipedia.org/wiki/Latin_hypercube_sampling
    // http://www.mathworks.com/help/toolbox/stats/lhsdesign.html
    //
    // Authors
    // Copyright (C) 2012 - Michael Baudin
    // Copyright (C) 2012 - Maria Christopoulou
    // Copyright (C) 2010 - 2011 - INRIA - Michael Baudin
    // Copyright (C) 2009 - Yann Collette

    s = varargin(1); // Number of variables
    n = varargin(2); // Number of points
    //
    [lhs,rhs] = argn();
    apifun_checkrhs("scidoe_lhsdesign",rhs,[2 4])
    apifun_checklhs("scidoe_lhsdesign",lhs,1)
    //
    // Check input
    //
    // Check type
    apifun_checktype("scidoe_lhsdesign",s,"s",1,"constant")
    apifun_checktype("scidoe_lhsdesign",n,"n",2,"constant")
    //
    // Check size
    apifun_checkscalar("scidoe_lhsdesign",s,"s",1)
    apifun_checkscalar("scidoe_lhsdesign",n,"n",2)
    //
    // Check content
    apifun_checkflint("scidoe_lhsdesign",s,"s",1)
    apifun_checkflint("scidoe_lhsdesign",n,"n",2)    
    apifun_checkgreq("scidoe_lhsdesign",s,"s",1,1)
    apifun_checkgreq("scidoe_lhsdesign",n,"n",2,1)
    //
    // Classical LHS design
    if (rhs==2) then
        H = scidoe_lhsdesignClassic(s,n)
    end
    //
    // LHS with criterion
    if (rhs==4) then
        //
        // 1. Set the defaults
        default.criterion = "center";
        //
        // 2. Manage (key,value) pairs
        options = apifun_keyvaluepairs (default,varargin(3:$))
        //
        // 3. Get parameters
        criterionvalue = options.criterion
        //
        // Check criterion value
        apifun_checktype("scidoe_lhsdesign",criterionvalue,"criterionkey",4,"string");
        apifun_checkscalar("scidoe_lhsdesign",criterionvalue,"criterionkey",4);
        apifun_checkoption("scidoe_lhsdesign",criterionvalue,"criterionkey",4,"center");
        //
        // Center criterion
        H = scidoe_lhsdesignCenter(s,n)
    end
endfunction
function H = scidoe_lhsdesignClassic(s,n)
    // A classical LHS design
    cut = linspace ( 0 , 1 , n + 1 )'
    // Fill points uniformly in each interval
    u = grand(n,s,"unf",0,1)
    a = cut(1 : n)
    b = cut(2 : n+1)
    rdpoints = zeros(n,s)
    for j = 1 : s
        rdpoints(:,j)  = u(:,j) .* (b-a) + a
    end
    // Make the random pairings
    H = zeros(n,s)
    for j = 1 : s
        order = grand(1,"prm",(1:n)')
        H ( 1 : n , j ) = rdpoints ( order , j )
    end
endfunction
function H = scidoe_lhsdesignCenter(s,n)
    // A centered LHS design
    cut = linspace(0,1,n+1)';
    a = cut(1 : n)
    b = cut(2 : n+1)
    _center=(a+b)/2;
    // Make the random pairings
    H = zeros(n,s)
    for j=1:s
        H(:,j) = grand(1,"prm",_center);
    end
endfunction
