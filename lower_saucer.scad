include <BOSL2/std.scad>
include <dimensions.scad>

module lower_saucer() {
    rim_outer_radius = radius;
    rim_inner_radius = rim_outer_radius * 0.8;
    rim_depth = radius * 0.03;
    // Cone
    tube(h=lower_saucer_total_height, or1=lower_saucer_top_radius, or2=lower_saucer_bottom_radius, wall=wall);

    translate([0,0,(lower_saucer_total_height/-2.1)]) {
        // Bottom flat rim
        tube(h=rim_depth, or=rim_outer_radius*.95, ir=rim_inner_radius);

        // "Ribs"
        translate([0,0,(rim_depth)/-2])
            tube(h=rim_depth/2, or=rim_inner_radius*1.1, ir=lower_saucer_top_radius*.87);   // "ceiling" behind ribs
            rib_length = lower_saucer_top_radius - lower_saucer_bottom_radius;
            rib_height = rim_depth * 0.2;
            rib_width = rib_height;
            translate([0,0,(rim_depth*.1)/-2])
                zrot_copies(n=300, r=lower_saucer_top_radius*.9)
                    yrot(90) color("LightBlue", 1.0) cube([rib_width,rib_height,rib_length]);
    }
}

// Construction
lower_saucer();
