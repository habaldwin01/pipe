$fn=64;

sh_through = 4;
sh_countersink = 3;
sh_thread = 4.75; // 2.7 for tapping, 4.75 for brass insert


mounting_holes_height = 30;
mounting_holes_width = 40;

led_board_height = 20; // mounting holes
led_board_width = 50;

translate([0,0,0])difference() {
    union() {
        //translate([-80/2,-25,0])cube([80,50,10]);
        hull() {
            translate([-60/2,-50/2,5])rotate([-90,0,0])cylinder(50, 5, 5);
            translate([60/2,-50/2,5])rotate([-90,0,0])cylinder(50, 5, 5);
        }
    }
    
    
    // objective board inset
    translate([0,0,6])hull() {
        
        translate([-led_board_width/2,-led_board_height/2,0])cylinder(15,6,6);
        translate([-led_board_width/2,led_board_height/2,0])cylinder(15,6,6);
        translate([led_board_width/2,-led_board_height/2,0])cylinder(15,6,6);
        translate([led_board_width/2,led_board_height/2,0])cylinder(15,6,6);
    }
    translate([+led_board_width/2,-led_board_height/2,-1])cylinder(30, sh_thread/2, sh_thread/2);
    translate([-led_board_width/2,-led_board_height/2,-1])cylinder(30, sh_thread/2, sh_thread/2);
    translate([+led_board_width/2,led_board_height/2,-1])cylinder(30, sh_thread/2, sh_thread/2);
    translate([-led_board_width/2,led_board_height/2,-1])cylinder(30, sh_thread/2, sh_thread/2);
    
    //cage side holes
    translate([30,30,5])rotate([90,0,0])cylinder(13, sh_thread/2, sh_thread/2);
    translate([-30,30,5])rotate([90,0,0])cylinder(13, sh_thread/2, sh_thread/2);
    translate([30,-30,5])rotate([-90,0,0])cylinder(13, sh_thread/2, sh_thread/2);
    translate([-30,-30,5])rotate([-90,0,0])cylinder(13, sh_thread/2, sh_thread/2);
    
    translate([0,0,-1])cylinder(20, 30/2, 30/2);
    
    translate([-mounting_holes_height/2,mounting_holes_width/2,-1])cylinder(15, sh_thread/2, sh_thread/2);
    translate([mounting_holes_height/2,mounting_holes_width/2,-1])cylinder(15, sh_thread/2, sh_thread/2);
    translate([-mounting_holes_height/2,-mounting_holes_width/2,-1])cylinder(15, sh_thread/2, sh_thread/2);
    translate([mounting_holes_height/2,-mounting_holes_width/2,-1])cylinder(15, sh_thread/2, sh_thread/2);
}