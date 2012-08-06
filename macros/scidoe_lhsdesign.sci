// Copyright (C) 2012 - Michael Baudin
// Copyright (C) 2012 - Maria Christopoulou
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
    //    H = scidoe_lhsdesign(s,n,"criterion","maximin") // Not implemented yet
    //    H = scidoe_lhsdesign(s,n,"criterion","correlation") // Not implemented yet
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
    // Examples
    // // Compute a random LHS with 2 variables and 5 points
    // H = scidoe_lhsdesign(2,5)
    // // Plot this design // Example from http://forge.scilab.org/index.php/p/nisp/source/tree/99/macros/nisp_buildlhs.sci) )
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
    // cut = linspace(0,1,6);
    // for i=1:6
    // plot([cut(i) cut(i)],[0 1],"-")
    // end
    // for i=1:6
    // plot([0 1],[cut(i) cut(i)],"-")
    // end
    //
    // References
    // http://forge.scilab.org/index.php/p/nisp/source/tree/99/macros/nisp_buildlhs.sci
    // http://www.mathworks.com/help/toolbox/stats/lhsdesign.html
    //
    // Authors
    // Copyright (C) 2012 - Michael Baudin
    // Copyright (C) 2012 - Maria Christopoulou
    // Copyright (C) 2009 - Yann Collette

    s = varargin(1); // Number of variables
    n = varargin(2); // Number of points
    //
    [lhs,rhs] = argn();
    apifun_checkrhs("scidoe_lhsdesign",rhs,[2 4])
    apifun_checklhs("scidoe_lhsdesign",lhs,1)
    //
    // Check input
    apifun_checktype("scidoe_lhsdesign",s,"s",1,"constant")
    apifun_checktype("scidoe_lhsdesign",n,"n",2,"constant")
    apifun_checkscalar("scidoe_lhsdesign",s,"s",1)
    apifun_checkscalar("scidoe_lhsdesign",n,"n",2)
    apifun_checkflint("scidoe_lhsdesign",s,"s",1)
    apifun_checkflint("scidoe_lhsdesign",n,"n",2)    
    apifun_checkgreq("scidoe_lhsdesign",s,"s",1,1)
    apifun_checkgreq("scidoe_lhsdesign",n,"n",2,1)
    //
    // LHS design without improvement
    // This is part of the code of nisp_buildlhs.sci
    if (rhs==2) then
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
          sampling = zeros(n,s)
          for j = 1 : s
            order = grand(1,"prm",(1:n)')
            sampling ( 1 : n , j ) = rdpoints ( order , j )
          end
          H = sampling;
    end
    //
    // LHS using the centerpoints
    if (rhs==4) then
        criterion = apifun_argindefault(varargin,3,[])
        center = apifun_argindefault(varargin,4,[]);
        apifun_checktype("scidoe_lhsdesign",criterion,"criterion",3,"string");
        apifun_checktype("scidoe_lhsdesign",center,"center",4,"string");
        //

        // Set default values
        default.criterion = center;
        options = apifun_keyvaluepairs(default)
        options = apifun_keyvaluepairs(default,"criterion","center")
        //
        "center" == options.criterion;
        //
        // Generate an error when criterion is other than "centered"
        if (center ~= "center") then
            error("Criterion must be center")
        end        
        //
        // Choose the center points of the intervals (0,1/n),(1/n,2/n)...(1-1/n,1)
        cut = linspace(0,1,n+1);
        for i=1:n
            _center(i)=(cut(i)+cut(i+1))/2;
        end
        // Permute the center points in each variable
        for j=1:s
            B(:,j) = grand(1,"prm",_center);
        end
        H = B;
    end
    //
    // LHS with "criterion" = "correlation"
    // In this case, we compute the correlation between the columns
    // and choose the design with the minimum correlation
    // 

     
endfunction