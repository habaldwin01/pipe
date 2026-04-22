$fn=64;

sh_through = 4;
sh_countersink = 3;
sh_thread = 4.5; // 2.7 for tapping, 4.5 for brass insert

shell_thickness = 3;

total_optical_length = 140; // 150 original
flange_gap = 20;
ifd = flange_gap + 40;
rol = total_optical_length - ifd;

grow_prop = sqrt(2);

slop_adjust = 0.5;

tube_diameter = 150;

bar_width = tube_diameter - 14;

mirror_module_offset = 10;


module foot_mount(){
    hull() {
        rotate([0,0,180])translate([-10/2,(tube_diameter/2)-5-shell_thickness-slop_adjust,0])cube([10,5,20]);
        rotate([0,0,180-3])translate([-10/2,(tube_diameter/2)-0.1-shell_thickness-slop_adjust,0])cube([10,0.1,20]);
        rotate([0,0,180+3])translate([-10/2,(tube_diameter/2)-0.1-shell_thickness-slop_adjust,0])cube([10,0.1,20]);
    }
}

module foot_holes() {
    rotate([0,0,180])translate([0,(tube_diameter/2)-slop_adjust+1,5])rotate([90,0,0])cylinder(20,sh_thread/2,sh_thread/2);
    rotate([0,0,180])translate([0,(tube_diameter/2)-slop_adjust+1,15])rotate([90,0,0])cylinder(20,sh_thread/2,sh_thread/2);
}

difference(){
    union() {
        difference() {
            cylinder(20,(tube_diameter/2-slop_adjust),(tube_diameter/2-slop_adjust));
            translate([0,0,-1])cylinder(22,(tube_diameter/2-slop_adjust)-shell_thickness,(tube_diameter/2-slop_adjust)-shell_thickness);
        }
        translate([-bar_width/2,50/2 + slop_adjust,0])cube([bar_width,shell_thickness,20]);
        translate([-bar_width/2,-50/2 - slop_adjust - shell_thickness,0])cube([bar_width,shell_thickness,20]);

        translate([mirror_module_offset -(110/2) - slop_adjust-shell_thickness,-50/2 - slop_adjust,0])cube([shell_thickness,50 + (slop_adjust * 2),20]);
        translate([mirror_module_offset +(110/2) + slop_adjust,-50/2 - slop_adjust,0])cube([shell_thickness,50 + (slop_adjust * 2),20]);

        rotate([0,0,-45])foot_mount();
        rotate([0,0,45])foot_mount();
        rotate([0,0,-45-90])foot_mount();
        rotate([0,0,45+90])foot_mount();
    }

    translate([mirror_module_offset,0,0]) union() {
        translate([ifd/2,-50/2-5,5])rotate([-90,0,0])cylinder(60,sh_thread/2,sh_thread/2);
        translate([-ifd/2,-50/2-5,5])rotate([-90,0,0])cylinder(60,sh_thread/2,sh_thread/2);
        translate([ifd/2,-50/2-5,15])rotate([-90,0,0])cylinder(60,sh_thread/2,sh_thread/2);
        translate([-ifd/2,-50/2-5,15])rotate([-90,0,0])cylinder(60,sh_thread/2,sh_thread/2);
    }


    
    // Not needed, but good for visualisation
    translate([mirror_module_offset -(110/2) - slop_adjust,-50/2 - slop_adjust,0])cube([110 + (slop_adjust * 2),50 + (slop_adjust * 2),20]);

    rotate([0,0,-45])foot_holes();
    rotate([0,0,45])foot_holes();
    rotate([0,0,-45-90])foot_holes();
    rotate([0,0,45+90])foot_holes();
}

