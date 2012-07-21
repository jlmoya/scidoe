// Copyright (C) 2012 - Michael Baudin
// Copyright (C) 2012 - Maria Christopoulou
// Copyright (C) 2009 - Yann Collette
//
// This file is released under the terms of the CeCILL_V2 license : http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

function H = scidoe_bbdesign(varargin) //  'blocksize' option to be added. 
    // Box-Benhken design of experiments
    //
    // Calling Sequence
    //    H = scidoe_bbdesign(nbvar)
    //    H = scidoe_bbdesign(nbvar,nbcenter)
    //
    // Parameters
    //    nbvar : a 1-by-1 matrix of doubles, integer value, nbvar >= 3. The number of variables of the experiment
    //    nbcenter : a 1-by-1 matrix of doubles, integer value, positive. The number of repetitions of the central point in the design (default nbcenter=1).
    //    H : a m-by-nbvar matrix of doubles, the design of experiments in the range [-1,1], where m=nbvar*4+nbcenter
    //
    // Description
    // Creates a Box-Benkhen Design of Experiments
    //
    // Examples
    // // Create a Box-Benkhen Design with three 
    // // variables one repetition of center:
    // H = scidoe_bbdesign(3)
    // // Plot the design
    // h = scf();
    // param3d(H(:,1),H(:,2),H(:,3))
    // h.children.children.mark_mode="on";
    // h.children.children.line_mode="off";
    // h.children.children.mark_size=1;
    // scidoe_plotcube(3)
    // xtitle("Box-Benkhen Design","X1","X2","X3")
    //
    // // With three variables and the 
    // // center repeated two times:
    // H = scidoe_bbdesign(3,2)
    //
    // // Print the number of experiments
    // for nbvar = 3 : 10
    //   H = scidoe_bbdesign(nbvar);
    //   m = size(H,"r");
    //   mprintf("nbvar=%d, Num. Experiments=%d\n",..
    //      nbvar,m)
    // end
    //
    // Bibliography
    // http://en.wikipedia.org/wiki/Box%E2%80%93Behnken_design
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
    //
    // Depending on the number of variables nbvar, we compute two level design
    // which is populated with the real doe.
    if (nbvar<6 | nbvar==8 | nbvar==13 | nbvar == 14 | nbvar ==15 | nbvar>16 ) then
        H = scidoe_bbdesign2(nbvar)
    elseif (nbvar==6 | nbvar==7 | nbvar==9 ) then
        H = scidoe_bbdesign3(nbvar)
    elseif(nbvar==10 | nbvar==11 | nbvar==12 |nbvar ==16)
        H = scidoe_bbdesign4(nbvar)
    end
    C = zeros(nbcenter,nbvar);
    H = [H' C']';
    H = gsort(H,"lr","i")
endfunction

function H = scidoe_bbdesign2(nbvar)
    H_fact = 2*scidoe_ff2n(2)-1;
    // Number of factorial points per block:
    // number of rows in H_fact
    fppb = 2^2
    nb_lines = 2*(nbvar-1)*nbvar;
    H = zeros(nb_lines,nbvar);
    Index = 0;
    for i=1:nbvar-1
        for j=i+1:nbvar
            Index = Index + 1;
            startindex = max([1 ((Index-1)*fppb+1)])
            stopindex = Index*fppb
            rows = startindex:stopindex;
            H(rows,[i j]) = H_fact;
        end
    end
endfunction
function H = scidoe_bbdesign3(nbvar)
    H_fact=2*scidoe_ff2n(3)-1;
    fppb = 2^3
    nb_lines = nbvar*fppb
    H = zeros(nb_lines,nbvar);
    Index = 0;
    for i=1:nbvar-2
        for j=i+1:nbvar-1
            for k=j+1:nbvar
                Index = Index + 1;
                if (Index<=nbvar)
                    startindex = max([1 ((Index-1)*fppb+1)])
                    stopindex = Index*fppb
                    rows = startindex:stopindex;
                    H(rows,[i j k]) = H_fact;
                end
            end
        end
    end
endfunction
function H = scidoe_bbdesign4(nbvar)
    H_fact=2*scidoe_ff2n(4)-1;
    fppb = 2^4
    nb_lines = nbvar*fppb
    H = zeros(nb_lines,nbvar);
    Index = 0;
    for i=1:nbvar-3
        for j=i+1:nbvar-2
            for k=j+1:nbvar-1
                for l=k+1:nbvar
                    Index = Index + 1;
                    if (Index<=nbvar)
                        startindex = max([1 ((Index-1)*fppb+1)])
                        stopindex = Index*fppb
                        rows = startindex:stopindex;
                        H(rows,[i j k l]) = H_fact;
                    end
                end
            end
        end
    end
endfunction
