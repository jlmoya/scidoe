function B = doetbx_ff2n(n)
    
        //Check number of input arguments
    [lhs,rhs] = argn();
    apifun_checkrhs("doetbx_ff2n",rhs,1);
    apifun_checklhs("doetbx_ff2n",lhs,1);
    
    //Check type of input arguments
    apifun_checktype("doetbx_ff2n",n,"n",1,["constant"]);
    apifun_checkscalar("doetbx_ff2n",n,"n",1);
    apifun_checkflint("doetbx_ff2n",n,"n",1);
    
    B = specfun_combinerepeat ( [0,1] , n)'
endfunction
