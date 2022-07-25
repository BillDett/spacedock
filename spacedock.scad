use <saucer.scad>
use <lower_saucer.scad>
use <neck.scad>
use <shoulder.scad>
use <legs.scad>
use <ball.scad>
include <dimensions.scad>

// TODO: Stacking up these parts is broken- need something better

#translate([0,0,-saucer_total_height/2])
    saucer(radius, saucer_height);
#translate([0,0,-1*(saucer_total_height)])
    xrot(180) lower_saucer();
translate([0,0,-1*(saucer_total_height + lower_saucer_total_height+neck_total_height)])
    xrot(180) neck();
#translate([0,0,-1*(saucer_total_height + lower_saucer_total_height + neck_total_height+shoulder_total_height)])
    shoulder();
translate([0,0,-1*(saucer_total_height + lower_saucer_total_height + neck_total_height+ shoulder_total_height+legs_total_height)])
    legs();
translate([0,0,-1*(saucer_total_height + lower_saucer_total_height + neck_total_height+ shoulder_total_height+legs_total_height+ball_total_height)])
    ball();
