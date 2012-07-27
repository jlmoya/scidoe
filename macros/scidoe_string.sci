// Copyright (C) 2012 - Michael Baudin
// Copyright (C) 2012 - Maria Christopoulou
// Copyright (C) 2009 - Yann Collette
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

function S = scidoe_string(varargin)
    // Sort the experiments of a design of experiments
    //
    // Calling Sequence
    //    S = scidoe_string(D)
    //
    // Parameters
    //    D : a m-by-nbvar matrix of doubles, the design of experiments.
    //    S : a m-by-nbvar matrix of strings, the design of experiments.
    //
    // Description
    // Ignores the signs of the entries in D, and 
    // remove duplicate entries. 
    // Then replaces each entry equal to 1 by a "*". 
    // 
    // In a DOE which has {0,-1,+1} entries, this factors 
    // the blocks which have +-1 entries.
    // This makes the factorial blocks of the design more obvious. 
    //
    // Examples
    // // A DOE with no obvious structure.
    // D = [
    // -1 1 0
    // -1 -1 0
    // 0 0 0
    // 1 -1 0
    // 0 -1 1
    // -1 0 -1
    // 0 1 1
    // -1 0 1
    // 1 0 1
    // 0 -1 -1
    // 1 0 -1
    // 0 1 -1
    // 1 1 0
    // ]
    // S = scidoe_string(D)
    //
    // Authors
    // Copyright (C) 2012 - Michael Baudin

    // Check number of input and output arguments:
    [lhs, rhs] = argn()
    apifun_checkrhs("scidoe_string",rhs,1)
    apifun_checklhs("scidoe_string",lhs,1)
    //
    //
    D = varargin(1)
    // Check type, size, content of nbvar
    apifun_checktype("scidoe_string",D,"D",1,"constant")
    //
    D=unique(abs(D),"r") 
    S=string(D)
    S(S=="1")="*"
endfunction
