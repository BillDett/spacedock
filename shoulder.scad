include <BOSL2/std.scad>
include <dimensions.scad>

module shoulder() {
    module half_dome() {
        translate([0,0,-bottom_cut_height])
            difference() {
                sphere(r=shoulder_bottom_radius);
                translate([0,0,-shoulder_bottom_radius+bottom_cut_height])  // Remove Bottom
                    cube(size=shoulder_bottom_radius*2, center=true);
                translate([0,0,shoulder_bottom_radius+top_cut_height])      // Remove Top
                    cube(size=shoulder_bottom_radius*2, center=true);
            }
    }
    /*
    // That's too expensive
    // TODO: Figure out how to hollow out this thing...
    difference() {
        half_dome();
        scale(.8) half_dome();
    }
    */
    half_dome();
}

shoulder();