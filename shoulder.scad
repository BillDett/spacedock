include <BOSL2/std.scad>
include <dimensions.scad>

module shoulder() {

    lower_angle = 9;
    upper_angle = 48;

    // How far off zorigin is bottom and top of dome after we rotate the arc?
    // We use these 'fudge factors' to accommodate the arc width so we can put it close to z=0
    dome_bottom_offset = hyp_ang_to_opp(shoulder_bottom_radius, lower_angle*.6); 
    dome_top_offset = hyp_ang_to_opp(shoulder_bottom_radius, upper_angle*1.05);  

    // Overall height of the dome
    dome_height = dome_top_offset-dome_bottom_offset;
    upper_radius=cos(upper_angle*0.95) * dome_top_offset;
    lower_radius = hyp_ang_to_adj(shoulder_bottom_radius, lower_angle);

    // Bump dimensions
    bump_top_radius = 0.1305 * radius;
    bump_bottom_radius = 0.07579 * radius;
    bump_height = 0.07052 * radius;

    module half_dome() {
        translate([0,0,-dome_bottom_offset]) 
        rotate_extrude() {
                path = arc(r=shoulder_bottom_radius, start=lower_angle, angle=upper_angle);
                stroke(path, width=wall, endcaps="square"); 
           }

        // Top and Bottom caps
        cap_height = wall * 0.45;
        translate([0,0,(cap_height/2)+dome_top_offset]) tube(or=upper_radius, ir=upper_radius*.5, h=cap_height);
        translate([0,0,(cap_height/2)]) tube(or=lower_radius, ir=lower_radius*.5, h=cap_height); 
    }

    // Split out the details on bottom of dome as this will make printing easier if done in 2 sections
    module bottom_stuff() {
        // "Ribs" around center
        rib_length = lower_radius*.5;
        rib_width = wall * 0.1;
        rib_height = wall * 0.1;
        translate([0,0,0])
            zrot_copies(n=50, r=lower_radius*0.5)
                yrot(90) color("LightBlue", 1.0) cube([rib_width,rib_height,rib_length]);

        // Bottom Rings
        tube(or=lower_radius*0.7, ir=lower_radius*.5, h=rib_height*3);
        tube(or=shoulder_bottom_radius*1.05, ir=shoulder_bottom_radius*.9, h=rib_height*3);

        // Bumps
        translate([0,0,-(rib_height+bump_height)])
            zrot_copies(n=4, sa=45, r=shoulder_bottom_radius*.75)
                bump();

    }

    // these are the 4 trapezoidal 'bumps' that are attached to bottom of shoulder
    module bump() {
        translate([0,0,(bump_height/2)]) {
            cyl(r2=bump_top_radius, r1=bump_bottom_radius, h=bump_height);
            // TODO: Add more details and rectangular cut-out at bottom
        }
    }

    half_dome();
    bottom_stuff();
    //bump();
}

shoulder();