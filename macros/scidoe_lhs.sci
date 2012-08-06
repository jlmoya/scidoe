
function H = scidoe_lhsdesign(varargin)
    
    s = varargin(1); // Number of variables
    n = varargin(2); // Number of points
    //
    // Check input
    apifun_checktype("scidoe_lhsdesign",s,"s",1,"constant")
    apifun_checktype("scidoe_lhsdesign",n,"n",2,"constant")
    apifun_checkscalar("scidoe_lhsdesign",s,"s",1)
    apifun_checkscalar("scidoe_lhsdesign",n,"n",2)
    apifun_checkflint("scidoe_lhsdesign",s,"s",1)
    apifun_checkflint("scidoe_lhsdesign",n,"n",2)    
    apifun_checkgreq("scidoe_lhsdesign",s,"s",1,1)
    apifun_checkgreq("scidoe_lhsdesign",n,"n",2,1)
    //
    // LHS design without improvement
    H = nisp_buildlhs(n,p)
    //
    // LHS with maximin criterion -Based on Burkandt's implementation
    duplication = 5;
    x = zeros(n,p);
    x = nisp_buildlhs(n,p);
    // Initialise AVAIL
    for j = 1:p
        avail(1:n,j) = j;
    end
    
    for i = 1:n
        avail(i,x(i,p)) = p;
    end
    count = p-1 :-1:2
    for i = 1:n
        for k = 1:duplication // Duplication = 5 by default
            list(count*(k-1)+1:k*count) = avail(i,1:count);
        end
    
    for k=count*duplication:-1:1
        []
        
    end
    
    end
    
endfunction