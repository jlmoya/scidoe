function H = doetbx_factorial(nb_var)
   
//Check number of input arguments
[lhs,rhs] = argn();
apifun_checkrhs("doetest_factorial",rhs,1);
apifun_checklhs("doetest_factorial",lhs,1);
    
//Check type of input arguments
apifun_checktype("doetest_factorial",nb_var,"nb_var",1,["constant"]);
apifun_checkscalar("doetest_factorial",nb_var,"nb_var",1);
apifun_checkflint("doetest_factorial",nb_var,"nb_var",1);
    
H = [];
    
nb_lines = 2^nb_var;
Aux = zeros(1,nb_var);
   
for i = 1:nb_lines-1
   Aux(1) = Aux(1) + 1;
    for j=2:nb_var
        if(Aux(j-1)>1) then
           Aux(j-1) = 0;
          Aux(j) = Aux(j) + 1;
        end
    end
        H =[H' Aux']';
    end
   
    H = [ zeros(1,nb_var)' H']'; 

    return H;
endfunction
