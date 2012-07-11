mode(1)
//
// Demo of scidoe_ff2n.sci
//

// Create a full factorial design with :
// 2 levels for the first factor
// 2 levels for the second factor
B=scidoe_ff2n(2)
halt()   // Press return to continue
 
// For three factors
B=scidoe_ff2n(3)
halt()   // Press return to continue
 
// For four factors
B=scidoe_ff2n(4)
halt()   // Press return to continue
 
// Visualise a factorial design
H = scidoe_ff2n(3);
h = scf();
param3d(H(:,1),H(:,2),H(:,3))
h.children.children.mark_mode="on";
h.children.children.line_mode="off";
h.children.children.mark_size=1;
scidoe_plotcube(3)
halt()   // Press return to continue
 
//========= E N D === O F === D E M O =========//

//
// Load this script into the editor
//
filename = "scidoe_ff2n.dem.sce";
dname = get_absolute_file_path(filename);
editor ( fullfile(dname,filename) )