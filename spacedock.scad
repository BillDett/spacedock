use <saucer.scad>
use <lower_saucer.scad>
use <neck.scad>
use <shoulder.scad>
use <legs.scad>
use <ball.scad>
include <dimensions.scad>

// TODO: Quite a mess here- haven't been consistent with where we place individual parts
//   nor are we good about exactly calculating total height.


lower_saucer_pos = lower_saucer_total_height/-2;        // Z=0
neck_pos = lower_saucer_total_height - neck_total_height;
shoulder_pos = lower_saucer_total_height - neck_total_height - shoulder_total_height;
legs_pos = lower_saucer_total_height - neck_total_height - shoulder_total_height ;
ball_pos = lower_saucer_total_height - neck_total_height - shoulder_total_height - legs_total_height - (ball_total_height/2);

echo(lower_saucer_pos=lower_saucer_pos, lower_saucer_total_height=lower_saucer_total_height);
echo(neck_pos=neck_pos, neck_total_height=neck_total_height);
echo(shoulder_pos=shoulder_pos, shoulder_total_height=shoulder_total_height);
echo(legs_pos=legs_pos, legs_total_height=legs_total_height);
echo(ball_pos=ball_pos, ball_total_height=ball_total_height);

// Defaults to bottom of lower rim at z=0
saucer();
translate([0,0,lower_saucer_pos])
    xrot(180) lower_saucer();
translate([0,0,neck_pos])
    xrot(180) neck();
#translate([0,0,shoulder_pos])
    shoulder();
translate([0,0,legs_pos])
    legs();
translate([0,0,ball_pos])
    ball();

