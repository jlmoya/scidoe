// Copyright (C) 2013 - Michael Baudin
// Copyright (C) 2012 - Maria Christopoulou
// Copyright (C) 2009 - 2010 - DIGITEO - Michael Baudin
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

function D = scidoe_pdist(X)
    // Pairwise point distances of a matrix
    //
    // Calling Sequence
    //    D = scidoe_pdist(X)
    //
    // Parameters
    //    X : a n-by-s matrix of doubles, the input vector, where n is the number of points and s is the number of dimensions
    //    D : a 1-by-b matrix of doubles, the distance vector, where b = n*(n-1)/2
    //
    // Description
    // This function computes all the pairwise point distances of a matrix.
    // The number of combinations of the points in each variable (column) 
    // is equal to the binomial coefficient b=n*(n-1)/2.
    //    
    // The resulted matrix contains all pairwise point distances, 
    // arranged in the order (2,1), (3,1), ..., (n,1), (3,2), ..., (n,2), 
    // ..., (n,m–1).
    //
    //    If input matrix X includes only one sample point, 
    // then an empty matrix is returned.
    //
    // The function implements only the Euclidean distance case.
    //
    // Examples
    // // Compute the euclidean distance between all pairs 
    // // of points of the matrix
    // X = [
    //      0.1629447    0.8616334  
    //      0.5811584    0.3826752  
    //      0.2270954    0.4442068  
    //      0.7670017    0.7264718  
    //      0.8253974    0.1937736
    // ]
    // D = scidoe_pdist(X)
    //
    // See also
    // scidoe_squareform
    //
    // Bibliography
    // http://www.mathworks.com/help/toolbox/stats/pdist.html
    // http://forge.scilab.org/index.php/p/specfun/source/tree/HEAD/macros/specfun_subset.sci
    //
    // Authors
    // Copyright (C) 2012 - Maria Christopoulou
    // Copyright (C) 2009 - 2010 - DIGITEO - Michael Baudin
    // Copyright (C) 2013 - Michael Baudin



endfunction
