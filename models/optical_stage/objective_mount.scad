use <threadlib/threadlib.scad>
$fn=64;

sh_through = 4;
sh_countersink = 3;
sh_thread = 2.7;


plate_thickness = 4;

mounting_holes_height = 50;
mounting_holes_width = 20;

translate([0,0,0])difference() {
    union() {
        difference() {
            hull() {
                translate([-mounting_holes_height/2,-mounting_holes_width/2,0])cylinder(plate_thickness,5,5);
                translate([-mounting_holes_height/2,mounting_holes_width/2,0])cylinder(plate_thickness,5,5);
                translate([mounting_holes_height/2,-mounting_holes_width/2,0])cylinder(plate_thickness,5,5);
                translate([mounting_holes_height/2,mounting_holes_width/2,0])cylinder(plate_thickness,5,5);
            }
            translate([0,0,-1])cylinder(20, 25/2, 25/2);
        }
        translate([0,0,0.35])nut("RMS", turns=8, Douter=28, nut_sides=64);
        
    }
    
    translate([0,0,plate_thickness])cylinder(10, 27/2, 27/2);
    
    translate([0,0,plate_thickness + 1])cylinder(10, 31/2, 31/2);
    
    
    translate([80/2 - 20,20,5])rotate([0,90,0])cylinder(30, sh_thread/2, sh_thread/2);
    translate([-80/2 + 20,20,5])rotate([0,-90,0])cylinder(30, sh_thread/2, sh_thread/2);
    translate([80/2 - 20,-20,5])rotate([0,90,0])cylinder(30, sh_thread/2, sh_thread/2);
    translate([-80/2 + 20,-20,5])rotate([0,-90,0])cylinder(30, sh_thread/2, sh_thread/2);
    
    
    translate([-mounting_holes_height/2,mounting_holes_width/2,-1])cylinder(15, sh_through/2, sh_through/2);
    translate([mounting_holes_height/2,mounting_holes_width/2,-1])cylinder(15, sh_through/2, sh_through/2);
    translate([-mounting_holes_height/2,-mounting_holes_width/2,-1])cylinder(15, sh_through/2, sh_through/2);
    translate([mounting_holes_height/2,-mounting_holes_width/2,-1])cylinder(15, sh_through/2, sh_through/2);
    translate([-mounting_holes_height/2,mounting_holes_width/2,-1])cylinder(sh_countersink, sh_countersink + (sh_through/2), sh_through/2);
    translate([mounting_holes_height/2,mounting_holes_width/2,-1])cylinder(sh_countersink, sh_countersink + (sh_through/2), sh_through/2);
    translate([-mounting_holes_height/2,-mounting_holes_width/2,-1])cylinder(sh_countersink, sh_countersink + (sh_through/2), sh_through/2);
    translate([mounting_holes_height/2,-mounting_holes_width/2,-1])cylinder(sh_countersink, sh_countersink + (sh_through/2), sh_through/2);
}