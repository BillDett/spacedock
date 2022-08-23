include <BOSL2/std.scad>
include <dimensions.scad>

module neck() {
    // Main section
    tube(h=neck_height, or=neck_radius, wall=wall);
    // Top lip
    translate([0,0,(neck_height+neck_lip_height)/2])
        tube(h=neck_lip_height, or=neck_lip_radius, wall=wall);
    // Bottom lip
    translate([0,0,(neck_height+neck_lip_height)/-2])
        tube(h=neck_lip_height, or=neck_lip_radius, wall=wall);
}

neck();