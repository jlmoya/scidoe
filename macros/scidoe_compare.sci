// Copyright (C) 2008-2009 - INRIA - Michael Baudin
// Copyright (C) 2010 - DIGITEO - Michael Baudin
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

function order = scidoe_compare ( a , b )
  //   The default comparison function used in the sort-merge.
  //
  // Calling Sequence
  //   order = scidoe_compare ( a , b )
  // 
  // Parameters
  //   a : a 1x1 matrix of doubles, the first value to be compared
  //   b : a 1x1 matrix of doubles, the second value to be compared
  //   order : a 1x1 matrix of floating point integers, the order. Returns order=0 is a is almost equal to b, order=-1 if a < b, order=+1 if a > b.
  //
  // Description
  //   Returns -1 if and(a<b), returns 0 if and(a==b), returns +1 otherwise.
  //
  // Examples
  //   order = scidoe_compare ( 1 , -1 ) // 1
  //   order = scidoe_compare ( -1 , 1 ) // -1
  //   order = scidoe_compare ( 1 , 1 ) // 0
  //
  // Authors
  // Michael Baudin, DIGITEO, 2009-2010

  if ( and(a < b) ) then
    order = -1
  elseif ( and(a==b) ) then
    order = 0
  else 
    order = 1
  end
endfunction

