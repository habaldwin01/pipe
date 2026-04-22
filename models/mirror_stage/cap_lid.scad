//use <threadlib/threadlib.scad>
$fn=64;

sh_through = 4;
sh_countersink = 3;
sh_thread = 2.7;

threads = 3;
support_bars = 3;

total_dia = 25;

bar_width = 2;

module pin_part() {
    hull() {
        rotate([0,0,0])translate([0,24/2,2])rotate([90,0,0])cylinder(0.5,4/2,4/2);
        rotate([0,0,0])translate([0,27/2,2])rotate([90,0,0])cylinder(0.5,1/2,1/2);
    }
}

translate([0,0,0])difference() {
    union() {

        //translate([0,0,0.35])nut("M8", turns=8, Douter=32, nut_sides=64);
        //translate([0,0,0])bolt("G1", turns=8);
        cylinder(4,total_dia/2, total_dia/2);
        cylinder(10,10/2, 10/2);

        for (i=[0:360/threads:359]) {
            rotate([0,0,i])pin_part();
        }

        for (i=[0:360/support_bars:359]) {
            rotate([0,0,i]){
                hull() {
                    translate([0,0,4])cylinder(4,bar_width/2, bar_width/2);
                    translate([0,(total_dia/2) - (bar_width/2),4])cylinder(4,bar_width/2, bar_width/2);
                }
            }
        }
    }

    translate([0,0,-1])cylinder(15, sh_through/2, sh_through/2);
    translate([0,0,-1])cylinder(sh_countersink, sh_countersink + (sh_through/2), sh_through/2);
}