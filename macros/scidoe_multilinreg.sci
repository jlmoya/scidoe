// Copyright (C) 2012 - Michael Baudin
// Copyright (C) 2012 - Maria Christopoulou 
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

function H = scidoe_multilinreg(X,Y)
    // Multivariate linear regression
    //
    // Calling Sequence
    //   H = scidoe_multilinreg(X,Y)
    //
    // Parameters
    // X : a m-by-n matrix of doubles, the inputs, where m is the number of observations and n is the number of variables.
    // Y : a m-by-1 matrix of doubles, the responses.
	// H : a n-by-1 matrix of doubles, the coefficients of the linear model.
    //
    // Description
    // This function computes a 
	// linear model with n independent variables x1, x2, ..., xn 
	// which best fit the data in the least squares sense. 
	//
    // The linear model we compute is 
	//
	// Y = H(1)*x1 + H(2)*x2 +...+ H(n)*xn.
    //
    // Examples
    // TODO
    //
    // Authors
	// Copyright (C) 2012 - Michael Baudin
	// Copyright (C) 2012 - Maria Christopoulou 

    // Check number of input arguments
    [lhs,rhs] = argn();
    apifun_checkrhs("scidoe_multilinreg",rhs,2);
    apifun_checklhs("scidoe_multilinreg",lhs,1);
	//
    // Check type
    apifun_checktype("scidoe_multilinreg",X,"X",1,"constant");
    apifun_checktype("scidoe_multilinreg",Y,"Y",2,"constant");
	//
    // Check size
    [m,n] = size(X)
    apifun_checkdims("scidoe_multilinreg",Y,"Y",2,[m 1]);
	//
    // Check content : nothing to do
	//
	// Proceed...
    A=ones(size(X,"r"),1)
    A=[A X]
    H = A\Y
endfunction
