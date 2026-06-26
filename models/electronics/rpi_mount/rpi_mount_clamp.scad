
$fn=64;

cam_offset = 15;

sh_through = 4;
sh_countersink = 3;
sh_thread = 4.5; // 2.7 for tapping, 4.5 for brass insert


translate([0,0,0])difference() {
    union() {
        hull() {
            translate([-65/2,67,0])cylinder(5, 5, 5);
            translate([-65/2,0,0])cylinder(5, 5, 5);
            translate([65/2,67,0])cylinder(5, 5, 5);
            translate([65/2,0,0])cylinder(5, 5, 5);
        }
        translate([0,0,0])hull() {
            translate([-70/2,45,0])cylinder(5, 8, 8);
            translate([0,45,0])cylinder(5, 8, 8);
        }
    }
 
    translate([-70/2,45,-1])cylinder(7, 5, 5);
    
    // rpi carrier mount holes
    translate([-60/2,-50,-1])cylinder(15, sh_through/2, sh_through/2);
    translate([60/2,-50,-1])cylinder(15, sh_through/2, sh_through/2);
    translate([-60/2,-25,-1])cylinder(15, sh_through/2, sh_through/2);
    translate([60/2,-25,-1])cylinder(15, sh_through/2, sh_through/2);
    
    translate([-54/2,5 + 5,-1])cube([54 + 20,54,8]);
    translate([-54/2,70,-1])cube([54 + 20,54,8]);
    translate([-44/2,5 + 2.5,-1])cube([80,80,8]);
    
    translate([-44/2,5,-1])cube([44,80,8]);
    hull() {
        translate([14,4,0])cube([10,50,5]);
        translate([14,1,3])cube([10,50,5]);
    }
    
    translate([-65/2,0,-1])cylinder(15, sh_through/2, sh_through/2);
    translate([-65/2,67,-1])cylinder(15, sh_through/2, sh_through/2);
    translate([65/2,0,-1])cylinder(15, sh_through/2, sh_through/2);
    translate([-65/2,0,3])cylinder(sh_countersink, sh_through/2, sh_countersink + (sh_through/2));
    translate([-65/2,67,3])cylinder(sh_countersink, sh_through/2, sh_countersink + (sh_through/2));
    translate([65/2,0,3])cylinder(sh_countersink, sh_through/2, sh_countersink + (sh_through/2));
}


translate([0,0,0])difference() {
    union() {
        hull() {
            translate([65/2,87,0])cylinder(5, 5, 5);
            translate([65/2,0,0])cylinder(5, 5, 5);
            translate([-65/2,87,0])cylinder(5, 5, 5);
            translate([-65/2,0,0])cylinder(5, 5, 5);
        }
    }
    //top left cutout
    translate([-80,-10,-1])cube([200,72,8]);
    translate([-80,-10,-1])cube([80,200,8]);
    
    translate([-54/2,5 + 5,-1])cube([54,53,8]);
    translate([-44/2,5,-1])cube([44,90,8]);
    
    translate([-44/2,70-2,-1])cube([48,90,8]);
    
    translate([65/2,67,-1])cylinder(15, sh_through/2, sh_through/2);
    translate([65/2,87,-1])cylinder(15, sh_through/2, sh_through/2);
    translate([65/2,67,3])cylinder(sh_countersink, sh_through/2, sh_countersink + (sh_through/2));
    translate([65/2,87,3])cylinder(sh_countersink, sh_through/2, sh_countersink + (sh_through/2));
}