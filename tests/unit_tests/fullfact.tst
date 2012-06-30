// Copyright (C) 2012 - Michael Baudin
// Copyright (C) 2012 - Maria Christopoulou 
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

// <-- JVM NOT MANDATORY -->

levels = [2 3];
computed = scidoe_fullfact(levels);
expected = [1 1;1 2;1 3;2 1;2 2;2 3];
assert_checkequal(computed,expected);
