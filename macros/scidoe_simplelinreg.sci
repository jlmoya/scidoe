// Copyright (C) 2012 - Michael Baudin
// Copyright (C) 2012 - Maria Christopoulou 
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

function H = scidoe_simplelinreg(X,Y)
    // Univariate linear regression
    //
    // Calling Sequence
    //   H = scidoe_simplelinreg(X,Y)
    //
    // Parameters
    // X is a m-by-1 matrix of doubles, the inputs, where m is the number of observations
    // Y is a m-by-1 matrix of doubles, the responses
	// H : a 1-by-2 matrix of doubles, where H(1) is the slope and H(2) is the intercept
    //
	// Description    
    // This function fits data in linear model y=H(1)*x+H(2), 
	// where H(1) is the slope and H(2) is the y-intercept.
	//
	// The coefficients H are so that they 
    // are the best fit of the data in the least squares sense.
	//
    // We use Scilab's backslash operator, which uses Gaussian Elimination
	// with pivoting, making it faster and more accurate than using inv(A).
	//
    // Our system should be overdetermined, meaning having more 
	// equations than unknowns, otherwise the system doesn't have a solution.
    //
    // Examples
    // TODO
    //
    // Authors
	// Copyright (C) 2012 - Michael Baudin
	// Copyright (C) 2012 - Maria Christopoulou 

    // Check number of input arguments
    [lhs,rhs] = argn();
    apifun_checkrhs("scidoe_simplelinreg",rhs,2);
    apifun_checklhs("scidoe_simplelinreg",lhs,1);
	//
    // Check type
    apifun_checktype("scidoe_simplelinreg",X,"X",1,"constant");
    apifun_checktype("scidoe_simplelinreg",Y,"Y",2,"constant");
	//
    // Check size
    [m,n] = size(X)
    apifun_checkdims("scidoe_multilinreg",X,"X",1,[m 1]);
    apifun_checkdims("scidoe_multilinreg",Y,"Y",2,[m 1]);
	//
    // Check content : nothing to do
	//
	// Proceed...
	X = X(:)
	Y = Y(:)
    A=ones(length(X),1)
    B=zeros(length(Y),1)
    A = [X,A]
    H=A\Y
endfunction
