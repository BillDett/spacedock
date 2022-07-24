// Dimensions for the model
//  We drive the entire scale of the model from the radius of the main Saucer
  // These are only the 'top-level' dimensions. Individual modules will define local dimensions based on these.

// Saucer
radius = 100; // Radius of the main Saucer
saucer_height = 0.27142 * radius;       // Saucer height to bottom of rim
wall = .06 * radius;                    // How thick should interior walls be?
saucer_total_height = saucer_height/1.6;  // TODO: Figure out how make this exact

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
bottom_cut_height = 0.08064 * shoulder_bottom_radius;   // How far above zorigin to begin bottom cut
top_cut_height = 0.7096 * shoulder_bottom_radius;       // How far above zorigin to begin top cut
shoulder_total_height = top_cut_height - bottom_cut_height;

// Legs
leg1_radius = 0.2526 * radius;
leg1_height = 0.0315 * radius;

leg2_top_radius = 0.2526 * radius;
leg2_bottom_radius = 0.2211 * radius;
leg2_height = 0.0515 * radius;

leg3_radius = 0.2105 * radius;
leg3_height = 0.0126 * radius;

leg4_radius = 0.2211 * radius;
leg4_height = 0.4 * radius;

leg5_radius = 0.2105 * radius;
leg5_height = 0.0105 * radius;

leg6_radius = 0.2210 * radius;
leg6_height = 0.0084 * radius;

leg7_top_radius = 0.2210 * radius;
leg7_bottom_radius = 0.1842 * radius;
leg7_height = 0.03157 * radius;

leg8_radius = 0.1526 * radius;
leg8_height = 0.0189 * radius;

leg9_radius = 0.1736 * radius;
leg9_height = 0.1684 * radius;

leg10_radius = 0.1632 * radius;
leg10_height = 0.0158 * radius;

// Ball
ball_top_radius = 0.1684 * radius;
ball_bottom_radius = 0.2631 * radius;
ball_height = 0.1979 * radius;

ball_trench_radius = 0.2631 * radius;
ball_trench_height = 0.0315 * radius;


$fa=1;
$fs=0.01;
$fn=50;