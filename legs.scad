include <BOSL2/std.scad>
include <dimensions.scad>


module legs() {
    translate([0,0,l10_start]) {
        tube(h=l10_height, or=l10_radius, wall=wall);
        zrot_copies(n=180, r=l10_radius*1.01)
            zrot(90) cube([wall*.05,wall*.05,l10_height],center=true);     // "ribbing" around ring
    }
    translate([0,0,l9_start])
        tube(h=l9_height, or=l9_radius, wall=wall);
    translate([0,0,l8_start]) {
        tube(h=l8_height, or=l8_radius, wall=wall);
        zrot_copies(n=180, r=l8_radius*1.01)
            zrot(90) cube([wall*.05,wall*.05,l8_height],center=true);     // "ribbing" around ring
    }
    translate([0,0,l7_start])
        tube(h=l7_height, or2=l7_top_radius, or1=l7_bottom_radius, wall=wall);
    translate([0,0,l6_start])
        tube(h=l6_height, or=l6_radius, wall=wall);
    translate([0,0,l5_start]) {
        tube(h=l5_height, or=l5_radius, wall=wall);
        zrot_copies(n=180, r=l5_radius*1.01)
            zrot(90) cube([wall*.05,wall*.05,l5_height],center=true);     // "ribbing" around ring   
    }
    translate([0,0,l4_start])
        tube(h=l4_height, or=l4_radius, wall=wall);
    translate([0,0,l3_start])
        tube(h=l3_height, or=l3_radius, wall=wall);
    translate([0,0,l2_start])
        tube(h=l2_height, or2=l2_top_radius, or1=l2_bottom_radius, wall=wall);
    translate([0,0,l1_start])
        tube(h=l1_height, or=l1_radius, wall=wall);

}


legs();