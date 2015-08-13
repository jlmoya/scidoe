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

/*--------------------------------------------------------------------------*/
#include <string.h>

// From scidoelib:
#include "scidoelib.h"
#include "gw_scidoe.h"

// From Scilab:
#include "api_scilab.h"

#include "Scierror.h"
#include "localization.h"

/*--------------------------------------------------------------------------*/
/*

 Pairwise point distances of a matrix

 Calling Sequence
    D = scidoe_pdist(X)

 Parameters
    X : a n-by-s matrix of doubles, the input vector, where n is the number of points and s is the number of dimensions
    D : a 1-by-b matrix of doubles, the distance vector, where b = n*(n-1)/2

 Description
 This function computes all the pairwise point distances of a matrix.
 The number of combinations of the points in each variable (column) 
 is equal to the binomial coefficient b=n*(n-1)/2.
    
 The resulted matrix contains all pairwise point distances, 
 arranged in the order (2,1), (3,1), ..., (n,1), (3,2), ..., (n,2), 
 ..., (n,m–1).

    If input matrix X includes only one sample point, 
 then an empty matrix is returned.

 The function implements only the Euclidean distance case.

 Examples
 // Compute the euclidean distance between all pairs 
 // of points of the matrix
 X = [
      0.1629447    0.8616334  
      0.5811584    0.3826752  
      0.2270954    0.4442068  
      0.7670017    0.7264718  
      0.8253974    0.1937736
 ]
 D = scidoe_pdist(X)

 See also
 scidoe_squareform

*/
/*--------------------------------------------------------------------------*/
int sci_scidoe_pdist(char* fname, void* pvApiCtx)
{

	int readFlag;

	int rowsX = 0, colsX = 0;
	int rowsD = 0, colsD = 0;

	double * lrX = NULL;
	double * lrD = NULL;

	int status = 0;

	int i;
	int iType = 0;
	int iComplex = 0;
	SciErr sciErr;
	int *_piAddress;

	CheckInputArgument(pvApiCtx,1,1);
	CheckOutputArgument(pvApiCtx,1,1);

	// Arg #1 : X
	sciErr = getVarAddressFromPosition(pvApiCtx, 1, &_piAddress);
	if(sciErr.iErr)
	{
		printError(&sciErr, 0);
		return 0;
	}
	sciErr = getMatrixOfDouble(pvApiCtx, _piAddress, &rowsX, &colsX, &lrX);
	if(sciErr.iErr)
	{
		printError(&sciErr, 0);
		return 0;
	}

	// Create LHS : D
	rowsD = 1;
	colsD = rowsX*(rowsX-1)/2;
	allocMatrixOfDouble (pvApiCtx , Rhs + 1 , rowsD , colsD , &lrD );
	LhsVar(1) = Rhs+1;
	// Fill D
	scidoe_pdist(colsX, rowsX, lrX, lrD);
	return 0;
}
/*--------------------------------------------------------------------------*/
