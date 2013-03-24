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

// A small test driver for scidoe.

#include <stdio.h>
#include "scidoelib.h"
#include <stdlib.h>

int main( int argc, const char* argv[] )
{
	int s;
	int n; 
	double *x=NULL; 
	/*
X = [
0.3185689    0.684731   
0.7688531    0.3089766  
0.5430379    0.5694503  
0.9205527    0.1715891  
0.1097627    0.9247127
];
*/

	double d[10];
	int i;
	int b;
	s=2;
	n=5;
	x=malloc(n*s*sizeof(double));
	// Dimension #1
	x[0]=0.3185689;
	x[1]=0.7688531;
	x[2]=0.5430379;
	x[3]=0.9205527;
	x[4]=0.1097627;
	// Dimension #2
	x[5]=0.684731;
	x[6]=0.3089766;
	x[7]=0.5694503;
	x[8]=0.1715891;
	x[9]=0.9247127;
	b=n*(n-1)/2;
	scidoe_pdist(s,n,x,d);
	for (i=0;i<b;i++)
	{
		printf("d(%d)=%f\n",i,d[i]);
	}
	// Dexpected = [0.5865 0.2523 0.7910 0.3181 0.3447 0.2047 0.9020 0.5485 0.5603 1.1066];
	return 0;
}
