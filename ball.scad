include <BOSL2/std.scad>
include <dimensions.scad>

module ball() {

    // Trying to be smart here- we actually want the arc angles to be driven from 
    //  the ball_top_radius (which equals the l10_radius since they touch )
    upper_angle = atan(ball_height/ball_top_radius);
    lower_angle = 4;

    echo(upper_angle=upper_angle);

    // How far off zorigin is bottom and top of dome after we rotate the arc?
    // We use these 'fudge factors' to accommodate the arc width so we can put it close to z=0
    dome_bottom_offset = hyp_ang_to_opp(shoulder_bottom_radius, lower_angle*.6); 
    dome_top_offset = hyp_ang_to_opp(ball_bottom_radius, upper_angle*1.05);  

    module half_dome() {
        translate([0,0,-dome_bottom_offset])
        rotate_extrude() {
            path = arc(r=ball_bottom_radius, start=lower_angle, angle=upper_angle);
            stroke(path, width=wall*.5, endcaps="butt"); 
        }
    }

    module upper_ball() {
        half_dome();
        translate([0,0,ball_trench_height/-2]) {
            tube(h=ball_trench_height, or=ball_trench_radius, wall=wall*.5);    // "trench"
            zrot_copies(n=180, r=ball_trench_radius*1.01)
                zrot(90) color("LightBlue", 1.0)
                    cube([wall*.1,wall*.1,ball_trench_height],center=true);     // "ribbing" around trench
        }       
    }

    module lower_ball() {
        translate([0,0,-ball_trench_height])
            xrot(180)
                half_dome();
        translate([0,0,-ball_trench_height-dome_top_offset+(wall*.5)])
            cylinder(r=ball_top_radius, h=wall*.5); // bottom cap
    }

    // Split these out so we can print the ball in two sections more easily
    upper_ball();
    lower_ball();

}

ball();
