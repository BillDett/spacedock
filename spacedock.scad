use <saucer.scad>
use <lower_saucer.scad>
use <neck.scad>
use <shoulder.scad>
include <dimensions.scad>

saucer(radius, saucer_height);
translate([0,0,-saucer_total_height])
    xrot(180) lower_saucer();
translate([0,0,-(saucer_total_height + lower_saucer_total_height)])
    xrot(180) neck();
translate([0,0,-(saucer_total_height + lower_saucer_total_height + neck_total_height+ shoulder_total_height)])
    shoulder();
