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

support_angle = 30;

circle_truncation_width = sqrt((((tube_diameter/2) - shell_thickness - (slop_adjust))^2) - ((130/2)^2)) * 2;

module extra_stage_mount(){
    hull() {
        translate([0,(tube_diameter/2)-10,0])cylinder(10,10/2,10/2);
        rotate([0,0,-4])translate([-10/2,(tube_diameter/2)-0.1-shell_thickness-slop_adjust,0])cube([10,0.1,10]);
        rotate([0,0,+4])translate([-10/2,(tube_diameter/2)-0.1-shell_thickness-slop_adjust,0])cube([10,0.1,10]);
    }
}

module bolt_bump(){
    hull() {
        translate([-10/2,0,0])cube([10,5,10]);
        translate([-(20)/2,0,0])cube([20,0.1,10]);
    }
}

module foot_mount(){
    hull() {
        rotate([0,0,180])translate([-10/2,(tube_diameter/2)-5-shell_thickness-slop_adjust,0])cube([10,5,10]);
        rotate([0,0,180-3])translate([-10/2,(tube_diameter/2)-0.1-shell_thickness-slop_adjust,0])cube([10,0.1,10]);
        rotate([0,0,180+3])translate([-10/2,(tube_diameter/2)-0.1-shell_thickness-slop_adjust,0])cube([10,0.1,10]);
    }
}

module foot_holes() {
    rotate([0,0,180])translate([0,(tube_diameter/2)-slop_adjust+1,5])rotate([90,0,0])cylinder(20,sh_thread/2,sh_thread/2);
}

module countersink_cyl() {
    hull () {
        translate([0,0,-30])cylinder(1, (sh_countersink-1) + (sh_through/2), (sh_countersink-1) + (sh_through/2));
        translate([0,0,-1])cylinder(sh_countersink, (sh_countersink-1) + (sh_through/2), sh_through/2);
    }

    translate([0,0,0])cylinder(30, sh_through/2, sh_through/2);
}

difference(){
    union() {
        difference() {
            cylinder(10,(tube_diameter/2-slop_adjust),(tube_diameter/2-slop_adjust));
            translate([0,0,-1])cylinder(12,(tube_diameter/2-slop_adjust)-shell_thickness,(tube_diameter/2-slop_adjust)-shell_thickness);
            translate([-200/2,-circle_truncation_width/2,-1])cube([200,circle_truncation_width,12]);
            translate([(130/2) + shell_thickness,-100,-1])cube([200,200,12]);
            translate([-(130/2) - shell_thickness - 200,-100,-1])cube([200,200,12]);
        }
        
        
        
        
        // supports for central box


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
        

        rotate([0,0,-45])foot_mount();
        rotate([0,0,45])foot_mount();
        
        rotate([0,0,180])extra_stage_mount();
        rotate([0,0,-50])extra_stage_mount();
        rotate([0,0,50])extra_stage_mount();
        
        //translate([-130/2,-50/2,0])cube([130,50,10]);
        
        translate([-130/2-shell_thickness,-circle_truncation_width/2,0])cube([shell_thickness,circle_truncation_width,10]);
        translate([(-130)/2,15,0])rotate([0,0,90])bolt_bump();
        translate([(-130)/2,-15,0])rotate([0,0,90])bolt_bump();
        translate([130/2,-circle_truncation_width/2,0])cube([shell_thickness,circle_truncation_width,10]);
        translate([(130)/2,15,0])rotate([0,0,-90])bolt_bump();
        translate([(130)/2,-15,0])rotate([0,0,-90])bolt_bump();
        
    }

    // Holes for mounting flange carrier
    translate([(138)/2,15,5])rotate([-90,0,90])countersink_cyl();
    translate([(138)/2,-15,5])rotate([-90,0,90])countersink_cyl();
    translate([(-138)/2,15,5])rotate([-90,0,-90])countersink_cyl();
    translate([(-138)/2,-15,5])rotate([-90,0,-90])countersink_cyl();

    translate([mirror_module_offset,0,0]) union() {
        translate([ifd/2,-50/2-5,5])rotate([-90,0,0])cylinder(60,sh_thread/2,sh_thread/2);
        translate([-ifd/2,-50/2-5,5])rotate([-90,0,0])cylinder(60,sh_thread/2,sh_thread/2);
        translate([ifd/2,-50/2-5,15])rotate([-90,0,0])cylinder(60,sh_thread/2,sh_thread/2);
        translate([-ifd/2,-50/2-5,15])rotate([-90,0,0])cylinder(60,sh_thread/2,sh_thread/2);
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

    rotate([0,0,-45])foot_holes();
    rotate([0,0,45])foot_holes();
    
    rotate([0,0,180])translate([0,(tube_diameter/2)-10,-1])cylinder(60,sh_thread/2,sh_thread/2);
    rotate([0,0,50])translate([0,(tube_diameter/2)-10,-1])cylinder(60,sh_thread/2,sh_thread/2);
    rotate([0,0,-50])translate([0,(tube_diameter/2)-10,-1])cylinder(60,sh_thread/2,sh_thread/2);
}

