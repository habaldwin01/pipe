$fn = 64;

frame_length = 120;

sh_through = 4;
sh_countersink = 3;
sh_thread = 4.5; // 2.7 for tapping, 4.5 for brass insert


difference() {
    union() {
        //hull() {
            translate([40/2,0,0])rotate([-90,0,0])cylinder(frame_length, 5, 5);
            translate([-40/2,0,0])rotate([-90,0,0])cylinder(frame_length, 5, 5);
        //}
        translate([(-40/2),0,-5])cube([40,frame_length,5]);
        translate([0,0,-5])hull() {
            translate([-70/2,frame_length/2,0])cylinder(5, 5, 5);
            translate([70/2,frame_length/2,0])cylinder(5, 5, 5);
        }
    }
    
    
    translate([(-30/2),15,-50])cube([30,frame_length-30,100]);
    translate([(-30/2),-5,0])cube([30,frame_length+10,100]);
    
    translate([-40/2,-5,0])rotate([-90,0,0])cylinder(15,sh_thread/2,sh_thread/2);
    translate([40/2,-5,0])rotate([-90,0,0])cylinder(15,sh_thread/2,sh_thread/2);
    translate([-40/2,frame_length-10,0])rotate([-90,0,0])cylinder(15,sh_thread/2,sh_thread/2);
    translate([40/2,frame_length-10,0])rotate([-90,0,0])cylinder(15,sh_thread/2,sh_thread/2);
    
    translate([70/2,frame_length/2,-6])cylinder(15,sh_thread/2,sh_thread/2);
    translate([-70/2,frame_length/2,-6])cylinder(15,sh_thread/2,sh_thread/2);
}