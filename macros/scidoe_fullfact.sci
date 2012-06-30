function B = scidoe_fullfact(levels)

    //Check number of input arguments
    [lhs,rhs] = argn();
    apifun_checkrhs("scidoe_fullfact",rhs,1);
    apifun_checklhs("scidoe_fullfact",lhs,1);

    //Check type of input arguments
    apifun_checktype("scidoe_fullfact",levels,"levels",1,["constant"]);
    apifun_checkflint("scidoe_fullfact",levels,"levels",1);

    args = list();
    for i = 1:size(levels,"*")
        args($+1)=(1:levels(i));
    end
    B = specfun_combine ( args(1:$) )'
endfunction
