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
    //    X : a m-by-n matrix of doubles, the input vector, where m is the number of points and n is the number of dimensions
    //    D : a 1-by-b matrix of doubles, the distance vector, where b = m*(m-1)/2
    //
    // Description
    // This function computes all the pairwise point distances of a matrix.
    // The number of combinations of the points in each variable (column) 
    // is equal to the binomial coefficient b=m*(m-1)/2.
    //    
    // The resulted matrix contains all pairwise point distances, 
    // arranged in the order (2,1), (3,1), ..., (m,1), (3,2), ..., (m,2), 
    // ..., (m,m–1).
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


    [lhs, rhs]=argn()
    apifun_checkrhs("scidoe_pdist",rhs,1)
    apifun_checklhs("scidoe_pdist",lhs,1)
    //
    // Check Input Type
    apifun_checktype("scidoe_pdist",X,"X",1,"constant")
    //
    [m,n]=size(X);
    // If X includes one sample point, the empty matrix is returned
    if (m<2) then
        D = [];
        return
    end
    //
    // if (m >= 2)
    // Binomial Coefficient
    b = (m*(m-1))/2; 
    d = zeros(n,b);
    for i=1:n
        // Generate all combinations
        c = specfun_subset(X(:,i),2,"c") 
        // Compute the distance between all pairs 
        // of points in each variable
        d(i,:) = ((c(1,:)-c(2,:)).^2)    
    end
    D = sqrt(sum(d,1));

endfunction
