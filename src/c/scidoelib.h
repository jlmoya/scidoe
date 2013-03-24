/*
* Copyright (C) 2013 - Michael Baudin
*
* This file must be used under the terms of the CeCILL.
* This source file is licensed as described in the file COPYING, which
* you should have received as part of this distribution.  The terms
* are also available at
* http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
*
*/

#ifndef _SCIDOELIB_H_
#define _SCIDOELIB_H_

#ifdef _MSC_VER
#if LIBSCIDOELIB_EXPORTS 
#define SCIDOELIB_IMPORTEXPORT __declspec (dllexport)
#else
#define SCIDOELIB_IMPORTEXPORT __declspec (dllimport)
#endif
#else
#define SCIDOELIB_IMPORTEXPORT
#endif

#undef __BEGIN_DECLS
#undef __END_DECLS
#ifdef __cplusplus
# define __BEGIN_DECLS extern "C" {
# define __END_DECLS }
#else
# define __BEGIN_DECLS /* empty */
# define __END_DECLS /* empty */
#endif

__BEGIN_DECLS

// Compute the pairwise distances.
// s: the number of dimensions
// n: the number of points
// x: a n-by-s matrix of doubles, the points. x_ij=x[i+j*n]
// d: a b-by-1 matrix of doubles, the pairwise distances where b=n*(n-1)/2, 
//    arranged in the order (1,0), (2,0), ..., (n-1,0), (2,1), ..., (n-1,1), 
//    ..., (n-1,n–2).
//     
void scidoe_pdist ( int s, int n, double * x, double * d);

__END_DECLS


#endif /** _SCIDOELIB_H_   **/
