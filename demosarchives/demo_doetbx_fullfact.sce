//Demo function for doetbx_fullfact.sci

mprintf("=========================================================\n");
mprintf("This is a demo for the doetbx_fullfact function of Scidoe\n\n");
//Input number of factors
n=input("Please enter a row vector. Each element represents the levels of each input factor:");

//Check input arguments
apifun_checkvecrow("input",n,"n",1);
apifun_checkflint("input",n,"n",1);

B = [];
B = doetbx_fullfact(n);

disp(B);

mprintf("\nEnd of doetbx_fullfact Demo.\n");
mprintf("=========================================================\n");

filename = 'demo_doetbx_fullfact.sce';
dname = get_absolute_file_path(filename);
editor ( dname + filename );
