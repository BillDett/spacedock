include <dimensions.scad>
use <saucer.scad>
use <lower_saucer.scad>
use <neck.scad>
use <shoulder.scad>
use <legs.scad>
use <ball.scad>

// TODO: Some of these height values are just made up- so it's not fitting together correctly.
//  Need to figure out a better way to calculate proper height instead of estimating.
length = saucer_total_height + lower_saucer_total_height + neck_total_height
        + shoulder_total_height + legs_total_height + ball_total_height;
zdistribute(l=length, spacing=0) {
    ball();
    legs();
    shoulder();
    xrot(180) neck();
    xrot(180) lower_saucer();
    saucer();
}

