// Copyright (C) 2012 - Maria Christopoulou
// Copyright (C) 2001 - Per A. Brodtkorb
//
// This file is released under the terms of the CeCILL_V2 license : http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

function [ef, id] = scidoe_yates(varargin) // In progress! For the moment, I get wrong ef vector.
//
// Description
//     YATES Calculates main and interaction effects using Yate's algorithm.
//
// Calling Sequences
//    ef = scidoe_yates(y);
//    ef = scidoe_yates(y,sort_eff);
//    [ef,id] = scidoe_yates(y);
//    [ef,id] = scidoe_yates(y,sort_eff);
// 
//  Parameters
//    id : a (n-1)-by-k matrix of doubles, identification matrix of main and interaction effects.
//    ef : a n-by-1 vector of average response, main effects and interaction effects.
//    y : a n-by-1 or 1-by-n vector of calculated response from a two-level complete factorial design in standard order
//    sort_eff : sort the effects
//
// YATES applies the  Yates' algorithm to the responses Y to obtain 
// average response, main effects and interaction effects. Y is assumed to
// be arranged in what is called standard order. (The order of the actual
// running should, of course, be random).  EF(1,:) is the
// average response and EF(2:end,:) contain the main effects and
// interaction effects corresponding to the vector ID.
// 
// YATES may also be used in analyzing data from any 2^(K-P) fractional
// factorial design. The algorithm is applied in the usual way to any ambedded
// complete factorial in K-P factors, i.e., the responses must be
// rearranged so that K-P factors is a complete factorial in standard order.
// Then associate the calculated effects with their appropriate aliases
// using ALIAS. 
//
// Example
// "Statistics for Experimenters Design"
//  Box, G.E.P, Hunter, W.G. and Hunter, J.S. (1978), John Wiley & Sons, pp 177-182
//    D = scidoe_ff2n(3); // complete 2^3 design in standard order.
//    y = [60 72 54 68 52 83 45 80]; // Responses to design D.
//    [ef,id] = scidoe_yates(y);
//
// Bibliography
//    Box, G.E.P, Hunter, W.G. and Hunter, J.S. (1978)
//    Statistics for experimenters, John Wiley & Sons, pp 342
//    This function is adopted from the WAFO toolbox :
//    http://www.maths.lth.se/matstat/wafo/documentation/wafodoc/wafo/wstats/yates.html
// 
// Authors
//    Per A. Brodtkorb 16.03.2001
//
//
// Check number of input and output arguments:
[lhs, rhs] = argn()
apifun_checkrhs("scidoe_yates",rhs,1:2)
apifun_checklhs("scidoe_yates",lhs,1:2)
//
// 
y = varargin(1)
sort_eff = apifun_argindefault(varargin,2,%F)
//
// Check type
apifun_checktype("scidoe_yates",y,"y",1,"constant")
apifun_checktype("scidoe_yates",sort_eff,"sort_eff",2,"boolean")
//
// Check if y is column vector
apifun_checkveccol("scidoe_yates",y,"y",1)
//
// Check size -- TODO: make sure length(y) is power of two
n = size(y,1);
k = log2(n);
apifun_checkdims("scidoe_yates",y,"y",1,[n 1])
//
//
// Yates algorithm
//
ef   = y;
ind2 = 2:2:n;
ind1 = 1:2:n-1;
for ix=1:k
  ef = [ef(ind2,:)+ef(ind1,:); ef(ind2,:)-ef(ind1,:)];
end
ef = ef*(2/n);
ef(1,:) = ef(1,:)/2;
//
// Identification vector
  id = zeros(n-1,k);
  iz = 0;
  for ix = 1:k,
    iz       = iz+1;
    id(iz,1) = ix;
    iz0      = iz;
    for iy = 1:iz0-1,
      iz = iz+1;
      id(iz,:)   = id(iy,:);
      ind        = min(find(id(iy,:)==0));
      id(iz,ind) = ix;
    end
    end
//
// Sort the effects -- TODO: sorting the effects should be always done to agree with the ef vector
    [id, ind] = gsort(id(:,$:-1,1),'c','i');
    id = id(:,$:-1:1);
    ef(2:$,:) = ef(ind+1,:);   

endfunction