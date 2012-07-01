// Copyright (C) 2012 - Michael Baudin
// Copyright (C) 2012 - Maria Christopoulou 
// Copyright (C) 2009 - Yann Collette
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

function [B,bint,r] = scidoe_simplelinreg(varargin)
    // Univariate linear regression
    //
    // Calling Sequence
    //   B = scidoe_simplelinreg(X,Y)
    //   B = scidoe_simplelinreg(X,Y,level)
    //   [B,bint) = scidoe_simplelinreg(...)
    //
    // Parameters
    // X is a m-by-1 or 1-by-m matrix of doubles, the inputs, where m is the number of observations. m must be greater than 2.
    // Y is a m-by-1 or 1-by-m matrix of doubles, the responses
    // level : a 1-by-1 matrix of doubles, the confidence level (default level=0.05, meaning that the default level is 95%). level is expected to be in the range [0.,0.5]
	// B : a 1-by-2 matrix of doubles, where B(1) is the intercept and B(2) is the slope
	// bint : a 2-by-2 matrix of doubles, intervals with confidence level. The column bin(:,1) are the lower bounds and bin(:,2) are the upper bounds.
	// r : a m-by-1 matrix of doubles, the residuals Y-B(1)-B(2)*x
    //
	// Description    
    // This function fits data in linear model y=B(1)+B(2)*x, 
	// where B(1) is the y-intercept and B(2) is the slope.
	//
	// The coefficients B are so that they 
    // are the best fit of the data in the least squares sense.
	//
    // The system should be overdetermined, meaning having more 
	// equations than unknowns, otherwise the system doesn't have a solution. 
	// In other words, m must be greater or equal than 2. 
	// Otherwise, an error is generated.
	//
	// The entries in bint are a confidence interval for the 
	// entries in B.
	// In other words, B(1) in [bint(1,1),bint(1,2)] with probability 1-level and 
	// B(2) in [bint(2,1),bint(2,2)] with probability 1-level.
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
	// // Computed a 95% confidence interval
	// // Reference :
	// // http://en.wikipedia.org/wiki/Simple_linear_regression
	// Height = [
	// 1.47	1.50	1.52	1.55	1.57	..
	// 1.60	1.63	1.65	1.68	1.70	..
	// 1.73	1.75	1.78	1.80	1.83
	// ];
	// Mass =[
	// 52.21	53.12	54.48	55.84	57.20	..
	// 58.57	59.93	61.29	63.11	64.47	..
	// 66.28	68.10	69.92	72.19	74.46
	// ];
	// [B,bint] = scidoe_simplelinreg(Height,Mass);
	// Bexpected = [
	// -39.062
	// 61.272
	// ];
	// Bintexpected = [
	// -45.4 -32.7
	// 57.4 65.1
	// ];
	// // Visually check the result:
    // scf();
    // plot(X,Y,"bo");
    // L = B(1)+B(2)*X;
    // plot(X,L,"r-")
    // legend(["Data","Linear Fit"]);
    // xtitle("Linear Regression","Height","Mass");
	// // Compute the residuals
	// [B,bint,r] = scidoe_simplelinreg(Height,Mass);
	// // Visually see the residuals
    // scf();
    // plot(X,r,"bo");
    // xtitle("Linear Regression","Height","Residuals");
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
	//
	// Bibliography
	// "Introduction to probability and statistics for engineers and scientists.", Third Edition, Sheldon Ross, Elsevier Academic Press, 2004
	// http://en.wikipedia.org/wiki/Simple_linear_regression


    // Check number of input arguments
    [lhs,rhs] = argn();
    apifun_checkrhs("scidoe_simplelinreg",rhs,2:3);
    apifun_checklhs("scidoe_simplelinreg",lhs,1:3);
	//
	X = varargin(1)
	Y = varargin(2)
    level = apifun_argindefault ( varargin , 3 , 1.-0.95 )
	//
    // Check type
    apifun_checktype("scidoe_simplelinreg",X,"X",1,"constant");
    apifun_checktype("scidoe_simplelinreg",Y,"Y",2,"constant");
    apifun_checktype("scidoe_simplelinreg",level,"level",3,"constant");
	//
    // Check size
    m = size(X,"*")
    apifun_checkvector("scidoe_multilinreg",X,"X",1,m);
    apifun_checkvector("scidoe_multilinreg",Y,"Y",2,m);
    apifun_checkscalar("scidoe_multilinreg",level,"level",3);
	//
    // Check content
    apifun_checkgreq("scidoe_multilinreg",m,"m",1,2);
    apifun_checkrange("scidoe_multilinreg",level,"level",3,0,0.5);
	//
	// Proceed...
	X = X(:)
	Y = Y(:)
	n = size(X,"*")
    A=ones(n,1)
    B=zeros(n,1)
    A = [A,X]
    B=A\Y
	// Compute confidence intervals
	r = Y-B(1)-B(2).*X
	SSR = sum(r.^2)
	level = 0.05
	P = 1-level/2
	Q = level/2
	T=cdft("T",n-2,P,Q)
	xmean = mean(X)
	Sxx = sum((X-xmean).^2)
	Bsig(1) = T*sqrt(SSR*sum(X.^2)/n/(n-2)/Sxx)
	Bsig(2) = T*sqrt(SSR/(n-2)/Sxx)
	bint(:,1) = B-Bsig
	bint(:,2) = B+Bsig
endfunction
