function H = scidoe_ccdesign(varargin) // In progress
// A Central Composite Design of Experiments
//
// The updated version of doe_composite.sci.
//
// Calling Sequence :
// H = scidoe_ccdesign(nbvar)
// H = scidoe_ccdesign(nbvar,"Name1","Parameter1","Name2","Parameter2"...)
//
// Options :
// 'center' : number of center points// I haven't added this option yet.
// 'ccd' : circumscribed, inscribed, faced. Default is circumscribed.
// 'alpha' : 'orthogonal' or 'rotatable'. For the moment, default is rotatable, because orthogonal does not give correct output.
// Circumscribed and Inscribed can be rotatable, but Faced cannot. For Faced CCD, alpha =1.
//
// If the design is orthogonal, alpha = sqrt(nbvar*(1+(nao/na))/(1+(nco/nc))), nc the factorial points, nco the center points added to the factorial design, na the axial points, nao the center points added to the axial points. Results don't agree with R.
//
// If the design is rotatable, alpha = nc^1/4, nc the factorial points. Results agree with R.
//
// Bibliography:
//    Box, Hunter and Hunter "Statistics for experimenters"
//    http://en.wikipedia.org/wiki/Central_composite_design
//    http://rgm2.lab.nig.ac.jp/RGM2/func.php?rd_id=rsm:ccd
//    http://www.mathworks.com/help/toolbox/stats/f56635.html
//    http://www.itl.nist.gov/div898/handbook/pri/section3/pri3361.htm
//
// Current Issues:
// 1) H1 is undefined variable when I call:
//    scidoe_ccdesign(nbvar)
//    scidoe_ccdesign(nbvar,"ccd","circumscribed/inscribed","alpha","orthogonal/rotatable");
//
// 2) When CCd is Inscribed, values of factorial points have to decrease as nbvar increases.
// 
    [lhs, rhs] = argn()
    apifun_checkrhs("scidoe_ccdesign",rhs,[1 3 5])
    apifun_checklhs("scidoe_ccdesign",lhs,1)

    nbvar = varargin(1);
    // Check type, size, content of nbvar
    apifun_checktype("scidoe_ccdesign",nbvar,"nbvar",1,"constant")
    apifun_checkscalar("scidoe_ccdesign",nbvar,"nbvar",1)
    apifun_checkgreq("scidoe_ccdesign",nbvar,"nbvar",1,2)
    apifun_checkflint("scidoe_ccdesign",nbvar,"nbvar",1)
//
// Choose type of CCD. Default is 'circumscribed'.
ccd = ['circumscribed' 'inscribed' 'faced'];

if (rhs==1) then
    ccd == 'circumscribed';
    alpha = nbvar^(1/4); // Rotatable Design
end

if (rhs==3 |rhs==5) then
        // Check for CCD type
        ccd= apifun_argindefault (varargin,rhs,[])
        apifun_checktype("scidoe_ccdesign",ccd,"ccd",rhs,"string")
        // Set default values
        default.ccd = 'circumscribed';
        default.ccd = 'inscribed';
        default.ccd = 'faced';
        //Set key value pairs
        options = apifun_keyvaluepairs(default)
        options = apifun_keyvaluepairs(default,"ccd",'circumscribed')
        options = apifun_keyvaluepairs(default,"ccd",'inscribed')
        options = apifun_keyvaluepairs(default,"ccd",'faced')
        'circumscribed' == options.ccd;
        'inscribed' == options.ccd;
        'faced' == options.ccd;
        //
        // Check for alpha value
        alpha = apifun_argindefault(varargin,rhs,[])
        apifun_checktype("scidoe_ccdesign",alpha,"alpha",rhs,"string")
        // Set default values
        default.alpha = 'rotatable';
        default.alpha = 'orthogonal';
        options = apifun_keyvaluepairs(default,"alpha",'rotatable')
        options = apifun_keyvaluepairs(default,"alpha",'orthogonal')
        //
        // Rotatable Design
        if ('rotatable' == options.alpha) then
            alpha == nbvar^(1/4);
        end
        //
        // Orthogonal Design
        if ('orthogonal' == options.alpha) then
            nc = 2^nbvar; // Factorial points
            nco = 2*nbvar+4; // Center points added to factorial design
            na=2*nbvar; // Axial points
            nao=2*nbvar+4; // Center points added to second design
            alpha =  sqrt(nbvar*(1+(nao/na))/(1+(nco/nc)));
          end 
          
    end

if (ccd == 'inscribed') then
    H1=specfun_combinerepeat([ -0.5477226  0.5477226],nbvar)';// This is wrong, values of factorial points must decrease, as nbvar increases.
end

if (ccd == 'faced') then
   alpha = 1;
   H1 = 2*scidoe_ff2n(nbvar)-1;
end

if (ccd == 'circumscribed') then
    H1 = 2*scidoe_ff2n(nbvar)-1;
end
H2 = eye(nbvar, nbvar);
H2 = [H2 -H2]';

C = zeros(8,nbvar);//
H = [H1; alpha*H2];
H=[H;C];
H =scidoe_sortdesign(H);

endfunction
