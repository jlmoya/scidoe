// Copyright (C) 2012 - Michael Baudin
// Copyright (C) 2008 - INRIA - Michael Baudin
// Copyright (C) 2010 - DIGITEO - Michael Baudin
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt


//////////////////////////////////////////////////////
// Trying to provide a graphical view of the process
// http://en.wikipedia.org/wiki/Merge_sort

function mycb2 ( status , x , imin , imax )
  global called
  called = called + 1
  x = x(:)
  n = length(x)
  if ( status == "start") then
    h = scf()
    xp = 1:n
    yp = x
    plot(xp,yp,"b*")
    titlestr = "Merge sort n="+string(n)+" indices = ("+string(imin)+","+string(imax)+")"
    xtitle(titlestr,"Rank","Value")
  elseif ( status == "out") then
    h = gcf()
    h.children.children.children.data(imin:imax,2) = x
    titlestr = "Merge sort n="+string(n)+" indices = ("+string(imin)+","+string(imax)+")"
    h.children.title.text = titlestr
  end
endfunction

global called;
called = 0;
N = 50;
// Take the values 1,2,...,50 and permute them randomly
x = (1:50)';
x = grand(1,"prm",x);
y = scidoe_sort ( x , [] , [] , mycb2 );
h = gcf();
delete(h);
assert_checkequal ( called , 200 );

