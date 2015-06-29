// Copyright (C) 2012 - 2013 - Michael Baudin
// Copyright (C) 2012 - Maria Christopoulou
// Copyright (C) 2010 - 2011 - INRIA - Michael Baudin
// Copyright (C) 2009 - Yann Collette
// Copyright (C) 2009 - CEA - Jean-Marc Martinez
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

function H = scidoe_lhsdesign(varargin)
    // Latin Hypercube Sampling
    //
    // Calling Sequence
    //    H = scidoe_lhsdesign(s,n)
    //    H = scidoe_lhsdesign(...,"criterion","center")
    //    H = scidoe_lhsdesign(...,"criterion","maximin")
    //    H = scidoe_lhsdesign(...,"criterion","correlation")
    //    H = scidoe_lhsdesign(...,"criterion","centermaximin")
    //    H = scidoe_lhsdesign(...,"iterations",k)
    //
    // Parameters
    //    s : a 1-by-1 matrix of doubles, integer value, s>=1, the number of variables
    //    n : a 1-by-1 matrix of doubles, integer value, n>=1, the number of points
    //    k : a 1-by-1 matrix of doubles, integer value, k>=1, the number of iterations in the maximin algorithm
    //    H : a n-by-s matrix of doubles, the LHS sampling
    //    
    // Description
    //    Computes a Latin Hypercube Sampling
    //    
    //    <itemizedlist>
    //    <listitem>
    //    <para>
    //    If no criterion is specified, the function computes a random LHS design.
    //    </para>
    //    </listitem>
    //    <listitem>
    //    <para>
    //    If "criterion" = "center", then the function selects and permutes the center points of the intervals (0,1/n),(1/n,2/n)...(1-1/n,1). This is a centered LHS design.
    //    </para>
    //    </listitem>
    //    <listitem>
    //    <para>
    //    If "criterion" = "maximin", then the function selects the LHS design with the maximun pairwise point distance. This is a maximin LHS design.
    //    </para>
    //    </listitem>
    //    <listitem>
    //    <para>
    //    If "criterion" = "centermaximin", then the function selects the centered LHS design with the maximun pairwise point distance. This is a centered maximin LHS design.
    //    </para>
    //    </listitem>
    //    <listitem>
    //    <para>
    //    If "criterion" = "correlation", then the function selects the LHS design with minimum correlation between its variables.
    //    </para>
    //    </listitem>
    //    </itemizedlist>
    //
    //    This function changes the state of the grand uniform random number generator.
    //
    // Examples
    // // Compute a random LHS with 2 variables and 5 points
    // H = scidoe_lhsdesign(2,5)
    // scf();
    // scidoe_plotlhs(H)
    // xtitle("LHS design","X1","X2")
    //
    // // Compute a centered LHS design
    // H = scidoe_lhsdesign(2,5,"criterion","center")
    // scf();
    // scidoe_plotlhs(H)
    // xtitle("Centered LHS design","X1","X2")
    //
    // // Compute a maximin LHS design
    // H = scidoe_lhsdesign(2,5,"criterion","maximin")
    // scf();
    // scidoe_plotlhs(H)
    // xtitle("Maximin LHS design","X1","X2")
    // 
    // // Compute a correlation LHS design
    // H = scidoe_lhsdesign(2,5,"criterion","correlation");
    // scf();
    // scidoe_plotlhs(H)
    // xtitle("Correlation LHS design","X1","X2")
    //
    // // Compute a maximin LHS design, with 100 iterations
    // H = scidoe_lhsdesign(2,5,"criterion","maximin","iterations",100)
    // // d is larger when k increases
    // d=min(scidoe_pdist(H))
    // scf();
    // scidoe_plotlhs(H)
    // xtitle("Maximin LHS design","X1","X2")
    //
    // // A maximin centered LHS
    // H= scidoe_lhsdesign(2,5,"criterion","centermaximin","iterations",10);
    // scf();
    // scidoe_plotlhs(H)
    // 
    // // See Maximin LHS designs when k increases.
    // // The 5 points seems to go away from the center, 
    // // which increases the minimum distance between the points.
    // grand("setsd",0);
    // H1 = scidoe_lhsdesign(2,5,"criterion","maximin","iterations",2);
    // grand("setsd",0);
    // H2 = scidoe_lhsdesign(2,5,"criterion","maximin","iterations",100);
    // d1 = min(scidoe_pdist(H1));
    // d2 = min(scidoe_pdist(H2));
    // t1=msprintf("Maximin LHS - k=2, dmin=%f",d1);
    // t2=msprintf("Maximin LHS - k=100, dmin=%f",d2);
    // scf();
    // subplot(1,2,1)
    // scidoe_plotlhs(H1)
    // xtitle(t1,"X1","X2")
    // subplot(1,2,2)
    // scidoe_plotlhs(H2)
    // xtitle(t2,"X1","X2")
    //
    // // See various correlation LHS designs
    // grand("setsd",0);
    // H1 = scidoe_lhsdesign(2,5,"criterion","correlation","iterations",2);
    // R=corrcoef(H1);
    // corr1=max(abs(R(R<>1)));
    // grand("setsd",0);
    // H2 = scidoe_lhsdesign(2,5,"criterion","correlation","iterations",100);
    // R=corrcoef(H2);
    // corr2=max(abs(R(R<>1)));
    // // We have corr2 < corr1.
    // t1=msprintf("Maximin LHS - k=2, maxcorrelation=%f",corr1);
    // t2=msprintf("Maximin LHS - k=100, maxcorrelation=%f",corr2);
    // scf();
    // subplot(1,2,1)
    // scidoe_plotlhs(H1)
    // xtitle(t1,"X1","X2")
    // subplot(1,2,2)
    // scidoe_plotlhs(H2)
    // xtitle(t2,"X1","X2")
    //
    // See also
    // scidoe_plotlhs
    //
    // Bibliography
    // McKay, M.D. Beckman, R.J. Conover, W.J. (May 1979). "A Comparison of Three Methods for Selecting Values of Input Variables in the Analysis of Output from a Computer Code" Technometrics (American Statistical Association) 21 (2): 239–245.
    // http://en.wikipedia.org/wiki/Latin_hypercube_sampling
    // http://www.mathworks.com/help/toolbox/stats/lhsdesign.html
    //
    // Authors
    // Copyright (C) 2012 - 2013 - Michael Baudin
    // Copyright (C) 2012 - Maria Christopoulou
    // Copyright (C) 2010 - 2011 - INRIA - Michael Baudin
    // Copyright (C) 2009 - Yann Collette

    s = varargin(1); // Number of variables
    n = varargin(2); // Number of points
    //
    [lhs,rhs] = argn();
    apifun_checkrhs("scidoe_lhsdesign",rhs,[2 4 6])
    apifun_checklhs("scidoe_lhsdesign",lhs,1)
    //
    // Check input
    //
    // Check type
    apifun_checktype("scidoe_lhsdesign",s,"s",1,"constant")
    apifun_checktype("scidoe_lhsdesign",n,"n",2,"constant")
    //
    // Check size
    apifun_checkscalar("scidoe_lhsdesign",s,"s",1)
    apifun_checkscalar("scidoe_lhsdesign",n,"n",2)
    //
    // Check content
    apifun_checkflint("scidoe_lhsdesign",s,"s",1)
    apifun_checkflint("scidoe_lhsdesign",n,"n",2)    
    apifun_checkgreq("scidoe_lhsdesign",s,"s",1,1)
    apifun_checkgreq("scidoe_lhsdesign",n,"n",2,1)
    //
    // Classical LHS design
    if (rhs==2) then
        H = scidoe_lhsdesignClassic(s,n)
    end
    //
    // LHS with criterion
    if (rhs>=4) then
        //
        // 1. Set the defaults
        default.criterion = "center";
        default.iterations = 5;
        //
        // 2. Manage (key,value) pairs
        options = apifun_keyvaluepairs (default,varargin(3:$))
        //
        // 3. Get parameters
        criterionvalue = options.criterion
        k = options.iterations
        //
        // Check criterion value
        apifun_checktype("scidoe_lhsdesign",criterionvalue,"criterionkey",4,"string");
        apifun_checkscalar("scidoe_lhsdesign",criterionvalue,"criterionkey",4);
        apifun_checkoption("scidoe_lhsdesign",criterionvalue,"criterionkey",4,["center" "maximin" "correlation" "centermaximin"]);
        //
        // Check iterations value
        apifun_checktype("scidoe_lhsdesign",k,"k",4,"constant");
        apifun_checkscalar("scidoe_lhsdesign",k,"k",4);
        apifun_checkgreq("scidoe_lhsdesign",k,"k",4,1);
        apifun_checkflint("scidoe_lhsdesign",k,"k",4);
        //
        select criterionvalue
        case "center"
            // Center criterion
            H = scidoe_lhsdesignCenter(s,n)
            //
        case "maximin"
            // Maximin criterion
            H = scidoe_lhsdesignMaximin(s,n,k,"maximin")
        case "centermaximin"
            // Maximin criterion
            H = scidoe_lhsdesignMaximin(s,n,k,"centermaximin")
        case "correlation"
            // Correlation criterion
            H = scidoe_lhsdesignCorr(s,n)
        end
    end
endfunction
function H = scidoe_lhsdesignClassic(s,n)
    // A classical LHS design
    cut = linspace ( 0 , 1 , n + 1 )'
    // Fill points uniformly in each interval
    u = grand(n,s,"unf",0,1)
    a = cut(1 : n)
    b = cut(2 : n+1)
    rdpoints = zeros(n,s)
    for j = 1 : s
        rdpoints(:,j)  = u(:,j) .* (b-a) + a
    end
    // Make the random pairings
    H = zeros(n,s)
    for j = 1 : s
        order = grand(1,"prm",(1:n)')
        H ( 1 : n , j ) = rdpoints ( order , j )
    end
endfunction
function H = scidoe_lhsdesignCenter(s,n)
    // A centered LHS design
    cut = linspace(0,1,n+1)';
    a = cut(1 : n)
    b = cut(2 : n+1)
    _center=(a+b)/2;
    // Make the random pairings
    H = zeros(n,s)
    for j=1:s
        H(:,j) = grand(1,"prm",_center);
    end
endfunction

function H = scidoe_lhsdesignMaximin(s,n,k,lhstype)
    maxdist=0
    // Maximize the minimimum distance between points
    for i=1:k
        if (lhstype=="maximin") then
            Hcandidate=scidoe_lhsdesignClassic(s,n);
        else
            Hcandidate=scidoe_lhsdesignCenter(s,n);
        end
        d = scidoe_pdist(Hcandidate)
        if (maxdist<min(d)) then
            maxdist=min(d)
            H=Hcandidate;
            //mprintf("%s: i=%d, maxdist=%f\n","scidoe_lhsdesign",i,maxdist)
        end
    end
endfunction

function H = scidoe_lhsdesignCorr(s,n,k)
    mincorr=%inf
    // Minimize the components correlation coefficients
    for i=1:k
        // Generate a random LHS
        Hcandidate=scidoe_lhsdesignClassic(s,n);
        R=corrcoef(Hcandidate)
        if (max(abs(R(R<>1)))<mincorr) then
            mincorr=max(abs(R(R<>1)))
            H=Hcandidate
            //mprintf("%s: i=%d, mincorr=%f\n","scidoe_lhsdesign",i,mincorr)
        end
    end
endfunction
