$fn=64;

sh_through = 4;
sh_countersink = 3;
sh_thread = 2.7;


mounting_holes_height = 68;
mounting_holes_width = 35;

slide_height = 26.5;
slide_width = 77;

fluidics_gap = 50;

washer_thickness = 0.8;
washer_od = 14; // Note washer inner dia must be > 8 & < 10 
// M8x14mmx1mm shim washer reccomended if not printing

oring_od = 16.5;

luer_shoulder_height = 2.5;
luer_o_ring_thickness = 0.8;

luer_shoulder_thickness = luer_shoulder_height + luer_o_ring_thickness;

plate_thickness = 2;

glass_shoulder_thickness = 1; 

difference() {
    union() {
        hull() {
            translate([-mounting_holes_height/2,-mounting_holes_width/2,0])cylinder(plate_thickness,5,5);
            translate([-mounting_holes_height/2,mounting_holes_width/2,0])cylinder(plate_thickness,5,5);
            translate([mounting_holes_height/2,-mounting_holes_width/2,0])cylinder(plate_thickness,5,5);
            translate([mounting_holes_height/2,mounting_holes_width/2,0])cylinder(plate_thickness,5,5);
        }
        
        hull() {
            translate([-slide_width/2-0.5, -slide_height/2-1, 0])cube([6,6, plate_thickness+glass_shoulder_thickness]);
            translate([-slide_width/2-0.5, slide_height/2-5, 0])cube([6,6, plate_thickness+glass_shoulder_thickness]);
            translate([slide_width/2-5.5, -slide_height/2-1, 0])cube([6,6, plate_thickness+glass_shoulder_thickness]);
            translate([slide_width/2-5.5, slide_height/2-5, 0])cube([6,6, plate_thickness+glass_shoulder_thickness]);
        }
    }
        
       
    
    
    
    translate([-slide_width/2, -slide_height/2, -1])cube([slide_width, slide_height, 20+plate_thickness]);

    translate([0,-mounting_holes_width / 2,-1])cylinder(30, sh_through/2, sh_through/2);
    translate([0,mounting_holes_width / 2,-1])cylinder(30, sh_through/2, sh_through/2);
    translate([-fluidics_gap/2,mounting_holes_width / 2,-1])cylinder(30, sh_through/2, sh_through/2);
    translate([-fluidics_gap/2,-mounting_holes_width / 2,-1])cylinder(30, sh_through/2, sh_through/2);
    translate([fluidics_gap/2,mounting_holes_width / 2,-1])cylinder(30, sh_through/2, sh_through/2);
    translate([fluidics_gap/2,-mounting_holes_width / 2,-1])cylinder(30, sh_through/2, sh_through/2);

    
    

}