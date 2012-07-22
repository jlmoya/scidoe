// Copyright (C) 2012 - Michael Baudin
// Copyright (C) 2012 - Maria Christopoulou 
// Copyright (C) 2009 - Yann Collette
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

function [B,bint,r,rint,stats,fullstats] = scidoe_multilinreg(varargin)
    // Multivariate linear regression
    //
    // Calling Sequence
    //   B = scidoe_multilinreg(Y,X)
    //   B = scidoe_multilinreg(Y,X,level)
    //   [B,bint] = scidoe_multilinreg(...)
    //   [B,bint,r] = scidoe_multilinreg(...)
    //   [B,bint,r,rint] = scidoe_multilinreg(...)
    //   [B,bint,r,rint,stats] = scidoe_multilinreg(...)
    //   [B,bint,r,rint,stats,fullstats] = scidoe_multilinreg(...)
    //
    // Parameters
    // Y : a m-by-1 matrix of doubles, the responses.
    // X : a m-by-n matrix of doubles, the inputs, where m is the number of observations and n is the number of variables.
    // level : a 1-by-1 matrix of doubles, the confidence level (default level=0.05, meaning that the default level is 95%). level is expected to be in the range [0.,0.5]
    // B : a n-by-1 matrix of doubles, the coefficients of the linear model.
    // bint : a 2-by-2 matrix of doubles, intervals with confidence level. The column bin(:,1) are the lower bounds and bin(:,2) are the upper bounds.
    // r : a m-by-1 matrix of doubles, the residuals Y-B(1)-B(2)*x
    // stats : a struct, the statistics, see below for details. 
    //
    // Description
    // This function computes a linear model with 
    // n independent variables x1, x2, ..., xn 
    // which best fit the data in the least squares sense. 
    //
    // The linear model we compute is 
    //
    // Y = B(1)*x1 + B(2)*x2 +...+ B(n)*xn.
    //
    // The fields in <literal>stats</literal> are 
	// presented in scidoe_regress.
    //
    // The residual r is :
    //
    // r == Y-X*B
    //
    // Examples
    // // We use dataset provided by NIST in
    // // http://www.itl.nist.gov/div898/strd/lls/data/LINKS/DATA/Longley.dat
    // // Longley.dat contains 1 Response Variable y, 6 Predictor Variables x 
    // // and 16 Observations.
    // X = [
    // 83.0 234289 2356 1590 107608 1947
    // 88.5 259426 2325 1456 108632 1948
    // 88.2 258054 3682 1616 109773 1949
    // 89.5 284599 3351 1650 110929 1950
    // 96.2 328975 2099 3099 112075 1951
    // 98.1 346999 1932 3594 113270 1952
    // 99.0 365385 1870 3547 115094 1953
    // 100.0 363112 3578 3350 116219 1954
    // 101.2 397469 2904 3048 117388 1955
    // 104.6 419180 2822 2857 118734 1956
    // 108.4 442769 2936 2798 120445 1957
    // 110.8 444546 4681 2637 121950 1958
    // 112.6 482704 3813 2552 123366 1959
    // 114.2 502601 3931 2514 125368 1960
    // 115.7 518173 4806 2572 127852 1961
    // 116.9 554894 4007 2827 130081 1962
    // ];
    // Y = [
    // 60323
    // 61122
    // 60171
    // 61187
    // 63221
    // 63639
    // 64989
    // 63761
    // 66019
    // 67857
    // 68169
    // 66513
    // 68655
    // 69564
    // 69331
    // 70551
    // ];
    // [B,bint,r,rint,stats,fullstats] = scidoe_multilinreg(Y,X)
	// // Print an analysis of variance table
    // scidoe_regressprint(fullstats)
    //
	// // Create an example with known coefficients
    // grand("setsd",0);
    // // The number of observations
    // N = 100;
    // // The exact coefficients
    // Bexact = [2;3;4]
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
    // Y = Bexact(1)+Bexact(2)*X1+Bexact(3)*X2;
    // // Add a normal noise to the output
    // sigma = 50;
    // e = grand(N,1,"nor",0,sigma);
    // Y = int(Y + e);
    // // Linear regression
    // B = scidoe_multilinreg(Y,X)
    // // Compare B (exact) with B (estimate)
    // [B,Bexact]
    // L = B(1)+B(2)*X(:,1)+B(3)*X(:,2);
    // // Check visually
    // scf();
    // plot(Y,L,"bo");
    // plot(Y,Y,"r-");
    // xtitle("Linear Regression","Data","Linear Fit");
    //
    // Authors
    // Copyright (C) 2012 - Michael Baudin
    // Copyright (C) 2012 - Maria Christopoulou 
    // Copyright (C) 2009 - Yann Collette
    //
    // Bibliography
    // "Introduction to probability and statistics for engineers and scientists.", Third Edition, Sheldon Ross, Elsevier Academic Press, 2004
    // http://en.wikipedia.org/wiki/Linear_regression
    // Octave's regress, William Poetra Yoga Hadisoeseno

    // Check number of input arguments
    [lhs,rhs] = argn();
    apifun_checkrhs("scidoe_multilinreg",rhs,2:3);
    apifun_checklhs("scidoe_multilinreg",lhs,1:6);
    //
    Y = varargin(1)
    X = varargin(2)
    level = apifun_argindefault ( varargin , 3 , 1.-0.95 )
    //
    // Check type
    apifun_checktype("scidoe_multilinreg",X,"X",1,"constant");
    apifun_checktype("scidoe_multilinreg",Y,"Y",2,"constant");
    apifun_checktype("scidoe_multilinreg",level,"level",3,"constant");
    //
    // Check size
    [m,n] = size(X)
    apifun_checkdims("scidoe_multilinreg",Y,"Y",2,[m 1]);
    apifun_checkscalar("scidoe_multilinreg",level,"level",3);
    //
    // Check content
    apifun_checkrange("scidoe_multilinreg",level,"level",3,0,0.5);
    //
    // Proceed...
    A=[ones(m,1) X]
    [B,bint,r,rint,stats,fullstats] = scidoe_regress(Y,A,level)
endfunction
