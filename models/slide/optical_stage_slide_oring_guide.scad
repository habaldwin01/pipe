$fn=64;

sh_through = 4;
sh_countersink = 3;
sh_thread = 2.7;


mounting_holes_height = 70;
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

glass_shoulder_thickness = 0.5; 

difference() {
    union() {
        hull() {
            translate([-mounting_holes_height/2,-mounting_holes_width/2,0])cylinder(plate_thickness,5,5);
            translate([-mounting_holes_height/2,mounting_holes_width/2,0])cylinder(plate_thickness,5,5);
            translate([mounting_holes_height/2,-mounting_holes_width/2,0])cylinder(plate_thickness,5,5);
            translate([mounting_holes_height/2,mounting_holes_width/2,0])cylinder(plate_thickness,5,5);
        }

        translate([-slide_width/2-1, -slide_height/2-1, 0])cube([6,6, plate_thickness+glass_shoulder_thickness]);
        translate([-slide_width/2-1, slide_height/2-5, 0])cube([6,6, plate_thickness+glass_shoulder_thickness]);
        translate([slide_width/2-5, -slide_height/2-1, 0])cube([6,6, plate_thickness+glass_shoulder_thickness]);
        translate([slide_width/2-5, slide_height/2-5, 0])cube([6,6, plate_thickness+glass_shoulder_thickness]);
    }
        
       
    
    hull() {
        translate([fluidics_gap/2,0,0])cylinder(plate_thickness, 14/2, 14/2);
        translate([-fluidics_gap/2,0,0])cylinder(plate_thickness, 14/2, 14/2);

        translate([fluidics_gap/2,0,plate_thickness/3])cylinder(plate_thickness/3, 14/2 + 0.25, 14/2 + 0.25);
        translate([-fluidics_gap/2,0,plate_thickness/3])cylinder(plate_thickness/3, 14/2 + 0.25, 14/2 + 0.25);
    }
    
    
    translate([-slide_width/2, -slide_height/2, plate_thickness])cube([slide_width, slide_height, 20]);

    translate([0,-mounting_holes_width / 2,-1])cylinder(30, sh_through/2, sh_through/2);
    translate([0,mounting_holes_width / 2,-1])cylinder(30, sh_through/2, sh_through/2);
    translate([-fluidics_gap/2,mounting_holes_width / 2,-1])cylinder(30, sh_through/2, sh_through/2);
    translate([-fluidics_gap/2,-mounting_holes_width / 2,-1])cylinder(30, sh_through/2, sh_through/2);
    translate([fluidics_gap/2,mounting_holes_width / 2,-1])cylinder(30, sh_through/2, sh_through/2);
    translate([fluidics_gap/2,-mounting_holes_width / 2,-1])cylinder(30, sh_through/2, sh_through/2);

    
    

}