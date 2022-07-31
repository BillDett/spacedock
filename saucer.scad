include <BOSL2/std.scad>
include <dimensions.scad>

module saucer() {

    hole = 0.03 * radius;
    rad1 = .41428 * radius;    // Top radius
    rad2 = 0.98571 * radius;    // Rim radius
    channel_width = saucer_height * 0.089;  // Width of channel at top part of saucer

    // Bay Doors
    door_length = 0.1842 * radius;       // Side length of door
    door_depth = 0.1 * door_length;
    door_ypos = saucer_height/-1.5;

    translate([0,0,saucer_total_height/1.7]) {

        // Saucer main shell
        diff()
        tube(h=saucer_height, or1=rad2, or2=rad1, wall=wall) {
            ov = 1.0;   // TODO: causes issues with inset on doors at different scales
            tag("remove") {
                attach([0,1,0], overlap=ov) bay_door_blank();
                attach([1,0,0], overlap=ov) bay_door_blank();
                attach([0,-1,0], overlap=ov) bay_door_blank();
                attach([-1,0,0], overlap=ov) bay_door_blank();   
                // TODO: Cut-out spot inbetween doors for wide strip thingy         
            }
            tag("keep") {
                attach([0,1,0], overlap=ov*2.5) bay_door();
                attach([1,0,0], overlap=ov*2.5) bay_door();
                attach([0,-1,0], overlap=ov*2.5) bay_door();
                attach([-1,0,0], overlap=ov*2.5) bay_door();
                // TODO: Add in wide strip thingy between doors
            }
        }

        // Bottom Rim
        translate([0,0,(saucer_height+saucer_rim_height)/-2])
            tube(h=saucer_rim_height, or1=radius, or2=rad2, wall=wall);   
        
        // Top Plate
        translate([0,0,saucer_height/2.6]) cyl(h=wall, r=rad1)
            attach([0,0,1], overlap=-3) saucer_top();   // NOTE: using negative overlap here to keep it from 'sinking' into the top plate
        
        // "stripe" around middle of saucer
        plate_height=saucer_height*.5;
        translate([0,0,0]) { 
            color("LightBlue", 1.0) tube(h=channel_width, or1=rad2*.745, or2=rad1*1.64, wall=wall);  // Top Plate and channel interior
            translate([0,0,(channel_width/-2)])
                tube(h=channel_width*.25, or=rad2*.743, ir=rad2*.7);
        }
 
    }

    module bay_door() {
        translate([0,door_ypos,0]) {
        difference() {
                color("LightBlue", 1.0)
                cube([door_length, door_length, door_depth], center=true);  // "floor" 
                gap = 0.02 * door_length;  
                translate([0, 0, gap*2.5]) cube([gap, door_length, gap], center=true);
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
saucer();
