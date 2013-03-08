// Copyright (C) 2012 - Michael Baudin
// Copyright (C) 2010 - DIGITEO - Michael Baudin
// Copyright (C) 2008-2009 - INRIA - Michael Baudin
// Copyright (C) 2008 - ENPC - Bruno Pincon
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt


function [ x , indices ] = scidoe_sort ( varargin )
    //   A flexible sorting function.
    //
    // Calling Sequence
    //   y = scidoe_sort ( x )
    //   y = scidoe_sort ( x , direction )
    //   y = scidoe_sort ( x , direction , compfun )
    //   y = scidoe_sort ( x , direction , compfun , callback )
    //   [ y , indices ]  = scidoe_sort ( ... )
    //
    // Parameters
    //   x : a matrix of doubles or a list, the values to sort.
    //   direction : a 1x1 matrix of booleans, the direction of sort. If direction=%t, increasing sorting is used. If direction=%f, decreasing sorting is used. (Default direction=%t, i.e., increasing). If direction=[], then default direction=%t is used.
    //   compfun : a function or a list, the comparison function. If not provided, or if compfun=[], then the default value compfun=scidoe_compare is used.
    //   callback : a function, an output function. If not provided, or if callback=[], then the default value callback=[] is used, meaning that no function is called back.
    //   y : a matrix of doubles or a list, the sorted values
    //   indices : a matrix of floating point integers, the permutation necessary to get the sorted values. We always have and(x(indices)==y).
    //
    // Description
    //   Sort a matrix or a list in increasing order.
    //
    //   If x is a list, the user must provide a comparison function, as 
    //   no default comparison function is available for this data type.
    //
    //   If no comparison function is given, 
    //   uses the default operator "<".
    //   If compfun is a function, it must have the header :
    //   <programlisting>
    //   order = compfun ( x , y )
    //   </programlisting>
    //   where order=-1 if x < y, order=0 if x==y, order +1 if x > y.
    //
    //   If compfun is the list (myfun,a1,a2,...), its first element myfun is expected to 
    //   be a function which must have the header:
    //   <programlisting>
    //   order = myfun ( x , y , a1, a2, ... )
    //   </programlisting>
    //   where the remaining elements a1, a2, ... are automatically added 
    //   to the calling sequence.
    //
    //   If callback is a function, it must have the header :
    //   <programlisting>
    //   callback ( status , x , imin , imax )
    //   </programlisting>
    //   where status is a string, x is the current data, imin and imax are
    //   floating point integers.
    //   The values of status are status="start","in","out","stop".
    //   The "start" status appears only once, at the very begining.
    //   The "stop" status appears only once, at the very end.
    //   The "in" status appears when we enter in the recursive function.
    //   The "out" status appears when we leave the recursive function.
    //   The imin and imax variables contain the global indices
    //   which are currently modified in the recursive call.
    //   These indices correspond to the values which are to be
    //   modified in the level 0 array to be sorted, as
    //   opposed to the array currently being processed at the
    //   current  level.
    //   These indices are necessary, since the function basically
    //   know only the current values to be processed, which do not
    //   reflect their original positions.
    //
    //   If callback is the list (mycbk,a1,a2,...), its first element mycbk is expected to 
    //   be a function which must have the header:
    //   <programlisting>
    //   mycbk ( status , x , imin , imax , a1, a2, ... )
    //   </programlisting>
    //   where the remaining elements a1, a2, ... are automatically added 
    //   to the calling sequence.
    //
    //   The algorithm is a merge-sort, based on a recursive 
    //   call of the function, with increasingly small data.
    //
    // This implementation avoids the overhead caused by arguments checking.
    // For that purpose, the argument checking is done at the main level once for all.
    // Then it uses an internal recursive function without
    // any checking.
    //
    // TODO : add a "unique" option, which discards equal elements.
    //
    // Examples
    //   // Sort x in increasing order
    //   x = [4 5 1 2 3]
    //   y = scidoe_sort ( x )
    //
    //   // Get the indices
    //   x = [4 5 1 2 3]
    //   [y,indices] = scidoe_sort ( x )
    //   x(indices)==y
    //
    // // Sort x in decreasing order
    // x = [4 5 1 2 3];
    // y = scidoe_sort ( x , %f )
    //
    //   // Use a customized comparison function:
    //   // sort into decreasing order.
    // function order = myorder ( x , y )
    //   if ( x < y ) then
    //     order = 1
    //   elseif ( x==y ) then
    //     order = 0
    //   else 
    //     order = -1
    //   end
    // endfunction
    //   x = [4 5 1 2 3]
    //   // Notice that we use the default direction (i.e. increasing)
    //   // by setting direction to the empty matrix [].
    //   y = scidoe_sort ( x , [] , myorder )
    //
    //   // Use a customized comparison function:
    //   // sort real values into increasing order, 
    //   // with an absolute tolerance.
    // function order = myrealorder ( x , y , atol )
    //   if ( abs(x-y)<atol ) then
    //     order = 0
    //   elseif ( x < y ) then
    //     order = -1
    //   else 
    //     order = 1
    //   end
    // endfunction
    //   x = [1,2,1.2347,1.2346,1.2345,3,4]
    //   atol = 1.e-3
    //   compfun = list(myrealorder,atol)
    //   y = scidoe_sort ( x , [] , compfun )
    //   // Notice that the basic comparison function would 
    //   // produce a difference sorted matrix.
    //   scidoe_sort ( x )
    //   // See that this is a stable sort.
    //   // Notice that the equal values are not moved.
    //   y = scidoe_sort ( x , %f , compfun )
    //
    // // Check that we can sort lists.
    // // We consider list of elements, where each element
    // // is a couple. The order depends on the first element (denoted "x"),
    // // then the second element (denoted "y"), in case of tie.
    // z = list();
    // z(1) = list(6,5);
    // z(2) = list(5,4);
    // z(3) = list(4,3);
    // z(4) = list(3,2);
    // z(5) = list(2,1);
    // z(6) = list(1,0);
    // sci2exp(zsorted)
    // // Use a customized comparison function:
    // // sort into increasing order.
    // function order = myorder2 ( a , b )
    //   ax = a(1)
    //   ay = a(2)
    //   bx = b(1)
    //   by = b(2)
    //   if ( ax == bx ) then
    //     if ( ay == by ) then
    //       order = 0
    //     elseif ( ay < by ) then
    //       order = -1
    //     else
    //       order = 1
    //     end
    //   elseif ( ax < bx ) then
    //     order = -1
    //   else
    //     order = 1
    //   end
    // endfunction
    // zsorted = scidoe_sort(z,[],myorder2);
    // sci2exp(zsorted)
    //
    // // Use a callback to print the status of sorting
    // function mycb ( status , x , imin , imax )
    //   mprintf("%s: (%d,%d) : %s\n",status,imin,imax,sci2exp(x))
    // endfunction
    // // Sort this into [1 2 3 4 5]
    // x = [4 5 1 2 3];
    // // Notice that we set compfun = [], so that the default 
    // // comparison function is used.
    // y = scidoe_sort ( x , [] , [] , mycb );
    //
    // // Display a graphical demo of the sorting process
    // function mycb2 ( status , x , imin , imax )
    //   n = length(x)
    //   if ( status == "start") then
    //     h = scf()
    //     xp = 1:n
    //     yp = x
    //     plot(xp,yp,"b*")
    //     titlestr = "Merge sort n="+string(n)+..
    //     " indices = ("+string(imin)+","+string(imax)+")"
    //     xtitle(titlestr,"Rank","Value")
    //   elseif ( status == "out") then
    //     h = gcf()
    //     h.children.children.children.data(imin:imax,2) = x
    //     titlestr = "Merge sort n="+string(n)+..
    //     " indices = ("+string(imin)+","+string(imax)+")"
    //     h.children.title.text = titlestr
    //   end
    // endfunction
    // N = 50;
    // // Take the values 1,2,...,50 and permute them randomly
    // x = (1:50)';
    // x = grand(1,"prm",x);
    // y = scidoe_sort ( x , [] , [] , mycb2 );
    //
    // Authors
    // Bruno Pincon, 2008, "Quelques tests de rapidite entre differents logiciels matriciels"
    // Michael Baudin, DIGITEO, 2009-2010 (to manage a comparison function)
    //
    // Bibliography
    // http://gitweb.scilab.org/?p=scilab.git;a=blob_plain;f=scilab/modules/cacsd/tests/nonreg_tests/bug_68.tst;h=920d091d089b61bf961ea9e888b4d7d469942a14;hb=4ce3d4109dd752fce5f763be71ea639e09a12630
    //

    [lhs,rhs]=argn()
    apifun_checkrhs("scidoe_sort",rhs,1:4)
    apifun_checklhs("scidoe_sort",lhs,1:2)
    // Get the array x
    x = varargin(1)
    direction = apifun_argindefault ( varargin , 2 , %t )
    __scidoesort_compfun__ = apifun_argindefault ( varargin , 3 , scidoe_compare )
    __scidoesort_callback__ = apifun_argindefault ( varargin , 4 , [] )
    //
    // Check types
    apifun_checktype("scidoe_sort",x,"x",1,["constant" "list"])
    apifun_checktype("scidoe_sort",direction,"direction",2,"boolean")
    apifun_checktype("scidoe_sort",__scidoesort_compfun__,"compfun",3,["function" "list"])
    if ( __scidoesort_callback__ <> [] ) then
        apifun_checktype("scidoe_sort",__scidoesort_callback__,"callback",4,["function" "list"])
    end
    if ( typeof(x)=="list" & __scidoesort_compfun__==[] ) then
        errmsg = sprintf("%s: The variable %s is a list, but no comparison function %s is provided.","scidoe_sort","x","compfun");
        error(errmsg)
    end
    //
    // Check sizes
    apifun_checkscalar("scidoe_sort",direction,"direction",2);
    // 
    // Proceed recursively
    typx = typeof(x)
    if ( typx == "constant" ) then
        nrows = size(x,"r")
        ncols = size(x,"c")
    end
    imin = 1
    imax = length(x)
    if ( __scidoesort_callback__ <> [] ) then
        tcallback = typeof(__scidoesort_callback__)
        if ( tcallback=="list" ) then
            __scidoesort_cbck__f_ = __scidoesort_callback__ ( 1 )
            __scidoesort_cbck__f_ ( "start" , x , imin , imax , __scidoesort_callback__(2:$) )
        else
            __scidoesort_callback__ ( "start" , x , imin , imax )
        end
    end
    [ x , indices ] = scidoe_sortbisre ( typx , x , direction , __scidoesort_compfun__ , __scidoesort_callback__ , imin , imax )
    if ( __scidoesort_callback__ <> [] ) then
        if ( tcallback=="list" ) then
            __scidoesort_cbck__f_ ( "stop" , x , imin , imax , __scidoesort_callback__(2:$) )
        else
            __scidoesort_callback__ ( "stop" , x , imin , imax )
        end
    end
    // Reformat the matrix
    if ( typx == "constant" ) then
        x = matrix(x,nrows,ncols)
    end
endfunction
function [ x , indices ] = scidoe_sortbisre ( typx , x , direction , __scidoesort_compfun__ , __scidoesort_callback__ , imin , imax )
    // Immediately Proceed.
    // We assume that the arguments are correct.
    if ( __scidoesort_callback__ <> [] ) then
        tcallback = typeof(__scidoesort_callback__)
        if ( tcallback=="list" ) then
            __scidoesort_cbck__f_ = __scidoesort_callback__ ( 1 )
            __scidoesort_cbck__f_ ( "in" , x , imin , imax , __scidoesort_callback__(2:$) )
        else
            __scidoesort_callback__ ( "in" , x , imin , imax )
        end
    end
    n = length(x)
    indices = 1 : n
    if ( n > 1 ) then
        m = floor(n/2)
        p = n-m
        if ( typx=="constant" ) then
            sx1 = x(1:m)
            sx2 = x(m+1:n)
        else
            sx1 = list(x(1:m))
            sx2 = list(x(m+1:n))
        end
        [x1,indices1] = scidoe_sortbisre ( typx , sx1 , direction , __scidoesort_compfun__ , __scidoesort_callback__ , imin , imin+m-1 )
        [x2,indices2] = scidoe_sortbisre ( typx , sx2 , direction , __scidoesort_compfun__ , __scidoesort_callback__ , imin+m , imax )
        // Merge the two lists x1 and x2 into x.
        [ x , indices ] = merge ( typx , x1 , x2 , indices1 , indices2 , direction , __scidoesort_compfun__ , imin , imax )
    end
    if ( __scidoesort_callback__ <> [] ) then
        if ( tcallback=="list" ) then
            __scidoesort_cbck__f_ ( "out" , x , imin , imax , __scidoesort_callback__(2:$) )
        else
            __scidoesort_callback__ ( "out" , x , imin , imax )
        end
    end
endfunction
function [ x , indices ] = merge ( typx , x1 , x2 , indices1 , indices2 , direction , __scidoesort_compfun__ , imin , imax )
    // Merge the two lists x1 and x2 into x.
    n1 = length(x1)
    n2 = length(x2)
    n = n1 + n2

    indices = 1 : n
    if ( typx=="constant" ) then
        x = []
    else
        x = list()
    end

    i = 1 
    i1 = 1
    i2 = 1
    if ( typeof(__scidoesort_compfun__)=="list" ) then
        __scidoesort_compf__f_ = __scidoesort_compfun__(1)
    end
    for i = 1:n
        if ( typeof(__scidoesort_compfun__)=="list" ) then
            order = __scidoesort_compf__f_ ( x1(i1) , x2(i2) , __scidoesort_compfun__(2:$) )
        else
            order = __scidoesort_compfun__ ( x1(i1) , x2(i2) )
        end
        if ( ~direction ) then
            order = -order
        end
        if ( order<=0 ) then
            indices(i) = indices1(i1)
            x(i) = x1(i1)
            i1 = i1+1
            if (i1 > m) then
                indices(i+1:n) = indices2(i2:p) + n1
                // Apply to x
                if ( typx=="constant" ) then
                    x(i+1:n) = x2(i2:p)
                else
                    k = i2
                    for j = i+1 : n
                        x(j) = x2(k)
                        k = k + 1
                    end
                end
                break
            end
        else
            indices(i) = indices2(i2) + n1
            x(i) = x2(i2)
            i2 = i2+1
            if (i2 > p) then
                indices(i+1:n) = indices1(i1:m)
                // Apply to x
                if ( typx=="constant" ) then
                    x(i+1:n) = x1(i1:m)
                else
                    k = i1
                    for j = i+1 : n
                        x(j) = x1(k)
                        k = k + 1
                    end
                end
                break
            end
        end
    end
endfunction
