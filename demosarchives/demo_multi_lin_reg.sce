//This is a demo script for doetbx_multi_lin_reg.sci
// of DOE toolbox.

X1 = [83.0 88.5 88.2 89.5 96.2 98.1 99.0 100.0 101.2 104.6 108.4 110.8 112.6 114.2 115.7 116.9];
X2 = [234289 259426 258054 284599 328975 346999 365385 363112 397469 419180 442769 444546 482704 502601 518173 554894];
X = [83.0 88.5 88.2 89.5 96.2 98.1 99.0 100.0 101.2 104.6 108.4 110.8 112.6 114.2 115.7 116.9;234289 259426 258054 284599 328975 346999 365385 363112 397469 419180 442769 444546 482704 502601 518173 554894];

Y = [60323;61122];

mprintf("Start of Multiple Linear Regression Demo\n\n")
H = doetbx_multi_lin_reg(X,Y);
y = H(0) + H(1)*X1 + H(2)*X2;

mprintf("The linear equation is\n");
mprintf("y = %f %f *x1 %f*x2 %f\n\n",H(1),H(2));

scf();
plot2d(X,Y,"bo",X,y,"red");
title('Multiple Linear Regression Demo');
xlabel('X');
ylabel('Y');

mprintf("Plot Results\n\n")
mprintf("End of Demo\n");

filename = 'demo_multiple_lin_reg.sce';
dname = get_absolute_file_path(filename);
editor ( dname + filename );
