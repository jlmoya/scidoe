// Copyright (C) 2013 - Michael Baudin
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

function S=scidoe_squareform(varargin)
    // Format distance matrix
    //
    // Calling Sequence
    //    S=scidoe_squareform(D)
    //    D=scidoe_squareform(S)
    //    S=scidoe_squareform(D,"tomatrix")
    //    D=scidoe_squareform(S,"tovector")
    //
    // Parameters
    //    D : a 1-by-b matrix of doubles, the distance vector, where b = m*(m-1)/2
    //    S : a m-by-m matrix of doubles, the pairwise distances
    //
    // Description
    // <literal>S=scidoe_squareform(D)</literal> converts the pairwise distances 
    // D computed by <literal>scidoe_pdist</literal> into the square matrix S, 
    // so that S(i,j) is the distance between points i and j, 
    // for i,j=1,2,...,m. The diagonal part of S is zero.
    //
    // <literal>D=scidoe_squareform(S)</literal> converts the 
    // square matrix of distances S into the vector of distances 
    // D.
    //
    // By default, if D has a single entry (scalar), then convert it to 
    // a square matrix.
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
    // S = scidoe_squareform(D)
    // D = scidoe_squareform(S)
    //
    // // See when there is only one point.
    // X = [
    // 0.3185689    0.684731
    // ];
    // D1=scidoe_pdist(X)
    // S1=scidoe_squareform(D1)
    // D2=scidoe_squareform(S1)
    //
    // // See the action on a scalar zero
    // scidoe_squareform(0.)
    // scidoe_squareform(0.,"tovector")
    // scidoe_squareform(0.,"tomatrix")
    //
    // See also
    // scidoe_pdist
    //
    // Bibliography
    // http://www.mathworks.fr/fr/help/stats/squareform.html
    //
    // Authors
    // Copyright (C) 2013 - Michael Baudin

    [lhs, rhs]=argn()
    apifun_checkrhs("scidoe_squareform",rhs,1:2)
    apifun_checklhs("scidoe_squareform",lhs,1)
    //
    D=varargin(1)
    toopt=apifun_argindefault(varargin,2,[])
    //
    // Check Input Type
    apifun_checktype("scidoe_squareform",D,"D",1,"constant")
    if (toopt<>[]) then
        apifun_checktype("scidoe_squareform",toopt,"toopt",2,"string")
    end
    //
    // Check size
    b=size(D,"*")
    if (size(D,"r")<>size(D,"c"))
        // If the input matrix is not square, 
        // it must be a vector.
        apifun_checkvector("scidoe_squareform",D,"D",1,b)
    end
    if (toopt<>[]) then
        apifun_checkscalar("scidoe_squareform",toopt,"toopt",2)
    end
    // 
    // Check content
    apifun_checkgreq("scidoe_squareform",D,"D",1,0)
    if (toopt<>[]) then
        apifun_checkoption("scidoe_squareform",toopt,"toopt",2,["tomatrix","tovector"])
    end
    //
    // There was only one point
    if (D==[]) then
        if (toopt=="tomatrix"|toopt==[]) then
            S=0.
        else
            error(msprintf(gettext("%s: Must convert into a vector, but input argument is empty"),"scidoe_squareform"))
        end
        return
    end
    //
    if (b==1)
        // Convert scalar
        if (toopt=="tovector"|toopt==[]) then
            // This scalar must be zero
            if (D<>0.) then
                error(msprintf(gettext("%s: Must convert into a vector, but input argument is nonzero"),"scidoe_squareform"))
            end
            S=[]
        else
            S=[
            0. D
            D 0.
            ]
        end
    elseif (size(D,"r")==size(D,"c"))
        // Convert square matrix > vector
        if (toopt=="tomatrix") then
            error(msprintf(gettext("%s: Must convert into a matrix, but input argument is already a square matrix"),"scidoe_squareform"))
        end
        if (diag(D)<>diag(zeros(D))) then
            error(msprintf(gettext("%s: Must convert into a matrix, but input argument has a nonzero diagonal"),"scidoe_squareform"))
        end
        // Extract the lower triangle
        m=size(D,"r")
        k=1;
        for j=1:m
            S(k:k+m-j-1)=D(j+1:$,j)
            k=k+m-j
        end
        // Make the vector a row vector
        S=S'
    else
        // Convert vector > square matrix
        if (toopt=="tovector") then
            error(msprintf(gettext("%s: Must convert into a vector, but input argument is already a vector"),"scidoe_squareform"))
        end
        //
        D=D(:)
        m=ceil(sqrt(2*b))
        S=zeros(m,m)
        // Set the lower triangle
        k=1;
        for j=1:m
            S(j+1:$,j)=D(k:k+m-j-1)
            k=k+m-j
        end
        // Set the upper triangle
        S=S+tril(S)'
    end
endfunction
