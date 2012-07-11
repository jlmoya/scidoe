mode(1)
//
// Demo of scidoe_ryates.sci
//

D = scidoe_ff2n(3);
y = [60 72 54 68 52 83 45 80]';
[ef,id] = scidoe_yates(y)
y1 = scidoe_ryates(ef)
halt()   // Press return to continue
 
//========= E N D === O F === D E M O =========//

//
// Load this script into the editor
//
filename = "scidoe_ryates.dem.sce";
dname = get_absolute_file_path(filename);
editor ( fullfile(dname,filename) )