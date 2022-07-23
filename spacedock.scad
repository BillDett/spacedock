include <BOSL2/std.scad>
$fa=1;
$fs=0.01;

// Radius of the main Saucer- this one measurement drives the entire scale
radius = 100;

module saucer(radius) {
    // All measurements are based on radius
    hole = 0.03 * radius;
    w = .06 * radius;
    rad1 = .41428 * radius;    // Top radius
    rad2 = 0.98571 * radius;    // Rim radius
    h1 = 0.27142 * radius;       // Saucer height
    h2 = 0.05857 * radius;       // Rim height  


    // Main saucer shape  
    translate([0,0,(h1+h2)/-2]) tube(h=h2, or1=radius, or2=rad2, wall=w);   // Bottom Rim
    translate([0,0,(h1-w)/2]) tube(l=w, or=rad1, ir=hole);  // Top Plate 
    translate([0,0,(h1/2)-w]) tube(l=2, or=rad1*1.25, ir=hole);     // Inner Plate

    // Saucer main shell
    diff()
    tube(h=h1, or1=rad2, or2=rad1, wall=w) {
        ov = 1.0;
        tag("remove") {
            attach([0,1,0], overlap=ov) bay_door_blank();
            attach([1,0,0], overlap=ov) bay_door_blank();
            attach([0,-1,0], overlap=ov) bay_door_blank();
            attach([-1,0,0], overlap=ov) bay_door_blank();            
        }
        tag("keep") {
            attach([0,1,0], overlap=ov*2.5) bay_door();
            attach([1,0,0], overlap=ov*2.5) bay_door();
            attach([0,-1,0], overlap=ov*2.5) bay_door();
            attach([-1,0,0], overlap=ov*2.5) bay_door();
        }
    }

    // TODO: Indent ring around top of Saucer

    // Bay Doors
    door_length = 0.1842 * radius;       // Side length of door
    door_depth = 0.1 * door_length;
    door_ypos = h1/-1.5;
    module bay_door() {
        translate([0,door_ypos,0]) {
        difference() {
                color("LightBlue", 1.0)
                cube([door_length, door_length, door_depth], center=true);  // "floor" 
                gap = 0.02 * door_length;  
                translate([0, 0, gap*2.5]) color("White", 1.0) cube([gap, door_length, gap], center=true);
            }
        }
    }

    module bay_door_blank() {
        translate([0,door_ypos,0])
            cube([door_length,door_length,door_depth*3], center=true);
    }

}



// Construction
saucer(radius);
