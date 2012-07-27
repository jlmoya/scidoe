// Copyright (C) 2012 - Michael Baudin
// Copyright (C) 2008 - INRIA - Michael Baudin
// Copyright (C) 2010 - DIGITEO - Michael Baudin
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

// <-- JVM NOT MANDATORY -->
// <-- ENGLISH IMPOSED -->



/////////////////////////////////////////////////
// Sort x in increasing order
x = [4 5 1 2 3];
y = scidoe_sort ( x );
assert_checkequal ( y , [1 2 3 4 5] );
/////////////////////////////////////////////////
// Get indices
x = [4 5 1 2 3];
[y,indices] = scidoe_sort ( x );
assert_checkequal ( y , [1 2 3 4 5] );
assert_checkequal ( indices , [3,4,5,1,2] );
/////////////////////////////////////////////////
// Sort x in decreasing order
x = [4 5 1 2 3];
[y,indices] = scidoe_sort ( x , %f );
assert_checkequal ( y , [5 4 3 2 1] );
assert_checkequal ( indices , [2,1,5,4,3] );
/////////////////////////////////////////////////

// Use a customized comparison function:
// sort into decreasing order.
function order = myorder ( x , y )
  if ( x < y ) then
    order = 1
  elseif ( x==y ) then
    order = 0
  else
    order = -1
  end
endfunction
x = [4 5 1 2 3];
// Notice that we use the default direction (i.e. increasing)
// by setting direction to the empty matrix [].
[y,indices] = scidoe_sort ( x , [] , myorder );
assert_checkequal ( y , [5,4,3,2,1] );
assert_checkequal ( indices , [2,1,5,4,3] );

/////////////////////////////////////////////////

// Use a customized comparison function:
// sort real values into increasing order,
// with an absolute tolerance.
// The function has an additionnal parameter
function order = myrealorder ( x , y , atol )
  if ( abs(x-y)<atol ) then
    order = 0
  elseif ( x < y ) then
    order = -1
  else
    order = 1
  end
endfunction
x = [1,2,1.2347,1.2346,1.2345,3,4];
atol = 1.e-2;
compfun = list(myrealorder,atol);
[y,indices] = scidoe_sort ( x , [] , compfun );
e = [1,1.2347,1.2346,1.2345,2,3,4];
assert_checkequal ( y , e );
assert_checkequal ( indices , [1,3,4,5,2,6,7] );
// Notice that the basic comparison function would
// produce a difference sorted matrix.
[y,indices] = scidoe_sort ( x );
e = [1,1.2345,1.2346,1.2347,2,3,4];
assert_checkequal ( y , e );
assert_checkequal ( indices , [1,5,4,3,2,6,7] );
// See that this is a stable sort.
// Notice that the equal values are not moved.
[y,indices] = scidoe_sort ( x , %f , compfun );
e = [4,3,2,1.2347,1.2346,1.2345,1];
assert_checkequal ( y , e );
assert_checkequal ( indices , [7,6,2,3,4,5,1] );


/////////////////////////////////////////////////

// Check that we can sort lists
// We consider list of elements, where each element
// is a couple. The order depends on the first element (denoted "x"),
// then the second element (denoted "y"), in case of tie.
z = list();
z(1) = list(6,5);
z(2) = list(5,4);
z(3) = list(4,3);
z(4) = list(3,2);
z(5) = list(2,1);
z(6) = list(1,0);
// Use a customized comparison function:
// sort into increasing order.
function order = myorder2 ( a , b )
  ax = a(1)
  ay = a(2)
  bx = b(1)
  by = b(2)
  if ( ax == bx ) then
    if ( ay == by ) then
      order = 0
    elseif ( ay < by ) then
      order = -1
    else
      order = 1
    end
  elseif ( ax < bx ) then
    order = -1
  else
    order = 1
  end
endfunction

zsorted = scidoe_sort(z,[],myorder2);
assert_checkequal ( zsorted(1) , list(1,0) );
assert_checkequal ( zsorted(2) , list(2,1) );
assert_checkequal ( zsorted(3) , list(3,2) );
assert_checkequal ( zsorted(4) , list(4,3) );
assert_checkequal ( zsorted(5) , list(5,4) );


//
function mycb ( status , x , imin , imax )
  global called
  called = called + 1
  mprintf("%s: (%d,%d) : %s\n",status,imin,imax,sci2exp(x))
endfunction

// Sort this into [1 2 3 4 5]
x = [4 5 1 2 3];
global called;
called = 0;
// Notice that we set compfun=[], so that the default 
// comparison function is used.
y = scidoe_sort ( x , [] , [] , mycb );
assert_checkequal ( called , 20 );

//
function mycb2 ( status , x , imin , imax , a1 , a2 )
  global called
  called = called + 1
  mprintf("%s: (%d,%d) : %s - %s - %s\n",status,imin,imax,sci2exp(x),a1,a2)
endfunction

// Sort this into [1 2 3 4 5]
x = [4 5 1 2 3];
global called;
called = 0;
// Notice that we set compfun=[], so that the default 
// comparison function is used.
y = scidoe_sort ( x , [] , [] , list(mycb2,"a1","a2") );
assert_checkequal ( called , 20 );


