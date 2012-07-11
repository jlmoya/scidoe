// Copyright (C) 2012 - Michael Baudin
// Copyright (C) 2012 - Maria Christopoulou
// Copyright (C) 2009 - Yann Collette
//
// This file is released under the terms of the CeCILL_V2 license : http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

function H = scidoe_bbdesign(varargin)

    // Description
    //    Creates a Box-Benkhen Design of Experiments
    //
    // Calling Sequence
    //    H = scidoe_bbdesign(nbvar)
    //    H = scidoe_bbdesign(nbvar,nbcenter)
    //
    // Parameters
    //    nbvar : a 1-by-1 matrix of doubles, integer value, nbvar > 2. The number of variables of the experiment
    //    nbcenter : a 1-by-1 matrix of doubles, integer value, positive. The number of repetitions of the central point in the design (default nbcenter=1).
    //    H : a m-by-nbvar matrix of doubles, the design of experiments, where m=nbvar*4+nbcenter
    //
    // Examples
    // // Create a Box-Benkhen Design with three 
	// // variables one repetition of center:
    // H = scidoe_bbdesign(3)
    //
    // // With three variables and the 
	// // center repeated two times:
    // H = scidoe_bbdesign(3,2)
    //
    // Authors
    // Copyright (C) 2012 - Michael Baudin
    // Copyright (C) 2012 - Maria Christopoulou
    // Copyright (C) 2009 - Yann Collette

    // Check number of input and output arguments:
    [lhs, rhs] = argn()
    apifun_checkrhs("scidoe_bbdesign",rhs,1:2)
    apifun_checklhs("scidoe_bbdesign",lhs,1)
    //
    //
    // If nbcenter is not defined by the user, then its default value is nbcenter = 1.
    nbvar = varargin(1)
    nbcenter = apifun_argindefault (varargin,2,1)
    //
    //Check type
    apifun_checktype("scidoe_bbdesign",nbvar,"nbvar",1,["constant"])
    apifun_checktype("scidoe_bbdesign",nbcenter,"nbcenter",2,["constant"])
    //
    //Check size
    apifun_checkscalar("scidoe_bbdesign",nbvar,"nbvar",1);
    apifun_checkscalar("scidoe_bbdesign",nbcenter,"nbcenter",2)
    //
    // Check content
    // Value of nbvar must be over 2
    apifun_checkgreq("scidoe_bbdesign",nbvar,"nbvar",1,3)
    apifun_checkflint("scidoe_bbdesign",nbvar,"nbvar",1);
    apifun_checkflint("scidoe_bbdesign",nbcenter,"nbcenter",2);
    //
    //First, we compute a two level factorial doe with 2 parameters.
    //
    H_fact = [-1 -1;1 -1;-1 1;1 1];
    C = zeros(nbcenter,nbvar);
    nb_lines = nbvar*4;
    H = zeros(nb_lines,nbvar);
    // We populate the real doe with this doe
    // TODO : Check for possible vectorization...    
    Index = 0;    
    for i=1:nbvar-1
      for j=i+1:nbvar
        Index = Index + 1;
        rows = max([1 ((Index-1)*4+1)]):Index*4;
        H(rows,i) = H_fact(:,1);
        H(rows,j) = H_fact(:,2);
      end
    end
    
    H = [H' C']';
    
endfunction
