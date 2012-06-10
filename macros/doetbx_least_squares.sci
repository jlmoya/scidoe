function H = doetbx_least_squares(X,Y) // X,Y are row vectors
    
      // Description    
     //    This function fits data in linear model y=m*x+b., where m is the slope and b is the y-intercept.
     //    We use Scilab's backslash operator, which uses Gaussian Elimination, making it faster than using x = inv(A)*B.
    //     Our system should be overdetermined, meaning having more equations than unknowns, otherwise the system doesn't have a solution.
    
    
    // Parameters
    //     X, Y : Input row vectors containing data
    //     H: 1 x 2 Column vector containing the slope m = H(1) and b = H(2)
    
    
    // Check input arguments using apifun_checkvecrow.sci
    apifun_checkvecrow("doetbx_least_squares",X,"X",1,length(X));
    apifun_checkvecrow("doetbx_least_squares",Y,"Y",1,length(Y));
    
    
    //Initialise and define matrices A and B of A*X=B
    H=[];
    A=ones(length(X),1);
    B=zeros(length(Y),1);
    
    A = [X',A];
    B = [Y'];
    
    // Check whether the system is undetermined.
    // TODO - det(A) cannot be used since A is not a square matrix.
    
    
    //We use backslash operator to solve the equation A*x=B
    
    H=A\B;
    
   return H;
    
endfunction