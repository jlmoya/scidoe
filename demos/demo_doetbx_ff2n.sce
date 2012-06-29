//Demo for doetbx_ff2n

mprintf("=========================================================\n");
mprintf("This is a demo for the doetbx_ff2n function of Scidoe\n\n");
//Input number of factors
n=input("Please enter the number of input factors:");

//Check input arguments
apifun_checkscalar("input",n,"n",1);
apifun_checkflint("input",n,"n",1);

B = [];
B = doetbx_ff2n(n);

disp(B);

mprintf("\nEnd of doetbx_ff2n Demo.\n");
mprintf("=========================================================\n");

filename = 'demo_doetbx_ff2n.sce';
dname = get_absolute_file_path(filename);
editor ( dname + filename );
