// Copyright (C) 2012 - Michael Baudin
// Copyright (C) 2012 - Maria Christopoulou
// Copyright (C) 2009 - Yann Collette
//
// This file is released under the terms of the CeCILL_V2 license : http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

function H = scidoe_bbdesign(varargin)

    // Description:
    //    Creates a Box-Benkhen Design of Experiments
    //
    // Calling sequences:
    //    H = scidoe_bbdesign(nb_var);
    //    H = scidoe_bbdesign(nb_var,nb_center);
    //
    // Parameters:
    //    nb_var : a 1-by-1 matrix of doubles, positive integer, with nb_var > 2
    //             The number of variables of the experiment
    //    nb_center : a 1-by-1 matrix of doubles, positive integer. Default value nb_center=1
    //                The number of repetitions of the central point in the design
    //    H : the created design of experiments
    //
    // Examples:
    // // Create a Box-Benkhen Design with three variables one repetition of center:
    //    H = scidoe_bbdesign(3);
    //
    // // With three variables and the center repeated two times:
    //    H = scidoe_bbdesign(3,2);
    //
    // Authors:
    // Copyright (C) 2012 - Michael Baudin
    // Copyright (C) 2012 - Maria Christopoulou
    // Copyright (C) 2009 - Yann Collette

    // Check number of input and output arguments:
    [lhs, rhs] = argn()
    apifun_checkrhs("scidoe_bbdesign",rhs,1:2)
    apifun_checklhs("scidoe_bbdesign",lhs,1)
    //
    //
    // If nb_center is not defined by the user, then its default value is nb_center = 1.
    nb_var = varargin(1)
    nb_center = apifun_argindefault (varargin,2,1)
    //
    //Check type
    apifun_checktype("scidoe_bbdesign",nb_var,"nb_var",1,["constant"])
    apifun_checktype("scidoe_bbdesign",nb_center,"nb_center",2,["constant"])
    //
    //Check size
    apifun_checkscalar("scidoe_bbdesign",nb_var,"nb_var",1);
    apifun_checkscalar("scidoe_bbdesign",nb_center,"nb_center",2)
    //
    // Check content
    // Value of nb_var must be over 2
    apifun_checkgreq("scidoe_bbdesign",nb_var,"nb_var",1,3)
    apifun_checkflint("scidoe_bbdesign",nb_var,"nb_var",1);
    apifun_checkflint("scidoe_bbdesign",nb_center,"nb_center",2);
    //
    //First, we compute a two level factorial doe with 2 parameters.
    //
    H_fact = [-1 -1;1 -1;-1 1;1 1];
    C = zeros(nb_center,nb_var);
    nb_lines = nb_var*4;
    H = zeros(nb_lines,nb_var);
    // We populate the real doe with this doe
    // TODO : Check for possible vectorization...    
    Index = 0;    
    for i=1:nb_var-1
      for j=i+1:nb_var
        Index = Index + 1;
        rows = max([1 ((Index-1)*4+1)]):Index*4;
        H(rows,i) = H_fact(:,1);
        H(rows,j) = H_fact(:,2);
      end
    end
    
    H = [H' C']';
    
endfunction
