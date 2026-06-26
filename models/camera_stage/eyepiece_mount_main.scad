use <threadlib/threadlib.scad>
$fn=64;


sh_through = 4;
sh_countersink = 3;
sh_thread = 4.5; // 2.7 for tapping, 4.5 for brass insert


shoulder_size = 2;
thickness = 5;
wall_thickness = 2;

through_casing_radius = sh_through/2 + wall_thickness;

mounting_holes_height = 30;
mounting_holes_width = 40;

difference() {
    union() {
        hull() {
            translate([0,-20,0])cylinder(31.5+shoulder_size-1, through_casing_radius,through_casing_radius);
            translate([0,0,0])cylinder(31.5+shoulder_size-1, 29/2 + 2, 29/2 + 2);
            translate([0,20,0])cylinder(31.5+shoulder_size-1, through_casing_radius,through_casing_radius);
        }
        hull() {
            translate([-mounting_holes_height/2,mounting_holes_width/2,0])cylinder(thickness,5,5);
            translate([mounting_holes_height/2,mounting_holes_width/2,0])cylinder(thickness,5,5);
            translate([-mounting_holes_height/2,-mounting_holes_width/2,0])cylinder(thickness,5,5);
            translate([mounting_holes_height/2,-mounting_holes_width/2,0])cylinder(thickness,5,5);
        }
    }
    
    translate([0,0,shoulder_size])cylinder(31.5+1,29/2,29/2);
    translate([0,0,-1])cylinder(10,24/2,24/2);
    
    
    translate([0,-20,-1])cylinder(50, sh_thread/2, sh_thread/2);
    translate([0,20,-1])cylinder(50, sh_thread/2, sh_thread/2);
    
    translate([-mounting_holes_height/2,mounting_holes_width/2,-1])cylinder(15, sh_thread/2, sh_thread/2);
    translate([mounting_holes_height/2,mounting_holes_width/2,-1])cylinder(15, sh_thread/2, sh_thread/2);
    translate([-mounting_holes_height/2,-mounting_holes_width/2,-1])cylinder(15, sh_thread/2, sh_thread/2);
    translate([mounting_holes_height/2,-mounting_holes_width/2,-1])cylinder(15, sh_thread/2, sh_thread/2);
}
