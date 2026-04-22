//use <threadlib/threadlib.scad>
$fn=64;

sh_through = 4;
sh_countersink = 3;
sh_thread = 2.7;

threads = 3;

module thread_rotation(total_angle, rise, step_angle = 5) {
    total_steps = (total_angle-step_angle) / step_angle;
    for (i=[0:total_steps]) {
        hull() {
            rotate([0,0,i*step_angle])translate([0,25.5/2,((i/(total_steps+1)) *rise)])rotate([90,0,0])cylinder(0.5,3/2,3/2);
            rotate([0,0,i*step_angle])translate([0,27.5/2,((i/(total_steps+1)) *rise)])rotate([90,0,0])cylinder(0.5,1/2,1/2);
            rotate([0,0,(i+1)*step_angle])translate([0,25.5/2,(((i + 1)/(total_steps+1)) *rise)])rotate([90,0,0])cylinder(0.5,3/2,3/2);
            rotate([0,0,(i+1)*step_angle])translate([0,27.5/2,(((i + 1)/(total_steps+1)) *rise)])rotate([90,0,0])cylinder(0.5,1/2,1/2);
        }
    }
}

module thread_part() {
    translate([0,0,4+2.5])thread_rotation(45, 0);
    translate([0,0,4+2.5])rotate([0,0,45])thread_rotation(45, 2);
    translate([0,0,6+2.5])rotate([0,0,90])thread_rotation(2, 4, 2);
}

translate([0,0,0])difference() {
    union() {

        //translate([0,0,0.35])nut("M8", turns=8, Douter=32, nut_sides=64);
        //translate([0,0,0])bolt("G1", turns=8);
        translate([0,0,0])cylinder(5+5,29/2,29/2);
    }
    
    translate([0,0,1])cylinder(50,26/2,26/2);
    translate([0,0,-1])cylinder(50,22/2,22/2);

    for (i=[0:360/threads:359]) {
        rotate([0,0,i])thread_part();
    }
}