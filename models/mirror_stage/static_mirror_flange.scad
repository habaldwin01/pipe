$fn=64;

sh_through = 4;
sh_countersink = 3;
sh_thread = 2.7;

mounting_holes_height = 40;
mounting_holes_width = 40;

optical_hole = 30;

plate_thickness = 2;

screw_cup_thickness = 5;

fudge_factor = 0.5;

translate([0,0,0])difference() {
    union() {
        hull() {
            translate([-mounting_holes_height/2,mounting_holes_width/2,0])cylinder(plate_thickness,5,5);
            translate([mounting_holes_height/2,mounting_holes_width/2,0])cylinder(plate_thickness,5,5);
            translate([-mounting_holes_height/2,-mounting_holes_width/2,0])cylinder(plate_thickness,5,5);
            translate([mounting_holes_height/2,-mounting_holes_width/2,0])cylinder(plate_thickness,5,5);
        }
        
        translate([-mounting_holes_height/2,mounting_holes_width/2,0])cylinder(screw_cup_thickness,5,5);
        translate([mounting_holes_height/2,mounting_holes_width/2,0])cylinder(screw_cup_thickness,5,5);
        translate([-mounting_holes_height/2,-mounting_holes_width/2,0])cylinder(screw_cup_thickness,5,5);
        translate([mounting_holes_height/2,-mounting_holes_width/2,0])cylinder(screw_cup_thickness,5,5);

        hull() {
            translate([-mounting_holes_height/2,0,0])cylinder(screw_cup_thickness,5,5);
            translate([mounting_holes_height/2,0,0])cylinder(screw_cup_thickness,5,5);
        }
        hull() {
            translate([0,-mounting_holes_height/2,0])cylinder(screw_cup_thickness,5,5);
            translate([0,mounting_holes_height/2,0])cylinder(screw_cup_thickness,5,5);
        }

        translate([0,0,0])cylinder(screw_cup_thickness,(optical_hole+4)/2,(optical_hole+4)/2);
    }
    
    
    translate([0,0,-1])cylinder(20,optical_hole/2,optical_hole/2);
    
    translate([-mounting_holes_height/2,mounting_holes_width/2,-1])cylinder(15, sh_through/2, sh_through/2);
    translate([mounting_holes_height/2,mounting_holes_width/2,-1])cylinder(15, sh_through/2, sh_through/2);
    translate([-mounting_holes_height/2,-mounting_holes_width/2,-1])cylinder(15, sh_through/2, sh_through/2);
    translate([mounting_holes_height/2,-mounting_holes_width/2,-1])cylinder(15, sh_through/2, sh_through/2);
    translate([-mounting_holes_height/2,mounting_holes_width/2,screw_cup_thickness-sh_countersink+1])cylinder(sh_countersink, sh_through/2, sh_countersink + (sh_through/2));
    translate([mounting_holes_height/2,mounting_holes_width/2,screw_cup_thickness-sh_countersink+1])cylinder(sh_countersink, sh_through/2, sh_countersink + (sh_through/2));
    translate([-mounting_holes_height/2,-mounting_holes_width/2,screw_cup_thickness-sh_countersink+1])cylinder(sh_countersink, sh_through/2, sh_countersink + (sh_through/2));
    translate([mounting_holes_height/2,-mounting_holes_width/2,screw_cup_thickness-sh_countersink+1])cylinder(sh_countersink, sh_through/2, sh_countersink + (sh_through/2));


    translate([mounting_holes_height/2,0,-1])cylinder(15, sh_through/2, sh_through/2);
    translate([mounting_holes_height/2,0,-1])cylinder(sh_countersink, sh_countersink + (sh_through/2), sh_through/2);
    translate([-mounting_holes_height/2,0,-1])cylinder(15, sh_through/2, sh_through/2);
    translate([-mounting_holes_height/2,0,-1])cylinder(sh_countersink, sh_countersink + (sh_through/2), sh_through/2);
    translate([0,mounting_holes_height/2,-1])cylinder(15, sh_through/2, sh_through/2);
    translate([0,mounting_holes_height/2,-1])cylinder(sh_countersink, sh_countersink + (sh_through/2), sh_through/2);
    translate([0,-mounting_holes_height/2,-1])cylinder(15, sh_through/2, sh_through/2);
    translate([0,-mounting_holes_height/2,-1])cylinder(sh_countersink, sh_countersink + (sh_through/2), sh_through/2);
}
