$fa=1;
$fs=0.5;

sh_through = 4;
sh_countersink = 3;
sh_thread = 4.5; // 2.7 for tapping, 4.5 for brass insert

shell_thickness = 2;

flange_gap = 60;

grow_prop = sqrt(2);
shell_height = 50;

slop_adjust = 0.5;

module countersink_cyl() {
    hull () {
        translate([0,0,-30])cylinder(1, (sh_countersink-1) + (sh_through/2), (sh_countersink-1) + (sh_through/2));
        translate([0,0,-1])cylinder(sh_countersink, (sh_countersink-1) + (sh_through/2), sh_through/2);
    }

    translate([0,0,0])cylinder(30, sh_through/2, sh_through/2);
}

module bolt_bump(){
    hull() {
        translate([-10/2,slop_adjust,0])cube([10,5-slop_adjust,20]);
        translate([-(20-slop_adjust-slop_adjust)/2,slop_adjust,0])cube([20-slop_adjust-slop_adjust,0.1,20]);
    }
}

module bolt_bump_alt(){
    hull() {
        translate([-10/2,slop_adjust,0])cube([10,5-slop_adjust,10]);
        translate([-(20-slop_adjust-slop_adjust)/2,slop_adjust,0])cube([20-slop_adjust-slop_adjust,0.1,10]);
    }
}

difference(){
    // inner box
    union(){
        corner_expand = (shell_thickness + slop_adjust) * 2;

        translate([-(100+corner_expand)/2,50/2 + slop_adjust,0])cube([100 + corner_expand,shell_thickness,20]);
        translate([-(100+corner_expand)/2,-50/2 - slop_adjust - shell_thickness,0])cube([100 + corner_expand,shell_thickness,20]);

        translate([-((100+corner_expand)/2),-50/2 - slop_adjust,0])cube([shell_thickness,50 + (slop_adjust * 2),20]);
        translate([+((100+corner_expand)/2) - shell_thickness,-50/2 - slop_adjust,0])cube([shell_thickness,50 + (slop_adjust * 2),20]);
        
        
        
        translate([-(130-(slop_adjust*2))/2,50/2 + slop_adjust,0])cube([(130-(slop_adjust*2)),shell_thickness,10]);
        translate([-(130-(slop_adjust*2))/2,-50/2 - slop_adjust - shell_thickness,0])cube([(130-(slop_adjust*2)),shell_thickness,10]);

        translate([-(130-(slop_adjust*2))/2,-50/2 - slop_adjust,0])cube([shell_thickness,50 + (slop_adjust * 2),10]);
        translate([(130-(slop_adjust*2))/2- shell_thickness,-50/2 - slop_adjust,0])cube([shell_thickness,50 + (slop_adjust * 2),10]);
        
        translate([-(130-(slop_adjust*2))/2,-50/2 - slop_adjust,0])cube([30/2-(slop_adjust*2),50 + (slop_adjust * 2),shell_thickness]);
        translate([(130+(slop_adjust*2))/2-(30/2),-50/2 - slop_adjust,0])cube([30/2-(slop_adjust*2),50 + (slop_adjust * 2),shell_thickness]);
        
        
        translate([-(130)/2,-15,0])rotate([0,0,-90])bolt_bump_alt();
        translate([-(130)/2,15,0])rotate([0,0,-90])bolt_bump_alt();
        translate([(130)/2,-15,0])rotate([0,0,90])bolt_bump_alt();
        translate([(130)/2,15,0])rotate([0,0,90])bolt_bump_alt();
        
        
        
        translate([flange_gap/2,25,0])bolt_bump();
        translate([-flange_gap/2,25,0])bolt_bump();
        translate([flange_gap/2,-25,0])rotate([0,0,180])bolt_bump();
        translate([-flange_gap/2,-25,0])rotate([0,0,180])bolt_bump();
    }
    
    
    translate([(130)/2,15,5])rotate([-90,0,90])cylinder(10, sh_thread/2, sh_thread/2);
        translate([(130)/2,-15,5])rotate([-90,0,90])cylinder(10, sh_thread/2, sh_thread/2);
        translate([(-130)/2,15,5])rotate([-90,0,-90])cylinder(10, sh_thread/2, sh_thread/2);
        translate([(-130)/2,-15,5])rotate([-90,0,-90])cylinder(10, sh_thread/2, sh_thread/2);

    translate([flange_gap/2,30,5])rotate([90,0,0])countersink_cyl();
    translate([-flange_gap/2,30,5])rotate([90,0,0])countersink_cyl();
    translate([flange_gap/2,-30,5])rotate([-90,0,0])countersink_cyl();
    translate([-flange_gap/2,-30,5])rotate([-90,0,0])countersink_cyl();
    translate([flange_gap/2,30,15])rotate([90,0,0])countersink_cyl();
    translate([-flange_gap/2,30,15])rotate([90,0,0])countersink_cyl();
    translate([flange_gap/2,-30,15])rotate([-90,0,0])countersink_cyl();
    translate([-flange_gap/2,-30,15])rotate([-90,0,0])countersink_cyl();
}