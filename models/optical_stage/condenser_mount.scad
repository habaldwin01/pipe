

$fn=64;

sh_through = 4;
sh_countersink = 3;
sh_thread = 2.7;


mounting_holes_height = 30;
mounting_holes_width = 40;

thickness = 5;

translate([0,5,0])difference() {
    union() {
        hull() {
            translate([-mounting_holes_height/2,mounting_holes_width/2,0])cylinder(thickness,5,5);
            translate([mounting_holes_height/2,mounting_holes_width/2,0])cylinder(thickness,5,5);
            translate([-mounting_holes_height/2,-mounting_holes_width/2,0])cylinder(thickness,5,5);
            translate([mounting_holes_height/2,-mounting_holes_width/2,0])cylinder(thickness,5,5);
            translate([0,0,0])cylinder(thickness, 47/2, 47/2);
        }
    }
    
    translate([0,0,-1])cylinder(20, 38/2, 38/2);
    translate([0,0,thickness - 1])cylinder(20,42/2,42/2);
    
    
    translate([-mounting_holes_height/2,mounting_holes_width/2,-1])cylinder(15, sh_thread/2, sh_thread/2);
    translate([mounting_holes_height/2,mounting_holes_width/2,-1])cylinder(15, sh_thread/2, sh_thread/2);
    translate([-mounting_holes_height/2,-mounting_holes_width/2,-1])cylinder(15, sh_thread/2, sh_thread/2);
    translate([mounting_holes_height/2,-mounting_holes_width/2,-1])cylinder(15, sh_thread/2, sh_thread/2);
}