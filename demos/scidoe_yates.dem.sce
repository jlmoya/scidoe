mode(1)
//
// Demo of scidoe_yates.sci
//

D = scidoe_ff2n(3); // complete 2^3 design in standard order.
y = [60 72 54 68 52 83 45 80]'; // Responses to design D.
[ef,id] = scidoe_yates(y);
halt()   // Press return to continue
 
//========= E N D === O F === D E M O =========//

//
// Load this script into the editor
//
filename = "scidoe_yates.dem.sce";
dname = get_absolute_file_path(filename);
editor ( fullfile(dname,filename) )