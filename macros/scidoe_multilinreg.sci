function H = scidoe_multilinreg(X,Y)

    // Description
    // This function applies the backslash operator and computes a linear model with many independent variables x1 x2 ..xn. 
    // The linear model we compute is Y = b1*x1 + b2*x2 +...+ bn*xn.

    // Input arguments 
    // X is a m-by-n matrix,m is the number of observations and n is the number of variables.
    // Y is a m-by-1 column vector, containing the responses.


    apifun_checkveccol("scidoe_multilinreg",Y,"Y",1,length(Y));

    H=[];
    A=ones(size(X,'r'),1);
    A=[A X];
    B=Y;

    H = A\B;

endfunction
