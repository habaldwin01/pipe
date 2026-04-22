$fn=64;

sh_through = 4;
sh_countersink = 3;
sh_thread = 2.7;


mounting_holes_height = 50;
mounting_holes_width = 20;

plate_thickness = 5;

translate([0,0,plate_thickness])rotate([0,180,0])difference() {
    union() {
        hull() {
            translate([-mounting_holes_height/2,-mounting_holes_width/2,0])cylinder(plate_thickness,4,4);
            translate([-mounting_holes_height/2,mounting_holes_width/2,0])cylinder(plate_thickness,4,4);
            translate([mounting_holes_height/2,-mounting_holes_width/2,0])cylinder(plate_thickness,4,4);
            translate([mounting_holes_height/2,mounting_holes_width/2,0])cylinder(plate_thickness,4,4);
        }
    }
    
    translate([-50/2,-10/2,-20+plate_thickness-2])cube([50,10,20]);
    translate([-40/2,-20/2,-20+plate_thickness-2])cube([40,20,20]);
    
    translate([-27/2,-10/2,-20+plate_thickness-1])cube([27,10,20]);
    
    translate([-27/2-5,-10/2,-20+plate_thickness+2])cube([5,10,20]);
    
    // through holes for luer mounts
    translate([-mounting_holes_height/2,mounting_holes_width / 2,-1])cylinder(30, sh_through/2, sh_through/2);
    translate([-mounting_holes_height/2,-mounting_holes_width / 2,-1])cylinder(30, sh_through/2, sh_through/2);
    translate([mounting_holes_height/2,mounting_holes_width / 2,-1])cylinder(30, sh_through/2, sh_through/2);
    translate([mounting_holes_height/2,-mounting_holes_width / 2,-1])cylinder(30, sh_through/2, sh_through/2);
    
    translate([-mounting_holes_height/2,mounting_holes_width / 2,plate_thickness+1.5-sh_countersink])cylinder(sh_countersink, sh_through/2, sh_countersink + (sh_through/2));
    translate([-mounting_holes_height/2,-mounting_holes_width / 2,plate_thickness+1.5-sh_countersink])cylinder(sh_countersink, sh_through/2, sh_countersink + (sh_through/2));
    translate([mounting_holes_height/2,mounting_holes_width / 2,plate_thickness+1.5-sh_countersink])cylinder(sh_countersink, sh_through/2, sh_countersink + (sh_through/2));
    translate([mounting_holes_height/2,-mounting_holes_width / 2,plate_thickness+1.5-sh_countersink])cylinder(sh_countersink, sh_through/2, sh_countersink + (sh_through/2));
    
    

}