// Dimensions for the model
//  We drive the entire scale of the model from the radius of the main Saucer
  // These are only the 'top-level' dimensions. Individual modules will define local dimensions based on these.

// Saucer
radius = 100; // Radius of the main Saucer
saucer_height = 0.27142 * radius;       // Saucer height to bottom of rim
saucer_rim_height = 0.2 * saucer_height;  // Rim around bottom of saucer
wall = .05 * radius;                    // How thick should interior walls be?
hole = 0.05 * radius;                   // Center hole radius
saucer_total_height = saucer_height + saucer_rim_height;

// Lower Saucer
lower_saucer_top_radius = 0.6211 * radius;
lower_saucer_bottom_radius =  0.2579 * radius;
lower_saucer_height = 0.2105 * radius;
lower_saucer_total_height=lower_saucer_height/1.05;   // TODO: Figure out how make this exact

// Neck
neck_lip_radius = 0.2526 * radius;
neck_lip_height = 0.011 * radius;
neck_radius = 0.2631 * radius;
neck_height = 0.1315 * radius;
neck_total_height = (neck_lip_height*2) + neck_height;

// Shoulder
shoulder_top_radius = 0.3158 * radius;
shoulder_bottom_radius = 0.5158 * radius;
lower_angle = 9;
upper_angle = 48;
// How far off zorigin is bottom and top of dome after we rotate the arc?
// We use these 'fudge factors' to accommodate the arc width so we can put it close to z=0
dome_bottom_offset = hyp_ang_to_opp(shoulder_bottom_radius, lower_angle*.6); 
dome_top_offset = hyp_ang_to_opp(shoulder_bottom_radius, upper_angle*1.05);  
// Overall height of the dome
dome_height = dome_top_offset-dome_bottom_offset;
shoulder_total_height=dome_height;


// Legs
l10_radius = 0.1632 * radius;
l10_height = 0.0258 * radius;
l10_start = l10_height/2;

l9_radius = 0.1736 * radius;
l9_height = 0.1684 * radius;
l9_start =l9_height/2 + l10_height;

l8_radius = 0.1526 * radius;
l8_height = 0.0189 * radius;
l8_start = l8_height/2 + l9_height + l10_height;

l7_top_radius = 0.2210 * radius;
l7_bottom_radius = 0.1842 * radius;
l7_height = 0.03157 * radius;
l7_start = l7_height/2 + l8_height + l9_height + l10_height;

l6_radius = 0.2210 * radius;
l6_height = 0.0084 * radius;
l6_start = l6_height/2 + l7_height + l8_height + l9_height + l10_height;

l5_radius = 0.2105 * radius;
l5_height = 0.0105 * radius;
l5_start = l5_height/2 + l6_height + l7_height + l8_height + l9_height + l10_height;

l4_radius = 0.2211 * radius;
l4_height = 0.4 * radius;
l4_start = l4_height/2 + l5_height + l6_height + l7_height + l8_height + l9_height + l10_height;

l3_radius = 0.2105 * radius;
l3_height = 0.0126 * radius;
l3_start = l3_height/2 + l4_height + l5_height + l6_height + l7_height + l8_height + l9_height + l10_height;

l2_top_radius = 0.2526 * radius;
l2_bottom_radius = 0.2211 * radius;
l2_height = 0.0515 * radius;
l2_start = l2_height/2 + l3_height + l4_height + l5_height + l6_height + l7_height + l8_height + l9_height + l10_height;

l1_radius = 0.2526 * radius;
l1_height = 0.0315 * radius;
l1_start = l1_height/2 + l2_height  + l3_height + l4_height + l5_height + l6_height + l7_height + l8_height + l9_height + l10_height;

legs_total_height = l1_height + l2_height  + l3_height + l4_height + l5_height + l6_height + l7_height + l8_height + l9_height + l10_height;

// Ball
//ball_top_radius = 0.1684 * radius;
ball_top_radius = l10_radius*1.2;
ball_bottom_radius = 0.2631 * radius;
ball_height = 0.1979 * radius;
ball_total_height = 0.1979 * radius;  // TODO: wrong

ball_trench_radius = ball_bottom_radius;
ball_trench_height = 0.0315 * radius;


$fa=1;
$fs=0.01;
$fn=100;
