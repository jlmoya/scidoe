// Copyright (C) 2012 - Michael Baudin
// Copyright (C) 2012 - Maria Christopoulou 
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

function B = doetbx_ff2n(n)
    // Full factorial design with 2 levels
    //
    // Calling Sequence
    //   B=doetbx_ff2n(n)
    //
    // Parameters
    //   n : a 1-by-1 matrix of doubles, integer value, positive, the number of levels for each factor
    //   B : a m-by-n matrix of doubles, the experiments, where m=n*n
    //
    // Description
    // Computes a full factorial design with 2 levels for each factor.
    //
    // Examples
    // B=doetbx_ff2n(2)
    // B=doetbx_ff2n(3)
    // B=doetbx_ff2n(4)
    //
    // Authors
	// Copyright (C) 2012 - Michael Baudin
	// Copyright (C) 2012 - Maria Christopoulou 

	//
    // Check number of input arguments
    [lhs,rhs] = argn();
    apifun_checkrhs("doetbx_ff2n",rhs,1);
    apifun_checklhs("doetbx_ff2n",lhs,1);
	//
    // Check type
    apifun_checktype("doetbx_ff2n",n,"n",1,["constant"]);
	//
    // Check size
    apifun_checkscalar("doetbx_ff2n",n,"n",1);
	//
    // Check content
    apifun_checkflint("doetbx_ff2n",n,"n",1);
    apifun_checkgreq("doetbx_ff2n",n,"n",1,1);
	//
	// Proceed...
    B = specfun_combinerepeat ( [0,1] , n)'
endfunction
