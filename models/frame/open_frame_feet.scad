$fa=1;
$fs=0.5;

sh_through = 4;
sh_countersink = 3;
sh_thread = 4.5; // 2.7 for tapping, 4.5 for brass insert

shell_thickness = 2;

flange_gap = 20;
ifd = flange_gap + 40;

grow_prop = sqrt(2);

slop_adjust = 0.5;

tube_diameter = 147;

bar_width = tube_diameter - 14;

mirror_module_offset = 0;

on_tube_dia = (tube_diameter / 2) - (slop_adjust * 2) - (shell_thickness/2);

support_angle = 25.75;



module foot_mount() {
    hull() {
        rotate([0,0,180])translate([-10/2,(tube_diameter/2)-shell_thickness+5,0])cube([10,5,10]);
        rotate([0,0,180-3])translate([-10/2,(tube_diameter/2)-shell_thickness,0])cube([10,0.1,10]);
        rotate([0,0,180+3])translate([-10/2,(tube_diameter/2)-shell_thickness,0])cube([10,0.1,10]);
    } 
}

module foot_mount_holes(){
    rotate([0,0,180])translate([0,(tube_diameter/2)+20,5])rotate([90,0,0])cylinder(40,sh_through/2,sh_through/2);
    rotate([0,0,180])translate([0,(tube_diameter/2)+6,5])rotate([-90,0,0])cylinder(sh_countersink, sh_through/2, sh_countersink + (sh_through/2)); 
}


difference(){
    union(){
        rotate([0,0,-45])foot_mount();
        rotate([0,0,45])foot_mount();
        difference() {
            translate([0,0,0])cylinder(10,(tube_diameter/2+slop_adjust+shell_thickness),(tube_diameter/2+slop_adjust+shell_thickness));
            translate([0,0,-1])cylinder(12,(tube_diameter/2+slop_adjust),(tube_diameter/2+slop_adjust));
            translate([-100,-55,-1])cube([200,200,12]);
        }
        
        hull(){
            rotate([0,0,180-45])translate([(-10/2)-(shell_thickness/2),(tube_diameter/2)-shell_thickness,0])cylinder(10,shell_thickness/2,shell_thickness/2);
            rotate([0,0,180-45])translate([(-10/2)-(shell_thickness/2),100.5,0])cylinder(10,shell_thickness/2,shell_thickness/2);
        }
        hull(){
            rotate([0,0,180+45])translate([(10/2)+(shell_thickness/2),(tube_diameter/2)-shell_thickness,0])cylinder(10,shell_thickness/2,shell_thickness/2);
            rotate([0,0,180+45])translate([(10/2)+(shell_thickness/2),100.5,0])cylinder(10,shell_thickness/2,shell_thickness/2);
        }
        hull(){
            rotate([0,0,180-45])translate([(-10/2)-(shell_thickness/2),100.5,0])cylinder(10,shell_thickness/2,shell_thickness/2);
            rotate([0,0,180+45])translate([(10/2)+(shell_thickness/2),100.5,0])cylinder(10,shell_thickness/2,shell_thickness/2);
        }
        
    }
    rotate([0,0,-45])foot_mount_holes();
    rotate([0,0,45])foot_mount_holes();
    translate([0,0,-1])cylinder(12,(tube_diameter/2+slop_adjust),(tube_diameter/2+slop_adjust));
    
}
