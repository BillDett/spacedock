include <BOSL2/std.scad>
include <dimensions.scad>


module shoulder() {

    // Bump dimensions
    bump_top_radius = 0.1305 * radius;
    bump_bottom_radius = 0.07579 * radius;
    bump_height = 0.07052 * radius;

    module half_dome() {
        rotate_extrude() {
                path = arc(r=shoulder_bottom_radius, start=shoulder_lower_angle, angle=shoulder_upper_angle);
                stroke(path, width=wall*.5, endcaps="butt"); 
           }

        // Top and Bottom caps
        cap_height = wall * 0.45;
        translate([0,0,dome_top_offset*.95])
            tube(or=shoulder_top_radius, ir=shoulder_top_radius*.5, h=cap_height);
        translate([0,0,(cap_height/2)])
            tube(or=shoulder_lower_radius, ir=shoulder_lower_radius*.5, h=cap_height); 
    }

    // Split out the details on bottom of dome as this will make printing easier if done in 2 sections
    module bottom_stuff() {
        // "Ribs" around center
        translate([0,0,0])
            zrot_copies(n=50, r=shoulder_lower_radius*0.5)
                yrot(90) color("LightBlue", 1.0) cube([shoulder_rib_width,shoulder_rib_height,shoulder_rib_length]);

        // Bottom Rings
        tube(or=shoulder_lower_radius*0.7, ir=shoulder_lower_radius*.5, h=shoulder_rib_height*3);
        tube(or=shoulder_bottom_radius, ir=shoulder_bottom_radius*.9, h=shoulder_rib_height*3);

        // Bumps
        translate([0,0,-(shoulder_rib_height+bump_height)])
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

    translate([0,0,shoulder_total_height/-2]) {
        half_dome();
        bottom_stuff();
    }
}

shoulder();