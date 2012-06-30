function R2 = doetbx_rsquared(Y,Y_model)
    
    // Description
    //   This function computes the coefficient of determination or else R^2.
    //   R^2 indicates the goodness of fit between measured data and modelled data.
    //   
    
    //Parameters
    //  Y : row vector containing response measurements
    //  Y_model : row vector containing model's responses
    //  R2 : 1x1 matrix, the R2 coefficient
    
    
    // Check input arguments
    apifun_checkvecrow("doetbx_rsquared",Y,"Y",1,length(Y));
    apifun_checkvecrow("doetbx_rsquared",Y_model,"Y_model",1,length(Y_model));
    
    
    // Initialise parameters
       SSerr = 0;
       SStot = 0;
       Y_mean = 0;
       Y_mean = sum(Y)/length(Y);
       
       
    // Apply zero-fill first, ensuring equal lengths of vectors Y and Y_model.
    // Then we compute sums of squares.
    if(length(Y)>length(Y_model)) then
        lmax = length(Y);
        U_model=zeros(1:length(Y));
        U_model(1,1:length(Y_model))=Y_model;
        SSerr = sum((Y-U_model).^2);  // the residual sum of squares
        SStot = sum((Y-Y_mean).^2);  // the total sum of squares
    else
        lmax=length(Y_model);
        U=zeros(1:length(Y_model));
        U(1,1:length(Y))=Y;
        SSerr = sum((U-Y_model).^2);
        SStot = sum((U-Y_mean).^2);
    end
    
   // Calculate R-square
   R2 = 1-(SSerr/SStot);
   
   return R2;
   
    
endfunction