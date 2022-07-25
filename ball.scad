include <BOSL2/std.scad>
include <dimensions.scad>

module ball() {

    //upper_angle = 48;
    // TODO: Trying to be smart here- we actually want the arc angles to be driven from 
    //  the ball_top_radius (which should basically match the l10_radius since they touch )
    // The stroke width however is skewing all of our measurements...need to figure out how
    //  to account for this!
    upper_angle = atan(ball_height/ball_top_radius);
    lower_angle = 9;

    // How far off zorigin is bottom and top of dome after we rotate the arc?
    // We use these 'fudge factors' to accommodate the arc width so we can put it close to z=0
    dome_bottom_offset = hyp_ang_to_opp(shoulder_bottom_radius, lower_angle*.6); 
    dome_top_offset = hyp_ang_to_opp(ball_bottom_radius, upper_angle*1.05);  

    // Overall height of the dome
    dome_height = dome_top_offset;
    upper_radius=cos(upper_angle*0.95) * dome_top_offset;
    lower_radius = hyp_ang_to_adj(ball_bottom_radius, lower_angle);


    module half_dome() {
        translate([0,0,-dome_bottom_offset]) 
        rotate_extrude() {
                path = arc(r=ball_bottom_radius, start=lower_angle, angle=upper_angle);
                //  TODO: When we use 'width' it skews the shape of the arc onsiderably
                //stroke(path, width=wall, endcaps="square"); 
                stroke(path, endcaps="square"); 
        }

        // Top and Bottom caps
        cap_height = wall * 0.45;
        //translate([0,0,(cap_height/2)+dome_top_offset]) tube(or=upper_radius, ir=upper_radius*.5, h=cap_height);
        //translate([0,0,(cap_height/2)]) tube(or=lower_radius, ir=lower_radius*.5, h=cap_height); 
    }

    half_dome();

    // TODO: Create a tube for internal channel and then mirror the half_dome again for bottom part.
}

ball();