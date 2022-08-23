include <BOSL2/std.scad>
include <dimensions.scad>

module ball() {

        module half_dome() {
            rotate_extrude() {
                path = arc(r=ball_bottom_radius, start=ball_lower_angle, angle=ball_upper_angle);
                stroke(path, width=wall*.5, endcaps="butt"); 
            }
        }

        module trench() {
            tube(h=ball_trench_height, or=ball_trench_radius, wall=wall*.5);
            // "ribbing" around trench
            zrot_copies(n=180, r=ball_trench_radius*1.01)
                zrot(90) color("LightBlue", 1.0)
                    cube([wall*.1,wall*.1,ball_trench_height],center=true);    
        }

        module upper_ball() {
            trench();
            translate([0,0,ball_trench_height/2])
                half_dome();     
        }

        module lower_ball() {
            translate([0,0,ball_trench_height/-2])
                xrot(180)
                    half_dome();
            translate([0,0,-ball_dome_top_offset])
                cylinder(r=ball_top_radius, h=wall*.5); // bottom cap
        }

        // These are split out so we can print the ball in two sections more easily
        upper_ball();
        lower_ball();

}

ball();
