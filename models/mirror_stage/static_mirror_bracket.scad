$fn=64;

sh_through = 4;
sh_countersink = 3;
sh_thread = 4.75; // 2.7 for tapping, 4.75 for brass insert

mounting_holes_height = 40;

optical_hole = 30;

plate_thickness = 2;

bracket_height = (8-5) + 13;

fudge_factor = 0.5;

difference() {
    union() {
        hull() {
            translate([-mounting_holes_height/2,0,0])cylinder(bracket_height,5,5);
            translate([mounting_holes_height/2,0,0])cylinder(bracket_height,5,5);
        }
        hull() {
            translate([0,-mounting_holes_height/2,0])cylinder(bracket_height,5,5);
            translate([0,mounting_holes_height/2,0])cylinder(bracket_height,5,5);
        }
        translate([0,0,0])cylinder(bracket_height,(optical_hole+4)/2,(optical_hole+4)/2);

        
    }
    
    
    translate([0,0,2])cylinder(20,optical_hole/2,optical_hole/2);


    translate([mounting_holes_height/2,0,-1])cylinder(35, sh_thread/2, sh_thread/2);
    translate([-mounting_holes_height/2,0,-1])cylinder(35, sh_thread/2, sh_thread/2);
    translate([0,mounting_holes_height/2,-1])cylinder(35, sh_thread/2, sh_thread/2);
    translate([0,-mounting_holes_height/2,-1])cylinder(35, sh_thread/2, sh_thread/2);

    translate([0,0,-1])cylinder(15, sh_thread/2, sh_thread/2);
}

difference() {
    translate([0,0,0])cylinder(8,10/2,10/2);
    translate([0,0,-1])cylinder(15, sh_thread/2, sh_thread/2);
}