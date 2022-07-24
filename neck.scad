include <BOSL2/std.scad>
include <dimensions.scad>

module neck() {
    translate([0,0,neck_lip_height/2])
        tube(h=neck_lip_height, or=neck_lip_radius, wall=wall);
    translate([0,0,neck_lip_height+(neck_height)/2])
        tube(h=neck_height, or=neck_radius, wall=wall);
    translate([0,0,neck_lip_height+(neck_lip_height/2)+neck_height])
        tube(h=neck_lip_height, or=neck_lip_radius, wall=wall);
}

neck();