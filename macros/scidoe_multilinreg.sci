// Copyright (C) 2012 - Michael Baudin
// Copyright (C) 2012 - Maria Christopoulou 
// Copyright (C) 2009 - Yann Collette
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

function [B,bint,r,rint,stats] = scidoe_multilinreg(varargin)
    // Multivariate linear regression
    //
    // Calling Sequence
    //   B = scidoe_multilinreg(Y,X)
    //   B = scidoe_multilinreg(Y,X,level)
    //   B = scidoe_multilinreg(Y,X,level,verbose)
    //   [B,bint] = scidoe_multilinreg(...)
    //   [B,bint,r] = scidoe_multilinreg(...)
    //   [B,bint,r,rint] = scidoe_multilinreg(...)
    //   [B,bint,r,rint,stats] = scidoe_multilinreg(...)
    //
    // Parameters
    // Y : a m-by-1 matrix of doubles, the responses.
    // X : a m-by-n matrix of doubles, the inputs, where m is the number of observations and n is the number of variables.
    // level : a 1-by-1 matrix of doubles, the confidence level (default level=0.05, meaning that the default level is 95%). level is expected to be in the range [0.,0.5]
    // verbose : a 1-by-1 matrix of booleans, set to true to print an analysis of variance table (default verbose=%f)
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
    // The fields in <literal>stats</literal> are :
    //
    // stats.RegressionSS: the sum of squares of the regression
    //
    // stats.RegressionDof: the number of degrees of freedom of the regression
    //
    // stats.RegressionMean: the mean of the sum of squares of the regression
    //
    // stats.ResidualSS: the sum of squares of the residuals
    //
    // stats.ResidualDof: the number of degrees of freedom of the residuals
    //
    // stats.ResidualMean: the mean of the sum of squares of the residuals
    //
    // stats.F: the F statistics
    //
    // stats.pval : the p-value corresponding to the F statistics
    //
    // stats.Bstddev: a (n+1)-by-1 matrix of doubles, the standard deviation of B
    //
    // stats.R2: the R-squared statistics
    //
    // The residual r is :
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
    // The F statistics tests the null hypothesis 
    // B(1)==B(2)==...==B(n) agains the alternative 
    // hypothesis that there is one nonzero B(i), for 
    // some i=1,2,...,n. 
    // The F test does not tell which of the B(i) is nonzero, 
    // but only that one of them is linearly related 
    // to the response.
    // When the P-value for the F test statistic is small (e.g. 
    // less than 0.001), this provides an evidence against 
    // the null hypothesis. 
    // In other words, if the P-value is small, 
    // therefore one of the parameters B(i) is linearly related 
    // to the response. 
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
    // [B,bint,r,rint,stats] = scidoe_multilinreg(Y,X)
	// // Print an analysis of variance table
    // B = scidoe_multilinreg(Y,X,[],%t);
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
    apifun_checkrhs("scidoe_multilinreg",rhs,2:4);
    apifun_checklhs("scidoe_multilinreg",lhs,1:5);
    //
    Y = varargin(1)
    X = varargin(2)
    level = apifun_argindefault ( varargin , 3 , 1.-0.95 )
    verbose = apifun_argindefault ( varargin , 4 , %f )
    //
    // Check type
    apifun_checktype("scidoe_multilinreg",X,"X",1,"constant");
    apifun_checktype("scidoe_multilinreg",Y,"Y",2,"constant");
    apifun_checktype("scidoe_multilinreg",level,"level",3,"constant");
    apifun_checktype("scidoe_multilinreg",verbose,"verbose",4,"boolean");
    //
    // Check size
    [m,n] = size(X)
    apifun_checkdims("scidoe_multilinreg",Y,"Y",2,[m 1]);
    apifun_checkscalar("scidoe_multilinreg",level,"level",3);
    apifun_checkscalar("scidoe_multilinreg",verbose,"verbose",4);
    //
    // Check content
    apifun_checkrange("scidoe_multilinreg",level,"level",3,0,0.5);
    //
    // Proceed...
    A=[ones(m,1) X]
    // Workaround for the lack of accuracy of backslash
    // See http://bugzilla.scilab.org/show_bug.cgi?id=11379
    // We should use :
    // B = A\Y
    // but pinv (which uses the SVD) is more 
    // accurate in some cases.
    [U,S,V] = svd(A,"e");
    S = diag(S)
    tol = max(size(A)) * S(1) * %eps
    // Rank
    rnk=size(find(S>tol),"*")
    if rnk == 0 then
        IA = zeros(A');
    else
        V = V(:,1:rnk)
        U = U(:,1:rnk)
        IS = diag(ones(rnk,1)./S(1:rnk))
        IA = V* IS *U'
    end
    B = IA*Y
    // Compute residuals
    r = Y-A*B
    // Create stats
    stats = struct()
    // Residual stats
    Ymean = mean(Y)
    stats.RegressionSS = sum((A*B-Ymean).^2)
    stats.RegressionDof = n
    stats.RegressionMean = stats.RegressionSS/stats.RegressionDof
    // Regression stats
    stats.ResidualSS = sum(r.^2)
    stats.ResidualDof = m-n-1
    stats.ResidualMean = stats.ResidualSS/stats.ResidualDof
    // F statistics
    stats.F = stats.RegressionMean/stats.ResidualMean
    // Compute the p-value
    [ignored,Q]=cdff("PQ",stats.F,n,m-n-1)
    stats.pval = Q
    // The covariance matrix : C
    // CC is mathematically equal to inv(A'*A)
    CC = V*IS.^2*V'
    C = stats.ResidualMean*diag(CC)
    // The standard deviation of B
    stats.Bstddev = sqrt(C)
    // Compute R-squared :
    // the coefficient of determination.
    SYY = sum((Y-Ymean).^2)
    stats.R2 = 1-stats.ResidualSS/SYY
    // Compute 100*(1-level) confidence interval
    level = 0.05
    P = 1-level/2
    Q = level/2
    T=cdft("T",m-n-1,P,Q)
    Bsig = T*sqrt (C)
    bint(:,1) = B-Bsig
    bint(:,2) = B+Bsig
    // Compute confidence interval on r
    dof1 = m-n-2
    h = diag(A*IA)
    dr=T*sqrt ((stats.ResidualSS*(1-h)-(r.^2))/dof1)
    rint(:,1)=r-dr
    rint(:,2)=r+dr
    // 
    if (verbose) then
        fmtmax = max(format())
        fmtstr = msprintf("%ds",fmtmax)
        fmttmplate = msprintf("%%%s %%%s %%%s %%%s %%%s",..
        fmtstr,fmtstr,fmtstr,fmtstr,fmtstr)
        mprintf("Analysis of Variance Table\n");
        fmt = "%-12s"+fmttmplate+"\n"
        mprintf(fmt,..
        "Source","Degrees of","Sums of","Mean","F","P");
        mprintf(fmt,..
        "Of Var.","Freedom","Squares","Squares","Stat.","Value");
        mprintf(fmt,..
        "Regression",..
        string(stats.RegressionSS),..
        string(stats.RegressionDof),..
        string(stats.RegressionMean),..
        string(stats.F),..
        string(stats.pval));
        mprintf(fmt,..
        "Residual",..
        string(stats.ResidualSS),..
        string(stats.ResidualDof),..
        string(stats.ResidualMean),..
        "", ..
        "");
    end

endfunction
