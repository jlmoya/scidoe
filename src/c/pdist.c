// Copyright (C) 2013 - Michael Baudin
/*
*
* This file must be used under the terms of the CeCILL.
* This source file is licensed as described in the file COPYING, which
* you should have received as part of this distribution.  The terms
* are also available at
* http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
*
*/

#include <math.h>

#include "scidoelib.h" 

// Pairwise distances
void scidoe_pdist ( int s, int n, double * x, double * d)
{
	int i, j, k, l, b;
	double dxixj;
	b=n*(n-1)/2;
	k=0;
	for (j=0;j<n-1;j++) 
	{
		for (i=j+1;i<n;i++) 
		{
			dxixj=0.;
			for (l=0;l<s;l++) 
			{
				dxixj=dxixj+pow(x[i+l*n]-x[j+l*n],2);
			}
			d[k]=sqrt(dxixj);
			k=k+1;
		}
	}
}

