// Copyright (C) 2012 - Michael Baudin
// Copyright (C) 2012 - Maria Christopoulou
// Copyright (C) 2010 - Digiteo - Michael Baudin
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

// References
// http://forge.scilab.org/index.php/p/nisp/source/tree/HEAD/demos/demo_build_LHS.sce
//

mprintf("Plot 5 points in a 2D LHS sampling\n");
n = 5;
s = 2;
sampling = scidoe_lhsdesign ( s , n );
scf(1);
plot ( sampling(:,1) , sampling(:,2) , "bo" );
// Add the cuts
cut = linspace ( 0 , 1 , n + 1 );
for i = 1 : n + 1
    plot( [cut(i) cut(i)] , [0 1] , "-" )
end
for i = 1 : n + 1
    plot( [0 1] , [cut(i) cut(i)] , "-" )
end
xtitle("Latin Hypercube Sampling: 5 points","X1","X2");

mprintf("Plot 100 points in a 2D LHS sampling\n");
n = 100;
s = 2;
sampling = scidoe_lhsdesign ( s , n );
scf(2);
drawlater();
plot ( sampling(:,1) , sampling(:,2) , "bo" );
xtitle("Latin Hypercube Sampling: 100 points","X1","X2");
drawnow();

// Generate a Centered LHS design: 5 points
mprintf("Plot 5 points in a 2D LHS Centered sampling\n");
n = 5;
s = 2;
sampling = scidoe_lhsdesign ( s , n,"criterion","center");
scf(3);
plot ( sampling(:,1) , sampling(:,2) , "bo" );
// Add the cuts
cut = linspace ( 0 , 1 , n + 1 );
for i = 1 : n + 1
    plot( [cut(i) cut(i)] , [0 1] , "-" )
end
for i = 1 : n + 1
    plot( [0 1] , [cut(i) cut(i)] , "-" )
end
xtitle("Centered Latin Hypercube Sampling: 5 points","X1","X2");

//
// Generate a Centered LHS design : 100 points
n = 100;
s = 2;
sampling = scidoe_lhsdesign(s,n,"criterion","center");
scf(4);
drawlater();
plot(sampling(:,1),sampling(:,2),'bo');
xtitle("Centered Latin Hypercube Sampling: 100 points","X1","X2");
drawnow();
//
// Generate Maximin LHS Design : 5 points
mprintf("Plot 5 points in a 2D LHS sampling\n");
n = 5;
s = 2;
sampling = scidoe_lhsdesign ( s , n ,"criterion","maximin");
scf(5);
plot ( sampling(:,1) , sampling(:,2) , "bo" );
// Add the cuts
cut = linspace ( 0 , 1 , n + 1 );
for i = 1 : n + 1
    plot( [cut(i) cut(i)] , [0 1] , "-" )
end
for i = 1 : n + 1
    plot( [0 1] , [cut(i) cut(i)] , "-" )
end
xtitle("Maximin Latin Hypercube Sampling: 5 points","X1","X2");
//
// Generate a Centered LHS design : 100 points
n = 100;
s = 2;
sampling = scidoe_lhsdesign(s,n,"criterion","maximin");
scf(6);
drawlater();
plot(sampling(:,1),sampling(:,2),'bo');
xtitle("Maximin Latin Hypercube Sampling: 100 points","X1","X2");
drawnow();
//
//
// Generate 'Minimum Correlation' LHS Design : 5 points
mprintf("Plot 5 points in a 2D LHS sampling\n");
n = 5;
s = 2;
sampling = scidoe_lhsdesign ( s , n ,"criterion","correlation");
scf(7);
plot ( sampling(:,1) , sampling(:,2) , "bo" );
// Add the cuts
cut = linspace ( 0 , 1 , n + 1 );
for i = 1 : n + 1
    plot( [cut(i) cut(i)] , [0 1] , "-" )
end
for i = 1 : n + 1
    plot( [0 1] , [cut(i) cut(i)] , "-" )
end
xtitle("''Correlation'' Latin Hypercube Sampling: 5 points","X1","X2");
//
// Generate a 'Minimum Correlation' LHS design : 100 points
n = 100;
s = 2;
sampling = scidoe_lhsdesign(s,n,"criterion","correlation");
scf(8);
drawlater();
plot(sampling(:,1),sampling(:,2),'bo');
xtitle("''Correlation'' Latin Hypercube Sampling: 100 points","X1","X2");
drawnow();
//