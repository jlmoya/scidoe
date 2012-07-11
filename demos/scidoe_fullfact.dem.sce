mode(1)
//
// Demo of scidoe_fullfact.sci
//

// Create a full factorial design with :
// 2 levels for the first factor
// 3 levels for the second factor
B=scidoe_fullfact([2 3])
halt()   // Press return to continue
 
// Create a full factorial design with :
// 2 levels for the first factor
// 3 levels for the second factor
// 4 levels for the third factor
B=scidoe_fullfact([2 3 4])
halt()   // Press return to continue
 
//========= E N D === O F === D E M O =========//

//
// Load this script into the editor
//
filename = "scidoe_fullfact.dem.sce";
dname = get_absolute_file_path(filename);
editor ( fullfile(dname,filename) )