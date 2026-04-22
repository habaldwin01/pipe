$fn = 64;

// 6 and 4.5 for M5
// 5 and 3.6 for M4
// 4 and 2.7 for M3
sh_through = 4;
sh_countersink = 3;
sh_thread = 2.7;

cam_offset = 2.5;

mounting_holes_height = 40;
mounting_holes_width = 30;

cover_thickness = 3;

translate([0,30,0])difference() {
    union() {
        hull() {
            translate([-40/2,30/2,0])cylinder(cover_thickness, 5, 5);
            translate([40/2,30/2,0])cylinder(cover_thickness, 5, 5);
            translate([-40/2,-30/2,0])cylinder(cover_thickness, 5, 5);
            translate([40/2,-30/2,0])cylinder(cover_thickness, 5, 5);
        }
    }

    //translate([-26/2,-25/2 - cam_offset,cover_thickness - 0.5])cube([26,25,100]); // actual board
    
    
    translate([-26/2,4,cover_thickness - 4])cube([26,15,100]); // ribbon_cable_slot
    
    translate([-22/2,-25/2 - cam_offset,cover_thickness - 4])cube([22,25,100]);
    
    translate([-mounting_holes_height/2,mounting_holes_width/2,-1])cylinder(15, sh_through/2, sh_through/2);
    translate([mounting_holes_height/2,mounting_holes_width/2,-1])cylinder(15, sh_through/2, sh_through/2);
    translate([-mounting_holes_height/2,-mounting_holes_width/2,-1])cylinder(15, sh_through/2, sh_through/2);
    translate([mounting_holes_height/2,-mounting_holes_width/2,-1])cylinder(15, sh_through/2, sh_through/2);
    translate([-mounting_holes_height/2,mounting_holes_width/2,-1])cylinder(sh_countersink, sh_countersink + (sh_through/2), sh_through/2);
    translate([mounting_holes_height/2,mounting_holes_width/2,-1])cylinder(sh_countersink, sh_countersink + (sh_through/2), sh_through/2);
    translate([-mounting_holes_height/2,-mounting_holes_width/2,-1])cylinder(sh_countersink, sh_countersink + (sh_through/2), sh_through/2);
    translate([mounting_holes_height/2,-mounting_holes_width/2,-1])cylinder(sh_countersink, sh_countersink + (sh_through/2), sh_through/2);
    
    translate([-mounting_holes_height/2,0,-1])cylinder(15, sh_through/2, sh_through/2);
    translate([mounting_holes_height/2,0,-1])cylinder(15, sh_through/2, sh_through/2);
    translate([-mounting_holes_height/2,0,-1])cylinder(sh_countersink, sh_countersink + (sh_through/2), sh_through/2);
    translate([mounting_holes_height/2,0,-1])cylinder(sh_countersink, sh_countersink + (sh_through/2), sh_through/2);
}

translate([0,-30,0])difference() {
    union() {
        hull() {
            translate([-40/2,30/2,0])cylinder(5, 5, 5);
            translate([40/2,30/2,0])cylinder(5, 5, 5);
            translate([-40/2,-30/2,0])cylinder(5, 5, 5);
            translate([40/2,-30/2,0])cylinder(5, 5, 5);
        }
    }

    translate([-25.5/2,-24.5/2 + cam_offset,5-1.2])cube([25.5,24.5,100]); // actual board
    
    translate([-12/2, -12/2, -1])cube([12, 12, 20]);
    translate([-15/2, 14-10, 5-4])cube([15, 10, 20]);
    translate([-15/2, -15/2, 5-4])cube([15, 15, 20]);
    
    translate([-mounting_holes_height/2,mounting_holes_width/2,-1])cylinder(15, sh_thread/2, sh_thread/2);
    translate([mounting_holes_height/2,mounting_holes_width/2,-1])cylinder(15, sh_thread/2, sh_thread/2);
    translate([-mounting_holes_height/2,-mounting_holes_width/2,-1])cylinder(15, sh_thread/2, sh_thread/2);
    translate([mounting_holes_height/2,-mounting_holes_width/2,-1])cylinder(15, sh_thread/2, sh_thread/2);
    
    
    translate([-mounting_holes_height/2,0,-1])cylinder(15, sh_through/2, sh_thread/2);
    translate([mounting_holes_height/2,0,-1])cylinder(15, sh_through/2, sh_thread/2);
}