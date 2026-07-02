$fa=1;
$fs=0.5;

frame_length = 120;

sh_through = 4;
sh_countersink = 3;
sh_thread = 4.5; // 2.7 for tapping, 4.5 for brass insert

motor_dia = 32;

shell_thickness = 2;

motor_center_height = 40;

module countersink_cyl() {
    hull () {
        translate([0,0,-30])cylinder(1, (sh_countersink-1) + (sh_through/2), (sh_countersink-1) + (sh_through/2));
        translate([0,0,-1])cylinder(sh_countersink, (sh_countersink-1) + (sh_through/2), sh_through/2);
    }

    translate([0,0,0])cylinder(30, sh_through/2, sh_through/2);
}

difference() {
    union(){
        cylinder(10,motor_dia/2 + shell_thickness,motor_dia/2 + shell_thickness);
        translate([0,-10/2 + 10,0])cube([motor_center_height,10,10]);
        translate([0,-10/2 - 10,0])cube([motor_center_height,10,10]);
        translate([motor_center_height-shell_thickness,-30/2,0])cube([shell_thickness,30,10]);
        
        difference(){
            translate([-motor_dia/2-10,-2.5-5,0])cube([10,5,10]);
            translate([-motor_dia/2-5,-7,5])rotate([-90,0,0])countersink_cyl();
        }
        difference(){
            translate([-motor_dia/2-10,2.5,0])cube([10,5,10]);
            translate([-motor_dia/2-5,0,5])rotate([-90,0,0])cylinder(50,sh_thread/2,sh_thread/2);
        }
        
    }

    translate([0,0,-1])cylinder(12,motor_dia/2,motor_dia/2);
    
    translate([-50,-2.5,-1])cube([50,5,12]);
    
    translate([motor_center_height-20,-(20/2),5])rotate([0,90,0])cylinder(50,sh_thread/2,sh_thread/2);
    translate([motor_center_height-20,+(20/2),5])rotate([0,90,0])cylinder(50,sh_thread/2,sh_thread/2);
}