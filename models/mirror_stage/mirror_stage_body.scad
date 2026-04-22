$fn=64;

sh_through = 4;
sh_countersink = 3;
sh_thread = 4.5; // 2.7 for tapping, 4.5 for brass insert
sh_thread_depth = 6;

shell_thickness = 2;
shell_thread_hole_thickness = 10;
shell_thread_hole_diameter = 8;

mounting_holes_height = 30;
mounting_holes_width = 40;

optical_hole = 30;
mirror_hole = 40;
flange_thickness = 3;

total_optical_length = 130; // 150 original
flange_gap = 20;
ifd = flange_gap + 40;
rol = total_optical_length - ifd;

grow_prop = sqrt(2);
shell_height = 50/2 - 0.5;

module flange_holes() {
    //translate([-mounting_holes_height/2,-1,5])rotate([-90,0,0])cylinder(shell_thread_hole_thickness + 2, sh_thread/2, sh_thread/2);
    //translate([mounting_holes_height/2,-1,5])rotate([-90,0,0])cylinder(shell_thread_hole_thickness + 2, sh_thread/2, sh_thread/2);
    translate([0,-1,50/2])rotate([-90,0,0])cylinder(shell_thickness+2, optical_hole/2, optical_hole/2);


    translate([0,5,-1])cylinder(shell_thread_hole_thickness + 2, sh_thread/2, sh_thread/2);
}

module mirror_flange_holes() {
    translate([-mounting_holes_width/2,-1,5])rotate([-90,0,0])cylinder(shell_thread_hole_thickness + 2, sh_thread/2, sh_thread/2);
    translate([mounting_holes_width/2,-1,5])rotate([-90,0,0])cylinder(shell_thread_hole_thickness + 2, sh_thread/2, sh_thread/2);
    //translate([0,-1,50/2])rotate([-90,0,0])cylinder(shell_thickness+2, optical_hole/2, optical_hole/2);

    //hull() {
    //    translate([0,-1,50/2])rotate([-90,0,45])cylinder((optical_hole/2)*grow_prop, optical_hole/2, optical_hole/2);
    //    translate([0,-1,50/2])rotate([-90,0,-45])cylinder((optical_hole/2)*grow_prop, optical_hole/2, optical_hole/2);
    //}
    translate([0,-1,50/2])rotate([-90,0,0])cylinder((optical_hole/2)*grow_prop, mirror_hole/2, mirror_hole/2);
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
    translate([-20, 0, 0])cube([40,shell_thickness,shell_height]);

    hull() {
        translate([0,5,0])cylinder(shell_thread_hole_thickness, shell_thread_hole_diameter/2, shell_thread_hole_diameter/2);
        translate([-shell_thread_hole_diameter/2,0,0])cube([shell_thread_hole_diameter, 1,shell_thread_hole_thickness]);
    }
}

module mirror_flange() {
    translate([mounting_holes_width/2,0,5])hull() {
        rotate([90,0,0])cylinder(shell_thread_hole_thickness, shell_thread_hole_diameter/2, shell_thread_hole_diameter/2);
        translate([-shell_thread_hole_diameter/2,-shell_thread_hole_thickness,-5])cube([shell_thread_hole_diameter, shell_thread_hole_thickness,1]);
    }
    translate([-mounting_holes_width/2,0,5])hull() {
        rotate([90,0,0])cylinder(shell_thread_hole_thickness, shell_thread_hole_diameter/2, shell_thread_hole_diameter/2);
        translate([-shell_thread_hole_diameter/2,-shell_thread_hole_thickness,-5])cube([shell_thread_hole_diameter, shell_thread_hole_thickness,1]);
    }
    translate([-20 * grow_prop, -shell_thickness, 0])cube([40 * grow_prop,shell_thickness,shell_height]);
    


}

module countersink_cyl() {
    cylinder(mounting_holes_height + 10, sh_through/2, sh_through/2);
    hull () {
        translate([0,0,-5])cylinder(1, (sh_countersink-1) + (sh_through/2), (sh_countersink-1) + (sh_through/2));
        translate([0,0,mounting_holes_height/2 + 1])cylinder(sh_countersink, (sh_countersink-1) + (sh_through/2), sh_through/2);
    }
}

module thread_cyl() {
    cylinder(mounting_holes_height + 10, sh_thread/2, sh_thread/2);
    hull () {
        translate([0,0,-5])cylinder(1, (sh_countersink-1) + (sh_through/2), (sh_countersink-1) + (sh_through/2));
        translate([0,0,mounting_holes_height/2 - sh_countersink])cylinder(sh_countersink+2, (sh_countersink-1) + (sh_through/2), sh_thread/2);
    }
}



difference(){
    union() {
        translate([0,0,0])flange();
        translate([ifd,0,0])flange();
        translate([0,rol/2,0])rotate([0,0,45])mirror_flange();
        translate([0 + ifd,rol/2,0])rotate([0,0,-45])mirror_flange();

        translate([0,0,0])translate([-20, 0, 0])cube([shell_thickness,rol/2-20,shell_height]);
        translate([ifd,0,0])translate([20-shell_thickness, 0, 0])cube([shell_thickness,rol/2-20,shell_height]);
        translate([ifd/2,0,0])translate([-flange_gap/2, 0, 0])cube([flange_gap,shell_thickness,shell_height]);
        translate([ifd/2,(rol/2)+20-shell_thickness,0])translate([-flange_gap/2, 0, 0])cube([flange_gap,shell_thickness,shell_height]);

        hull() {
            translate([0,0,0])translate([-20, 0, 0])cube([shell_thickness,rol/2-20,shell_thickness]);
            translate([ifd,0,0])translate([20-shell_thickness, 0, 0])cube([shell_thickness,rol/2-20,shell_thickness]);
            translate([ifd/2,0,0])translate([-flange_gap/2, 0, 0])cube([flange_gap,shell_thickness,shell_thickness]);
            translate([ifd/2,(rol/2)+20-shell_thickness,0])translate([-flange_gap/2, 0, 0])cube([flange_gap,shell_thickness,shell_thickness]);
        }

        hull() {
            translate([ifd/2 + 5,5,0])cylinder(shell_height, 10/2, 10/2);
            translate([ifd/2 - 5,5,0])cylinder(shell_height, 10/2, 10/2);
            translate([ifd/2,0,0])translate([-flange_gap/2, 0, 0])cube([flange_gap,shell_thickness,shell_height]);
        }

        hull() {
            translate([ifd/2 + 5,(rol/2)+15,0])cylinder(shell_height, 10/2, 10/2);
            translate([ifd/2 - 5,(rol/2)+15,0])cylinder(shell_height, 10/2, 10/2);
            translate([ifd/2,(rol/2)+20-shell_thickness,0])translate([-flange_gap/2, 0, 0])cube([flange_gap,shell_thickness,shell_height]);
        }
        

//shell_thread_hole_thickness
    }

    translate([0,0,0])flange_holes();
    translate([ifd,0,0])flange_holes();
    translate([0,rol/2,0])rotate([0,0,45])rotate([0,0,180])mirror_flange_holes();
    translate([ifd,rol/2,0])rotate([0,0,-45])rotate([0,0,180])mirror_flange_holes();

    
    translate([ifd/2 + 5,5,0])countersink_cyl();
    translate([ifd/2 - 5,5,0])thread_cyl();

    translate([ifd/2 + 5,(rol/2)+15,0])thread_cyl();
    translate([ifd/2 - 5,(rol/2)+15,0])countersink_cyl();

    //translate([0,0,0])rotate([-90,0,0])flange_holes(optical_hole, 0, 0);
    //translate([ifd,0,0])rotate([-90,0,0])flange_holes(optical_hole, 0, 0);
    //translate([0,rol/2,0])rotate([90,0,45])flange_holes(optical_hole, 90, flange_grow);
    //translate([ifd,rol/2,0])rotate([90,0,-45])flange_holes(optical_hole, 90, flange_grow);
}