mode(1)
//
// Demo of scidoe_simplelinreg.sci
//

X = [
57.
64.
69.
82.
92.
111.
114.
132.
144.
146.
]
Y = [
121.
129.
140.
164.
188.
217.
231.
264.
289.
294.
]
B = scidoe_simplelinreg(X,Y)
expected = [4.8222564  1.9671389]
// Visually check the result:
scf();
plot(X,Y,"bo");
L = B(1)+B(2)*X;
plot(X,L,"r-")
legend(["Data","Linear Fit"]);
xtitle("Linear Regression","X","Y");
halt()   // Press return to continue
 
// Compute a 95% confidence interval.
// Visually check the results.
// Visually check the residuals.
// Reference :
// http://en.wikipedia.org/wiki/Simple_linear_regression
Height = [
1.47    1.50    1.52    1.55    1.57    ..
1.60    1.63    1.65    1.68    1.70    ..
1.73    1.75    1.78    1.80    1.83
];
Mass =[
52.21    53.12    54.48    55.84    57.20    ..
58.57    59.93    61.29    63.11    64.47    ..
66.28    68.10    69.92    72.19    74.46
];
[B,bint] = scidoe_simplelinreg(Height,Mass);
Bexpected = [
-39.062
61.272
];
Bintexpected = [
-45.4 -32.7
57.4 65.1
];
// Visually check the result:
scf();
Height = Height(:);
Mass = Mass();
plot(Height,Mass,"bo");
L = B(1)+B(2)*Height;
plot(Height,L,"r-")
legend(["Data","Linear Fit"]);
xtitle("Linear Regression","Height","Mass");
// Compute the residuals
[B,bint,r] = scidoe_simplelinreg(Height,Mass);
// Visually see the residuals
scf();
plot(Height,r,"bo");
xtitle("Linear Regression","Height","Residuals");
// A quadratic fit would be better:
// we see a quadratic pattern in the residuals.
// See the standardized residuals
[B,bint,r,stats] = scidoe_simplelinreg(Height,Mass);
disp(stats)
scf();
plot(Height,r/sqrt(stats.sigma2),"bo");
xtitle("Linear Regression","Height","Standard Residuals");
halt()   // Press return to continue
 
// Create a dataset
grand("setsd",0);
// The number of observations
N = 100;
// The exact coefficients
B = [2;3]
// The input
Xmin = 50;
Xmax = 150;
X=grand(N,1,"uin",Xmin,Xmax);
X=gsort(X,"g","i");
// Compute the ouput from the input
Y = B(1)+B(2)*X;
// Add a normal noise to the output
sigma = 5;
e = grand(N,1,"nor",0,sigma);
Y = int(Y + e);
// Linear regression
B = scidoe_simplelinreg(X,Y)
// Compare B (exact) with B (estimate)
[B,B]
scf();
plot(X,Y,"bo");
L = B(1)+B(2)*X;
plot(X,L,"r-")
legend(["Data","Linear Fit"]);
xtitle("Linear Regression","X","Y");
halt()   // Press return to continue
 
//========= E N D === O F === D E M O =========//

//
// Load this script into the editor
//
filename = "scidoe_simplelinreg.dem.sce";
dname = get_absolute_file_path(filename);
editor ( fullfile(dname,filename) )