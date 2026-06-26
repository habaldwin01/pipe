use <threadlib/threadlib.scad>
$fn=64;


sh_through = 4;
sh_countersink = 3;
sh_thread = 4.5; // 2.7 for tapping, 4.5 for brass insert

shoulder_size = 2;
thickness = 10;
wall_thickness = 2;

through_casing_radius = sh_through/2 + wall_thickness;

mounting_holes_height = 30;
mounting_holes_width = 40;

eyepiece_distance = 20;

difference() {
    union() {
        hull() {
            translate([0,-20,0])cylinder(eyepiece_distance, through_casing_radius,through_casing_radius);
            translate([0,0,0])cylinder(eyepiece_distance, 29/2 + 2, 29/2 + 2);
            translate([0,20,0])cylinder(eyepiece_distance, through_casing_radius,through_casing_radius);
        }
    }
    
    translate([0,0,-shoulder_size-8])cylinder(eyepiece_distance,29/2,29/2);
    translate([0,0,eyepiece_distance-shoulder_size-8])cylinder(8,29/2,22/2);
    translate([0,0,-1])cylinder(eyepiece_distance+2,22/2,22/2);
    
    translate([0,-20,-1])cylinder(50, sh_through/2, sh_through/2);
    translate([0,20,-1])cylinder(50, sh_through/2, sh_through/2);
}