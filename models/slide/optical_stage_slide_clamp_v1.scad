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

plate_thickness = 8;
plate_thrust_thickness = 1; // adds shoulder to center washer
washer_thrust_thickness = 1; // presses washers more into plate

translate([0,0,plate_thickness])rotate([0,180,0])difference() {
    union() {
        hull() {
            translate([-mounting_holes_height/2,-mounting_holes_width/2,0])cylinder(plate_thickness,5,5);
            translate([-mounting_holes_height/2,mounting_holes_width/2,0])cylinder(plate_thickness,5,5);
            translate([mounting_holes_height/2,-mounting_holes_width/2,0])cylinder(plate_thickness,5,5);
            translate([mounting_holes_height/2,mounting_holes_width/2,0])cylinder(plate_thickness,5,5);
        }
        
        
        //translate([fluidics_gap/2,0,-plate_thrust_thickness])cylinder(plate_thrust_thickness+1, (washer_od + 2)/2, (washer_od + 2)/2);
        //translate([-fluidics_gap/2,0,-plate_thrust_thickness])cylinder(plate_thrust_thickness+1, (washer_od + 2)/2, (washer_od + 2)/2);
        translate([0,0,-plate_thrust_thickness])cylinder(plate_thrust_thickness+1, (oring_od + 4)/2, (oring_od + 4)/2);
    }
    
    // fluidics holes
    translate([fluidics_gap/2,0,-1])cylinder(20, 12/2, 12/2);
    translate([-fluidics_gap/2,0,-1])cylinder(20, 12/2, 12/2);
    
    // optical path hole
    translate([0,0,-1])cylinder(20, 12/2, 12/2);
    //translate([0,0,plate_thickness-2])cylinder(3, 10/2, 13/2);
    
    // washer insets
    translate([fluidics_gap/2,0,-5])cylinder(5 + washer_thickness + luer_shoulder_thickness - washer_thrust_thickness,(washer_od + 0.75)/2,(washer_od + 0.75)/2);
    translate([-fluidics_gap/2,0,-5])cylinder(5 + washer_thickness + luer_shoulder_thickness - washer_thrust_thickness,(washer_od + 0.75)/2,(washer_od + 0.75)/2);
    translate([0,0,-5])cylinder(5 + washer_thickness - washer_thrust_thickness,oring_od/2,oring_od/2);
    
    
  
    // extra edge holes
    //translate([-80/2 + 5,mounting_holes_width / 2,-1])cylinder(30, sh_through/2, sh_through/2);
    //translate([-80/2 + 5,-mounting_holes_width / 2,-1])cylinder(30, sh_through/2, sh_through/2);
    //translate([80/2 - 5,mounting_holes_width / 2,-1])cylinder(30, sh_through/2, sh_through/2);
    //translate([80/2 - 5,-mounting_holes_width / 2,-1])cylinder(30, sh_through/2, sh_through/2);
    //translate([-80/2 + 5,mounting_holes_width / 2,5+1-sh_countersink])cylinder(sh_countersink, sh_through/2, sh_countersink + (sh_through/2));
    //translate([-80/2 + 5,-mounting_holes_width / 2,5+1-sh_countersink])cylinder(sh_countersink, sh_through/2, sh_countersink + (sh_through/2));
    //translate([80/2 - 5,mounting_holes_width / 2,5+1-sh_countersink])cylinder(sh_countersink, sh_through/2, sh_countersink + (sh_through/2));
    //translate([80/2 - 5,-mounting_holes_width / 2,5+1-sh_countersink])cylinder(sh_countersink, sh_through/2, sh_countersink + (sh_through/2));
    
    // central pressure mount
    translate([0,-mounting_holes_width / 2,-1])cylinder(30, sh_through/2, sh_through/2);
    translate([0,mounting_holes_width / 2,-1])cylinder(30, sh_through/2, sh_through/2);
    translate([0,mounting_holes_width / 2,plate_thickness+1-sh_countersink])cylinder(sh_countersink, sh_through/2, sh_countersink + (sh_through/2));
    translate([0,-mounting_holes_width / 2,plate_thickness+1-sh_countersink])cylinder(sh_countersink, sh_through/2, sh_countersink + (sh_through/2));
    
    
    
    // through holes for luer mounts
    translate([-fluidics_gap/2,mounting_holes_width / 2,-1])cylinder(30, sh_through/2, sh_through/2);
    translate([-fluidics_gap/2,-mounting_holes_width / 2,-1])cylinder(30, sh_through/2, sh_through/2);
    translate([fluidics_gap/2,mounting_holes_width / 2,-1])cylinder(30, sh_through/2, sh_through/2);
    translate([fluidics_gap/2,-mounting_holes_width / 2,-1])cylinder(30, sh_through/2, sh_through/2);
    
    translate([-fluidics_gap/2,mounting_holes_width / 2,plate_thickness+1-sh_countersink])cylinder(sh_countersink, sh_through/2, sh_countersink + (sh_through/2));
    translate([-fluidics_gap/2,-mounting_holes_width / 2,plate_thickness+1-sh_countersink])cylinder(sh_countersink, sh_through/2, sh_countersink + (sh_through/2));
    translate([fluidics_gap/2,mounting_holes_width / 2,plate_thickness+1-sh_countersink])cylinder(sh_countersink, sh_through/2, sh_countersink + (sh_through/2));
    translate([fluidics_gap/2,-mounting_holes_width / 2,plate_thickness+1-sh_countersink])cylinder(sh_countersink, sh_through/2, sh_countersink + (sh_through/2));
    
    

}