// Copyright (C) 2012 - Michael Baudin
// Copyright (C) 2012 - Maria Christopoulou 
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

function B = scidoe_fullfact(levels)
    // Full factorial design with 2 levels
    //
    // Calling Sequence
    //   B = scidoe_fullfact(levels)
    //
    // Parameters
    //   levels : a n-by-1 or 1-by-n matrix of doubles, integer value, positive, the number of levels for each factor i, for i=1,2,...,n
    //   B : a m-by-n matrix of doubles, the experiments, where m=prod(levels)
    //
    // Description
    // Computes a full factorial design with prescribed number of 
	// levels for each factor. 
	// In other words, for each factor i, the number of levels is 
	// levels(i), for i=1,2,...,n.
    //
    // Examples
    // // Create a full factorial design with :
	// // 2 levels for the first factor
	// // 3 levels for the second factor
    // B=scidoe_fullfact([2 3])
    //
    // // Create a full factorial design with :
	// // 2 levels for the first factor
	// // 3 levels for the second factor
	// // 4 levels for the third factor
    // B=scidoe_fullfact([2 3 4])
    //
    // Authors
	// Copyright (C) 2012 - Michael Baudin
	// Copyright (C) 2012 - Maria Christopoulou 

    // Check number of input arguments
    [lhs,rhs] = argn();
    apifun_checkrhs("scidoe_fullfact",rhs,1);
    apifun_checklhs("scidoe_fullfact",lhs,1);
	//
    // Check type
    apifun_checktype("scidoe_fullfact",levels,"levels",1,["constant"]);
	//
    // Check size
    apifun_checkvector("scidoe_fullfact",levels,"levels",1);
	//
    // Check content
    apifun_checkflint("scidoe_fullfact",levels,"levels",1);
    apifun_checkgreq("scidoe_fullfact",levels,"levels",1,1);
	//
	// Proceed...
    args = list();
    for i = 1:size(levels,"*")
        args($+1)=(1:levels(i));
    end
    B = specfun_combine ( args(1:$) )'
endfunction
