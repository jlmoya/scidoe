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
    // grand("setsd",0);
    // // The number of observations
    // N = 100;
    // // The exact coefficients
    // B = [2;3;4]
    // // The input 1
    // X1min = 50;
    // X1max = 150;
    // X1=grand(N,1,"uin",X1min,X1max);
    // X1=gsort(X1,"g","i");
    // // The input 2
    // X2min = -500;
    // X2max = -200;
    // X2=grand(N,1,"uin",X2min,X2max);
    // X2=gsort(X2,"g","i");
    // // Make the observations
    // X = [X1,X2];
    // // Compute the ouput from the input
    // Y = B(1)+B(2)*X1+B(3)*X2;
    // // Add a normal noise to the output
    // sigma = 50;
    // e = grand(N,1,"nor",0,sigma);
    // Y = int(Y + e);
    // // Linear regression
    // H = scidoe_multilinreg(X,Y)
    // // Compare B (exact) with H (estimate)
    // [B,H]
    // L = H(1)+H(2)*X(:,1)+H(3)*X(:,2);
    // // Check visually
    // scf();
    // plot(Y,L,"bo");
    // plot(Y,Y,"r-");
    // xtitle("Linear Regression","Data","Linear Fit");
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
	// Workaround for the lack of accuracy of backslash
	// See http://bugzilla.scilab.org/show_bug.cgi?id=11379
	// We should use :
    // H = A\Y
	// but 
	H = pinv(A)*Y
	// is more accurate.
endfunction
