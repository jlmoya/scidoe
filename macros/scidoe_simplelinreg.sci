// Copyright (C) 2012 - Michael Baudin
// Copyright (C) 2012 - Maria Christopoulou 
// Copyright (C) 2009 - Yann Collette
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

function [B,bint,r,stats] = scidoe_simplelinreg(varargin)
    // Univariate linear regression
    //
    // Calling Sequence
    //   B = scidoe_simplelinreg(X,Y)
    //   B = scidoe_simplelinreg(X,Y,level)
    //   [B,bint] = scidoe_simplelinreg(...)
    //   [B,bint,r] = scidoe_simplelinreg(...)
    //
    // Parameters
    // X is a m-by-1 or 1-by-m matrix of doubles, the inputs, where m is the number of observations. m must be greater than 2.
    // Y is a m-by-1 or 1-by-m matrix of doubles, the responses
    // level : a 1-by-1 matrix of doubles, the confidence level (default level=0.05, meaning that the default level is 95%). level is expected to be in the range [0.,0.5]
	// B : a 1-by-2 matrix of doubles, where B(1) is the intercept and B(2) is the slope
	// bint : a 2-by-2 matrix of doubles, intervals with confidence level. The column bin(:,1) are the lower bounds and bin(:,2) are the upper bounds.
	// r : a m-by-1 matrix of doubles, the residuals Y-B(1)-B(2)*x
	// stats : a struct, the statistics, see below for details. 
    //
	// Description    
    // This function fits data in linear model 
	//
	// Y=B(1)+B(2)*X + e
	//
	// where B(1) is the y-intercept, B(2) is the slope and 
	// e is a random normal error with mean zero and variance 
	// sigma2.
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
	// The fields in <literal>stats</literal> are :
	// 
	// stats.SSR : the sum of squares of the residuals, 
	// 
	// stats.sigma2 : the estimate the variance of the random normal error, 
	// 
	// stats.R2 : the coefficient of determination.
	//
	// On output, the sum of squares of the residuals stats.SSR 
	// is such that 
	//
	// stats.SSR == sum(r.^2)
	//
	// where the residual r is 
	//
	// r == Y-X*B
	//
    // The statistics stats.R2 is in the range [0,1]. 
	// On output, the coefficient of determination stats.R2 
	// measures the proportion of the variation in the response variables 
	// that is explained by the different input values. 
	// A value of stats.R2 near 1 indicates a good fit, while 
	// a value near zero indicates a poor fit. 
	//
	// The standardized residuals are 
	//
	// r/sqrt(stats.sigma2)
	//
	// When the model is correct, the standardized residuals 
	// are approximately randomly distributed with mean zero and 
	// 95% of their values in the range [-1.96,1.96].
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
	// // Compute a 95% confidence interval.
	// // Visually check the results. 
	// // Visually check the residuals. 
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
	// Height = Height(:);
	// Mass = Mass();
    // plot(Height,Mass,"bo");
    // L = B(1)+B(2)*Height;
    // plot(Height,L,"r-")
    // legend(["Data","Linear Fit"]);
    // xtitle("Linear Regression","Height","Mass");
	// // Compute the residuals
	// [B,bint,r] = scidoe_simplelinreg(Height,Mass);
	// // Visually see the residuals
    // scf();
    // plot(Height,r,"bo");
    // xtitle("Linear Regression","Height","Residuals");
	// // A quadratic fit would be better:
	// // we see a quadratic pattern in the residuals. 
	// // See the standardized residuals
	// [B,bint,r,stats] = scidoe_simplelinreg(Height,Mass);
	// disp(stats)
	// scf();
	// plot(Height,r/sqrt(stats.sigma2),"bo");
    // xtitle("Linear Regression","Height","Standard Residuals");
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
    apifun_checklhs("scidoe_simplelinreg",lhs,1:4);
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
    apifun_checkvector("scidoe_simplelinreg",X,"X",1,m);
    apifun_checkvector("scidoe_simplelinreg",Y,"Y",2,m);
    apifun_checkscalar("scidoe_simplelinreg",level,"level",3);
	//
    // Check content
    apifun_checkgreq("scidoe_simplelinreg",m,"m",1,2);
    apifun_checkrange("scidoe_simplelinreg",level,"level",3,0,0.5);
	//
	// Proceed...
	X = X(:)
	Y = Y(:)
	n = size(X,"*")
    A = [ones(n,1),X]
	// Workaround for the lack of accuracy of backslash
	// See http://bugzilla.scilab.org/show_bug.cgi?id=11379
	// We should use :
    // B = A\Y
	// but pinv (which uses the SVD) is more 
	// accurate in some cases.
	B = pinv(A)*Y
	// Compute confidence intervals
	r = Y-A*B
	SSR = sum(r.^2)
	P = 1-level/2
	Q = level/2
	T=cdft("T",n-2,P,Q)
	Xmean = mean(X)
	Ymean = mean(Y)
	SXX = sum((X-Xmean).^2)
	SYY = sum((Y-Ymean).^2)
	Bsig(1) = T*sqrt(SSR*sum(X.^2)/n/(n-2)/SXX)
	Bsig(2) = T*sqrt(SSR/(n-2)/SXX)
	bint(:,1) = B-Bsig
	bint(:,2) = B+Bsig
	// Create stats
	stats = struct()
	// Store SSR:
	// the sum of squares of the residuals
	stats.SSR = SSR
	// Compute R-squared :
	// the coefficient of determination.
	stats.R2 = 1-SSR/SYY
	// Compute sigma2:
	// an estimate of the variance of the 
	// normal(0,sigma2) error
	stats.sigma2 = SSR/(n-2)
endfunction
