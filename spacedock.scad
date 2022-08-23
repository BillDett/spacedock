include <dimensions.scad>
use <saucer.scad>
use <lower_saucer.scad>
use <neck.scad>
use <shoulder.scad>
use <legs.scad>
use <ball.scad>

height_list = [ ball_total_height, legs_total_height, shoulder_total_height,
                neck_total_height, lower_saucer_total_height, saucer_total_height ];
zdistribute(sizes=height_list, spacing=0) {
    ball();
    legs();
    shoulder();
    xrot(180) neck();
    xrot(180) lower_saucer();
    saucer();
}

