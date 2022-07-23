include <BOSL2/std.scad>
include <dimensions.scad>

module saucer(radius, height) {
    // All measurements are based on radius
    hole = 0.03 * radius;
    w = .06 * radius;
    rad1 = .41428 * radius;    // Top radius
    rad2 = 0.98571 * radius;    // Rim radius
    h2 = 0.05857 * radius;       // Rim height  

    // Main saucer shape  
    translate([0,0,(height+h2)/-2]) tube(h=h2, or1=radius, or2=rad2, wall=w);   // Bottom Rim
    translate([0,0,(height-w)/2]) tube(l=w, or=rad1, ir=hole);  // Top Plate 
    translate([0,0,(height/2)-w]) tube(l=2, or=rad1*1.25, ir=hole);     // Inner Plate

    // Saucer main shell
    diff()
    tube(h=height, or1=rad2, or2=rad1, wall=w) {
        ov = 1.0;
        tag("remove") {
            attach([0,1,0], overlap=ov) bay_door_blank();
            attach([1,0,0], overlap=ov) bay_door_blank();
            attach([0,-1,0], overlap=ov) bay_door_blank();
            attach([-1,0,0], overlap=ov) bay_door_blank();            
            // TODO: Indent ring around upper Saucer here
        }
        tag("keep") {
            attach([0,1,0], overlap=ov*2.5) bay_door();
            attach([1,0,0], overlap=ov*2.5) bay_door();
            attach([0,-1,0], overlap=ov*2.5) bay_door();
            attach([-1,0,0], overlap=ov*2.5) bay_door();
        }
    }

    // Top
    translate([0,0,(height/1.7)]) saucer_top();

    // Bay Doors
    door_length = 0.1842 * radius;       // Side length of door
    door_depth = 0.1 * door_length;
    door_ypos = height/-1.5;
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

    // Top 'crown' section
    module saucer_top() {
        top_height=0.0473*radius;
        top_radius=0.2157*radius;
        indent_depth=top_height*.7;
        ring_height=top_height*.1;
        diff()
        cyl(r1=0.2473*radius, r2=top_radius, h=top_height) { // main shell of top
            tag("remove") {
                attach([0,0,1]) cylinder(r=top_radius*0.9, h=top_height, center=true);    // Top indent
                cube([top_radius*2.2,top_radius*2.2,ring_height], center=true);   // 'channel' around edge
            }
            tag("keep") {
                cylinder(r=top_radius*1.02, h=top_height-indent_depth, center=true);  // 'channel' interior
            }
        }
    }

}

// Construction
saucer(radius, height);
