mode(1)
//
// Demo of scidoe_bbdesign.sci
//

// Create a Box-Benkhen Design with three
// variables one repetition of center:
H = scidoe_bbdesign(3)
halt()   // Press return to continue
 
// With three variables and the
// center repeated two times:
H = scidoe_bbdesign(3,2)
halt()   // Press return to continue
 
// Visualise a Box-Benhken Design
// with three factors and one repetition of center.
H = scidoe_bbdesign(3)
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
filename = "scidoe_bbdesign.dem.sce";
dname = get_absolute_file_path(filename);
editor ( fullfile(dname,filename) )