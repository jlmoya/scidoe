// Copyright (C) 2012 - Michael Baudin
// Copyright (C) 2012 - Maria Christopoulou 
// Copyright (C) 2009 - Yann Collette
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

function B = scidoe_simplelinreg(X,Y)
    // Univariate linear regression
    //
    // Calling Sequence
    //   B = scidoe_simplelinreg(X,Y)
    //
    // Parameters
    // X is a m-by-1 matrix of doubles, the inputs, where m is the number of observations
    // Y is a m-by-1 matrix of doubles, the responses
	// B : a 1-by-2 matrix of doubles, where B(1) is the intercept and B(2) is the slope
    //
	// Description    
    // This function fits data in linear model y=B(1)+B(2)*x, 
	// where B(1) is the y-intercept and B(2) is the slope.
	//
	// The coefficients B are so that they 
    // are the best fit of the data in the least squares sense.
	//
    // We use Scilab's backslash operator, which uses Gaussian Elimination
	// with pivoting, making it faster and more accurate than using inv(A).
	//
    // Our system should be overdetermined, meaning having more 
	// equations than unknowns, otherwise the system doesn't have a solution.
    //
    // Examples
    // X = [
    //     57.   
    //     64.   
    //     69.   
    //     82.   
    //     92.   
    //     111.  
    //     114.  
    //     132.  
    //     144.  
    //     146.  
    // ]
    // Y = [
    //     121.  
    //     129.  
    //     140.  
    //     164.  
    //     188.  
    //     217.  
    //     231.  
    //     264.  
    //     289.  
    //     294.  
    // ]
    // B = scidoe_simplelinreg(X,Y)
	// expected = [4.8222564  1.9671389]
	// // Visually check the result:
    // scf();
    // plot(X,Y,"bo");
    // L = B(1)+B(2)*X;
    // plot(X,L,"r-")
    // legend(["Data","Linear Fit"]);
    // xtitle("Linear Regression","X","Y");
	//
	// // Create a dataset
	// grand("setsd",0);
	// // The number of observations
	// N = 100;
	// // The exact coefficients
	// B = [2;3]
	// // The input
	// Xmin = 50;
	// Xmax = 150;
	// X=grand(N,1,"uin",Xmin,Xmax);
	// X=gsort(X,"g","i");
	// // Compute the ouput from the input
	// Y = B(1)+B(2)*X;
	// // Add a normal noise to the output
	// sigma = 5;
	// e = grand(N,1,"nor",0,sigma);
	// Y = int(Y + e);
	// // Linear regression
	// B = scidoe_simplelinreg(X,Y)
	// // Compare B (exact) with B (estimate)
	// [B,B]
	// scf();
	// plot(X,Y,"bo");
	// L = B(1)+B(2)*X;
	// plot(X,L,"r-")
	// legend(["Data","Linear Fit"]);
	// xtitle("Linear Regression","X","Y");
    //
    // Authors
	// Copyright (C) 2012 - Michael Baudin
	// Copyright (C) 2012 - Maria Christopoulou 
	// Copyright (C) 2009 - Yann Collette

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
    A = [A,X]
    B=A\Y
endfunction
