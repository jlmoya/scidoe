//This is a demo script for doetbx_simple_lin_reg.sci
// of DOE toolbox.


X = [0.2 337.4 118.2 884.6 10.1 226.5 666.3 996.3 448.6 777.0 558.2 0.4 0.6 775.5 666.9 338.0 447.5 11.6 556.0 228.1 995.8 887.6 120.2 0.3 0.3 556.8 339.1 887.2 999.0 779.0 11.1 118.3 229.2 669.1 448.9 0.5];

Y = [0.1 338.8 118.1 888.0 9.2 228.1 668.5 998.5 449.1 778.9 559.2 0.3 0.1 778.1 668.8 339.3 448.9 10.8 557.7 228.3 998.0 888.8 119.6 0.3 0.6 557.6 339.3 888.0 998.5 778.9 10.2 117.6 228.9 668.4 449.2 0.2];

mprintf("=============================================================================\n");
mprintf("Start of Simple Linear Regression Demo\n\n")
H = doetbx_simple_lin_reg(X,Y);
y = H(1).*X + H(2);

mprintf("The linear equation is\n");
mprintf("y = %f *x %f\n\n",H(1),H(2));

scf();
plot(X,Y,"bo",X,y,"red");
title('Simple Linear Regression Demo');
xlabel('X');
ylabel('Y');

mprintf("Plot Results\n\n")
mprintf("End of Demo\n");
mprintf("=============================================================================\n");

filename = 'demo_simple_lin_reg.sce';
dname = get_absolute_file_path(filename);
editor ( dname + filename );
