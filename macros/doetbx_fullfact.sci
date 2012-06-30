function B = doetbx_fullfact(levels)

    //Check number of input arguments
    [lhs,rhs] = argn();
    apifun_checkrhs("doetbx_fullfact",rhs,1);
    apifun_checklhs("doetbx_fullfact",lhs,1);

    //Check type of input arguments
    apifun_checktype("doetbx_fullfact",levels,"levels",1,["constant"]);
    apifun_checkflint("doetbx_fullfact",levels,"levels",1);

    args = list();
    for i = 1:size(levels,"*")
        args($+1)=(1:levels(i));
    end
    B = specfun_combine ( args(1:$) )'
endfunction
