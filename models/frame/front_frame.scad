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


pcb_offset = -60;

//circle_truncation_width = sqrt((((tube_diameter/2) - shell_thickness - (slop_adjust))^2) - ((130/2)^2)) * 2;

mirror_module_offset = 0;

on_tube_dia = (tube_diameter / 2) - (slop_adjust * 2) - (shell_thickness/2);

support_angle = 25.75;

module foot_mount(){
    hull() {
        rotate([0,0,0])translate([-10/2,(tube_diameter/2)-5-shell_thickness-slop_adjust,0])cube([10,5,10]);
        rotate([0,0,0-3])translate([-10/2,(tube_diameter/2)-0.1-shell_thickness-slop_adjust,0])cube([10,0.1,10]);
        rotate([0,0,0+3])translate([-10/2,(tube_diameter/2)-0.1-shell_thickness-slop_adjust,0])cube([10,0.1,10]);
    }
}

module foot_holes() {
    rotate([0,0,0])translate([0,(tube_diameter/2)-slop_adjust+1,5])rotate([90,0,0])cylinder(10,sh_thread/2,sh_thread/2);
    rotate([0,0,0])translate([0,(tube_diameter/2)-slop_adjust+1,15])rotate([90,0,0])cylinder(10,sh_thread/2,sh_thread/2);
}

module extra_stage_mount(){
    hull() {
        translate([0,(tube_diameter/2)-10,0])cylinder(10,10/2,10/2);
        rotate([0,0,-4])translate([-10/2,(tube_diameter/2)-0.1-shell_thickness-slop_adjust,0])cube([10,0.1,10]);
        rotate([0,0,+4])translate([-10/2,(tube_diameter/2)-0.1-shell_thickness-slop_adjust,0])cube([10,0.1,10]);
    }
}

//bar_width = sqrt((((tube_diameter/2) - shell_thickness - (slop_adjust))^2) - ((50/2)^2)) * 2;

difference(){
    union() {
        difference() {
            cylinder(10,(tube_diameter/2-slop_adjust),(tube_diameter/2-slop_adjust));
            translate([0,0,-1])cylinder(22,(tube_diameter/2-slop_adjust)-shell_thickness,(tube_diameter/2-slop_adjust)-shell_thickness);
        }
        
        
        intersection(){
            union(){
                // horizontal bars
                translate([-tube_diameter/2,50/2 + slop_adjust,0])cube([tube_diameter,shell_thickness,10]);
                translate([-tube_diameter/2,-50/2 - slop_adjust - shell_thickness,0])cube([tube_diameter,shell_thickness,10]);
                
                translate([-tube_diameter/2,50/2 + slop_adjust,0])cube([tube_diameter,10,shell_thickness]);
                translate([-tube_diameter/2,-50/2 - slop_adjust - 10,0])cube([tube_diameter,10,shell_thickness]);
            }
            cylinder(10,(tube_diameter/2-slop_adjust),(tube_diameter/2-slop_adjust));
        }
        
        // mount points for condenser
        hull() {
            translate([(ifd/2) - (20/2),-50/2 - 1 - slop_adjust,0])cube([20,1,10]);
            translate([ifd/2,-40/2,0])cylinder(10,9/2,9/2);
        }
        hull() {
            translate([(ifd/2) - (20/2),50/2 + slop_adjust,0])cube([20,1,10]);
            translate([ifd/2,40/2,0])cylinder(10,9/2,9/2);
        }
        
        // mount points for main PCB
        hull() {
            translate([(pcb_offset/2) - (20/2),-50/2 - 1 - slop_adjust,0])cube([20,1,4]);
            translate([pcb_offset/2,-40/2,0])cylinder(4,9/2,9/2);
        }
        translate([pcb_offset/2,-40/2,0])cylinder(6,7/2,7/2);
        hull() {
            translate([(pcb_offset/2) - (20/2),50/2 + slop_adjust,0])cube([20,1,4]);
            translate([pcb_offset/2,40/2,0])cylinder(4,9/2,9/2);
        }
        translate([pcb_offset/2,40/2,0])cylinder(6,7/2,7/2);
        

        // mount points for top carrier
        hull() {
            rotate([0,0,90+15])translate([on_tube_dia,0,0])cylinder(10,shell_thickness/2,shell_thickness/2);
            rotate([0,0,90+25])translate([on_tube_dia,0,0])cylinder(10,shell_thickness/2,shell_thickness/2);
            translate([-40/2,60,0])cylinder(10,10/2,10/2);
        }
        hull() {
            rotate([0,0,90-15])translate([on_tube_dia,0,0])cylinder(10,shell_thickness/2,shell_thickness/2);
            rotate([0,0,90-25])translate([on_tube_dia,0,0])cylinder(10,shell_thickness/2,shell_thickness/2);
            translate([40/2,60,0])cylinder(10,10/2,10/2);
        }
        
        // mount points for bottom structural rail
        hull() {
            rotate([0,0,-90-15])translate([on_tube_dia,0,0])cylinder(10,shell_thickness/2,shell_thickness/2);
            rotate([0,0,-90-25])translate([on_tube_dia,0,0])cylinder(10,shell_thickness/2,shell_thickness/2);
            translate([-40/2,-60,0])cylinder(10,10/2,10/2);
        }
        hull() {
            rotate([0,0,-90+15])translate([on_tube_dia,0,0])cylinder(10,shell_thickness/2,shell_thickness/2);
            rotate([0,0,-90+25])translate([on_tube_dia,0,0])cylinder(10,shell_thickness/2,shell_thickness/2);
            translate([40/2,-60,0])cylinder(10,10/2,10/2);
        }

        rotate([0,0,180-45])foot_mount();
        rotate([0,0,180+45])foot_mount();
        
        rotate([0,0,180])extra_stage_mount();
        rotate([0,0,-60])extra_stage_mount();
        rotate([0,0,60])extra_stage_mount();
    }
    
    // hole for access to RPI ports
    //hull(){
    //    translate([-50/2,40+10/2,-1])cylinder(100,5,5);
    //    translate([50/2,40+10/2,-1])cylinder(100,5,5);
    //    translate([-50/2,40-10/2,-1])cylinder(100,5,5);
    //    translate([50/2,40-10/2,-1])cylinder(100,5,5);
    //}

    // holes for condenser mount
    translate([mirror_module_offset,0,0]) union() {
        translate([ifd/2,-40/2,-1])cylinder(60,sh_through/2,sh_through/2);
        translate([ifd/2,-40/2,8])cylinder(sh_countersink, sh_through/2, sh_countersink + (sh_through/2));
        translate([ifd/2,40/2,-1])cylinder(60,sh_through/2,sh_through/2);
        translate([ifd/2,40/2,8])cylinder(sh_countersink, sh_through/2, sh_countersink + (sh_through/2));
    }
    
    // holes for PCB mount
    translate([pcb_offset,0,0]) union() {
        translate([ifd/2,-40/2,-1])cylinder(60,sh_thread/2,sh_thread/2);
        translate([ifd/2,40/2,-1])cylinder(60,sh_thread/2,sh_thread/2);
    }

    // holes for top rail mount
    translate([-40/2,60,-1])cylinder(60,sh_through/2,sh_through/2);
    translate([-40/2,60,8])cylinder(sh_countersink, sh_through/2, sh_countersink + (sh_through/2));
    translate([40/2,60,-1])cylinder(60,sh_through/2,sh_through/2);
    translate([40/2,60,8])cylinder(sh_countersink, sh_through/2, sh_countersink + (sh_through/2));
    
    // holes for bottom rail mount
    translate([-40/2,-60,-1])cylinder(60,sh_through/2,sh_through/2);
    translate([-40/2,-60,8])cylinder(sh_countersink, sh_through/2, sh_countersink + (sh_through/2));
    translate([40/2,-60,-1])cylinder(60,sh_through/2,sh_through/2);
    translate([40/2,-60,8])cylinder(sh_countersink, sh_through/2, sh_countersink + (sh_through/2));


    rotate([0,0,180-45])foot_holes();
    rotate([0,0,180+45])foot_holes();
    
    rotate([0,0,180])translate([0,(tube_diameter/2)-10,-1])cylinder(60,sh_thread/2,sh_thread/2);
    rotate([0,0,60])translate([0,(tube_diameter/2)-10,-1])cylinder(60,sh_thread/2,sh_thread/2);
    rotate([0,0,-60])translate([0,(tube_diameter/2)-10,-1])cylinder(60,sh_thread/2,sh_thread/2);
}

