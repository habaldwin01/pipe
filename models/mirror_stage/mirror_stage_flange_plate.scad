$fa=1;
$fs=0.5;

sh_through = 4;
sh_countersink = 3;
sh_thread = 4.5; // 2.7 for tapping, 4.5 for brass insert

shell_thickness = 2;
shell_thread_hole_thickness = 10;
shell_thread_hole_diameter = 10;

mounting_holes_height = 30;
mounting_holes_width = 40;

optical_hole = 30;
flange_thickness = 3;

total_optical_length = 140; // 150 original
flange_gap = 20;
ifd = flange_gap + 40;
rol = total_optical_length - ifd;

grow_prop = sqrt(2);
shell_height = 50;

slop_adjust = 0.5;

module countersink_cyl() {
    hull () {
        translate([0,0,-30])cylinder(1, (sh_countersink-1) + (sh_through/2), (sh_countersink-1) + (sh_through/2));
        translate([0,0,0])cylinder(sh_countersink, (sh_countersink-1) + (sh_through/2), sh_through/2);
    }

    translate([0,0,0])cylinder(30, sh_through/2, sh_through/2);
}

module flange_holes() {
    translate([-mounting_holes_height/2,10,5])rotate([90,0,0])countersink_cyl();
    translate([mounting_holes_height/2,10,5])rotate([90,0,0])countersink_cyl();
    translate([-mounting_holes_height/2,10,45])rotate([90,0,0])countersink_cyl();
    translate([mounting_holes_height/2,10,45])rotate([90,0,0])countersink_cyl();

    translate([0,5,-1])cylinder(11, sh_thread/2, sh_thread/2);
    translate([0,5,50-10])cylinder(11, sh_thread/2, sh_thread/2);

    translate([0,-1,50/2])rotate([-90,0,0])cylinder(10+2, optical_hole/2, optical_hole/2);
}


module flange() {
    //translate([mounting_holes_height/2,0,5])hull() {
    //    rotate([-90,0,0])cylinder(shell_thread_hole_thickness, shell_thread_hole_diameter/2, shell_thread_hole_diameter/2);
    //    translate([-shell_thread_hole_diameter/2,0,-5])cube([shell_thread_hole_diameter, shell_thread_hole_thickness,1]);
    //}
    //translate([-mounting_holes_height/2,0,5])hull() {
    //    rotate([-90,0,0])cylinder(shell_thread_hole_thickness, shell_thread_hole_diameter/2, shell_thread_hole_diameter/2);
    //    translate([-shell_thread_hole_diameter/2,0,-5])cube([shell_thread_hole_diameter, shell_thread_hole_thickness,1]);
    //}
    translate([-20, 0, (50-shell_height)/2])cube([40,10,shell_height]);


    translate([0,0,50/2])rotate([-90,0,0])cylinder(10, optical_hole/2 + 1.5, optical_hole/2 + 1.5);


}



conn_box_width = 10;

translate([-ifd/2,0,0])rotate([90,0,0])difference(){
    union() {
        translate([0,0,-50/2])flange();
        translate([ifd,0,-50/2])flange();

        translate([0,0,0])union() {
            translate([(ifd - flange_gap)/2,0,(50/2)-conn_box_width])cube([flange_gap,shell_thickness,conn_box_width]);
            translate([(ifd - flange_gap)/2,0,(50/2)-conn_box_width])cube([flange_gap,10,shell_thickness]);
            translate([(ifd - flange_gap)/2,0,(50/2)-shell_thickness])cube([flange_gap,10,shell_thickness]);
        }
        
        translate([0,0,conn_box_width-50])union() {
            translate([(ifd - flange_gap)/2,0,(50/2)-conn_box_width])cube([flange_gap,shell_thickness,conn_box_width]);
            translate([(ifd - flange_gap)/2,0,(50/2)-conn_box_width])cube([flange_gap,10,shell_thickness]);
            translate([(ifd - flange_gap)/2,0,(50/2)-shell_thickness])cube([flange_gap,10,shell_thickness]);
        }

    }

    translate([0,0,-50/2])flange_holes();
    translate([ifd,0,-50/2])flange_holes();

    translate([0,15,-65/2])rotate([0,0,0])countersink_cyl();
    translate([ifd,15,-65/2])rotate([0,0,0])countersink_cyl();

    translate([0,15,65/2])rotate([180,0,0])countersink_cyl();
    translate([ifd,15,65/2])rotate([180,0,0])countersink_cyl();
}