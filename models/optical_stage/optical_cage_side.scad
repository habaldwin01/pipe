
$fn=64;

cam_offset = 15;

// 6 and 4.5 for M5
// 5 and 3.6 for M4
// 4 and 2.7 for M3
sh_through = 4;
sh_countersink = 3;
sh_thread = 2.7;

cage_length = 110;
cage_thickness = 5;
cg_margin = 10;

bar_height = 5;
bar_chamfer = 2.5;

slot_offset = 15;
slot_length = 30;

slot_spacing = 30;



translate([0,0,0])difference() {
    union() {
        // ears
        hull() {
            translate([0,30,0])cylinder(cage_thickness, 5, 5);
            translate([-60/2,0,0])cylinder(cage_thickness, 5, 5);
            translate([60/2,0,0])cylinder(cage_thickness, 5, 5);
        }
        
        translate([0,cage_length,0])hull() {
            translate([0,-30,0])cylinder(cage_thickness, 5, 5);
            translate([-60/2,0,0])cylinder(cage_thickness, 5, 5);
            translate([60/2,0,0])cylinder(cage_thickness, 5, 5);
        }
        
        // central bar

        hull() {
            translate([(slot_spacing/2)-(bar_height/2),0,0])cylinder(5, 5, 5);
            translate([(slot_spacing/2)-(bar_height/2),cage_length,0])cylinder(5, 5, 5);
            translate([(slot_spacing/2)+(bar_height/2),0,0])cylinder(5, 5, 5);
            translate([(slot_spacing/2)+(bar_height/2),cage_length,0])cylinder(5, 5, 5);
            translate([(slot_spacing/2)-(bar_height/2)+bar_chamfer,bar_chamfer,bar_chamfer])cylinder(5, 5, 5);
            translate([(slot_spacing/2)-(bar_height/2)+bar_chamfer,cage_length-bar_chamfer,bar_chamfer])cylinder(5, 5, 5);
            translate([(slot_spacing/2)+(bar_height/2)-bar_chamfer,bar_chamfer,bar_chamfer])cylinder(5, 5, 5);
            translate([(slot_spacing/2)+(bar_height/2)-bar_chamfer,cage_length-bar_chamfer,bar_chamfer])cylinder(5, 5, 5);
        }

        hull() {
            translate([-(slot_spacing/2)-(bar_height/2),0,0])cylinder(5, 5, 5);
            translate([-(slot_spacing/2)-(bar_height/2),cage_length,0])cylinder(5, 5, 5);
            translate([-(slot_spacing/2)+(bar_height/2),0,0])cylinder(5, 5, 5);
            translate([-(slot_spacing/2)+(bar_height/2),cage_length,0])cylinder(5, 5, 5);
            translate([-(slot_spacing/2)-(bar_height/2)+bar_chamfer,bar_chamfer,bar_chamfer])cylinder(5, 5, 5);
            translate([-(slot_spacing/2)-(bar_height/2)+bar_chamfer,cage_length-bar_chamfer,bar_chamfer])cylinder(5, 5, 5);
            translate([-(slot_spacing/2)+(bar_height/2)-bar_chamfer,bar_chamfer,bar_chamfer])cylinder(5, 5, 5);
            translate([-(slot_spacing/2)+(bar_height/2)-bar_chamfer,cage_length-bar_chamfer,bar_chamfer])cylinder(5, 5, 5);
        }
    }


    hull() {
        translate([-bar_height/2,0+cg_margin,-1])cylinder(15, 5, 5);
        translate([-bar_height/2,cage_length-cg_margin,-1])cylinder(15, 5, 5);
        translate([bar_height/2,0+cg_margin,-1])cylinder(15, 5, 5);
        translate([bar_height/2,cage_length-cg_margin,-1])cylinder(15, 5, 5);
    }

    hull() {
        translate([slot_spacing/2,(cage_length/2)-(slot_length/2)+ slot_offset,cage_thickness+bar_chamfer + 1 - sh_countersink])cylinder(sh_countersink, sh_through/2, sh_countersink + (sh_through/2));
        translate([slot_spacing/2,(cage_length/2)+(slot_length/2)+slot_offset,cage_thickness +bar_chamfer + 1 - sh_countersink])cylinder(sh_countersink, sh_through/2, sh_countersink + (sh_through/2));
    }
    hull() {
        translate([slot_spacing/2,(cage_length/2)-(slot_length/2)+slot_offset,-1])cylinder(15, sh_through/2, sh_through/2);
        translate([slot_spacing/2,(cage_length/2)+(slot_length/2)+slot_offset,-1])cylinder(15, sh_through/2, sh_through/2);
    }
    hull() {
        translate([-slot_spacing/2,(cage_length/2)-(slot_length/2)+slot_offset,cage_thickness+bar_chamfer + 1 - sh_countersink])cylinder(sh_countersink, sh_through/2, sh_countersink + (sh_through/2));
        translate([-slot_spacing/2,(cage_length/2)+(slot_length/2)+slot_offset,cage_thickness +bar_chamfer + 1 - sh_countersink])cylinder(sh_countersink, sh_through/2, sh_countersink + (sh_through/2));
    }
    hull() {
        translate([-slot_spacing/2,(cage_length/2)-(slot_length/2)+slot_offset,-1])cylinder(15, sh_through/2, sh_through/2);
        translate([-slot_spacing/2,(cage_length/2)+(slot_length/2)+slot_offset,-1])cylinder(15, sh_through/2, sh_through/2);
    }
    
    // mounting holes
    union() {
        translate([-60/2,0,-1])cylinder(15, sh_through/2, sh_through/2);
        translate([60/2,0,-1])cylinder(15, sh_through/2, sh_through/2);
    }
    translate([0,cage_length,0])union() {
        translate([-60/2,0,-1])cylinder(15, sh_through/2, sh_through/2);
        translate([60/2,0,-1])cylinder(15, sh_through/2, sh_through/2);
    }
    union() {
        translate([-60/2,0,cage_thickness + 1 - sh_countersink])cylinder(sh_countersink, sh_through/2, sh_countersink + (sh_through/2));
        translate([60/2,0,cage_thickness + 1 - sh_countersink])cylinder(sh_countersink, sh_through/2, sh_countersink + (sh_through/2));
    }
    translate([0,cage_length,0])union() {
        translate([-60/2,0,cage_thickness + 1 - sh_countersink])cylinder(sh_countersink, sh_through/2, sh_countersink + (sh_through/2));
        translate([60/2,0,cage_thickness + 1 - sh_countersink])cylinder(sh_countersink, sh_through/2, sh_countersink + (sh_through/2));
    }
}

//    translate([60/2,-15,-1])cylinder(15, sh_through/2, sh_through/2);
//    translate([-60/2,-40,-1])cylinder(sh_countersink, sh_countersink + (sh_through/2), sh_through/2);
//    translate([-65/2,0,-1])cylinder(15, sh_thread/2, sh_thread/2);
