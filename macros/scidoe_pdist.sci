// Copyright (C) 2012 - Maria Christopoulou
// Copyright (C) 2009 - 2010 - DIGITEO - Michael Baudin
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

function H = scidoe_pdist(X)
// Pairwise point distances of a matrix
//
// Calling Sequences
//    H = scidoe_pdist(X)
//
// Parameters
//    X : a m-by-n matrix of doubles, the input vector
//    H : a 1-by-b matrix of doubles, the distance vector, where b = m*(m-1)/2 the binomial coefficient
//
// Description
//    This function computes all the pairwise point distances of a matrix.
//    The number of combinations of the points in each variable (column) 
//    is equal to the binomial coefficient n*(n-1)/2.
//    
//    The resulted matrix contains the all pairwise point distances, arranged in the order (2,1), (3,1), ..., (m,1), (3,2), ..., (m,2), ..., (m,m–1)
//
//    The function implements only the Euclidean distance case.
//
// Examples
// // Compute the euclidean distance between all pairs of points
// // of the matrix
// X = [0.1629447    0.8616334  
//      0.5811584    0.3826752  
//      0.2270954    0.4442068  
//      0.7670017    0.7264718  
//      0.8253974    0.1937736]
//
// H = scidoe_pdist(X)
//
// References
// http://www.mathworks.com/help/toolbox/stats/pdist.html
// http://forge.scilab.org/index.php/p/specfun/source/tree/HEAD/macros/specfun_subset.sci
//
// Authors
// Copyright (C) 2012 - Maria Christopoulou
// Copyright (C) 2009 - 2010 - DIGITEO - Michael Baudin

    [lhs, rhs]=argn()
    apifun_checkrhs("scidoe_pdist",rhs,1)
    apifun_checklhs("scidoe_pdist",lhs,1)
    //
    // Check Input
    apifun_checktype("scidoe_pdist",X,"X",1,"constant")
    //
    [n,s]=size(X);
    b = (n*(n-1))/2; // Binomial Coefficient
    d = zeros(s,b);
    for i=1:s
        c = specfun_subset(x(:,i),2,'c') // Generate all combinations
        d(i,:) = ((c(1,:)-c(2,:)).^2)    // Compute the distance between all pairs of points in each variable
    end
    // 
    H = sqrt(sum(d,1));

endfunction
