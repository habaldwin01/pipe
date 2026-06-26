$fn=64;

sh_through = 4;
sh_countersink = 3;
sh_thread = 4.75; // 2.7 for tapping, 4.75 for brass insert
sh_thread_depth = 6;
sh_through_wide = 5;


mounting_holes_height = 68;
mounting_holes_width = 35;

slide_height = 26.5;
slide_width = 77;

fluidics_gap = 50;
mount_gap = 30;

translate([0,0,0])difference() {
    union() {
        translate([mount_gap/2,0,0])hull() {
            translate([(-10/2),-50/2,0])cube([10,50,10]);
            translate([(-15/2),-45/2,0])cube([15,45,10]);
        }
        translate([-mount_gap/2,0,0])hull() {
            translate([(-10/2),-50/2,0])cube([10,50,10]);
            translate([(-15/2),-45/2,0])cube([15,45,10]);
        }
        hull() {
            translate([-mounting_holes_height/2,-mounting_holes_width/2,0])cylinder(10,5,5);
            translate([-mounting_holes_height/2,mounting_holes_width/2,0])cylinder(10,5,5);
            translate([mounting_holes_height/2,-mounting_holes_width/2,0])cylinder(10,5,5);
            translate([mounting_holes_height/2,mounting_holes_width/2,0])cylinder(10,5,5);
        }
    }
    
    // optical hole
    translate([0,0,-1])cylinder(20, 18/2, 18/2);
    hull() {
        translate([0,0,1])cylinder(5, 18/2, 26/2);
        translate([0,0,6])cylinder(10, 26/2, 26/2);
    }
    
    
    
    
    //translate([-60/2,-25/2,5])cube([60,25,100]);
    

    translate([0,mounting_holes_width / 2,-1])cylinder(30, sh_thread/2, sh_thread/2);
    translate([0,-mounting_holes_width / 2,-1])cylinder(30, sh_thread/2, sh_thread/2);
    translate([-fluidics_gap/2,mounting_holes_width / 2,-1])cylinder(30, sh_thread/2, sh_thread/2);
    translate([-fluidics_gap/2,-mounting_holes_width / 2,-1])cylinder(30, sh_thread/2, sh_thread/2);
    translate([fluidics_gap/2,mounting_holes_width / 2,-1])cylinder(30, sh_thread/2, sh_thread/2);
    translate([fluidics_gap/2,-mounting_holes_width / 2,-1])cylinder(30, sh_thread/2, sh_thread/2);


    translate([-mount_gap/2,mounting_holes_width / 2 + 10,5])rotate([90,0,0])cylinder(15, sh_thread/2, sh_thread/2);
    translate([-mount_gap/2,-mounting_holes_width / 2 - 10,5])rotate([-90,0,0])cylinder(15, sh_thread/2, sh_thread/2);
    translate([mount_gap/2,mounting_holes_width / 2 + 10,5])rotate([90,0,0])cylinder(15, sh_thread/2, sh_thread/2);
    translate([mount_gap/2,-mounting_holes_width / 2 - 10,5])rotate([-90,0,0])cylinder(15, sh_thread/2, sh_thread/2);
    //translate([-mount_gap/2,mounting_holes_width / 2 - 5,5])rotate([90,0,0])cylinder(20, sh_through_wide/2, sh_through_wide/2);
    //translate([-mount_gap/2,-mounting_holes_width / 2 + 5,5])rotate([-90,0,0])cylinder(20, sh_through_wide/2, sh_through_wide/2);
    //translate([mount_gap/2,mounting_holes_width / 2 - 5,5])rotate([90,0,0])cylinder(20, sh_through_wide/2, sh_through_wide/2);
    //translate([mount_gap/2,-mounting_holes_width / 2 + 5,5])rotate([-90,0,0])cylinder(20, sh_through_wide/2, sh_through_wide/2);
}
