// tiny motormounts

include <hardware_dims.scad>
include <model_dims.scad>

difference() {
	union() {
			cube(size=[3*m_w,1*m_w,m_h], center=true);
			cube(size=[1*m_w,3*m_w,m_h], center=true);
	}
	union() {
		translate([0,0,-m_h/2]) rotate([90,0,0]) cylinder(h=4*m_w, r=c_d/2, center=true);
		translate([x_1,0,0]) cylinder(h=2*m_h, r=s_d/2,center=true);
		translate([-x_1,0,0]) cylinder(h=2*m_h, r=s_d/2,center=true);
		translate([0,-x_1,0]) cylinder(h=2*m_h, r=s_d/2,center=true);
		translate([0,x_1,0]) cylinder(h=2*m_h, r=s_d/2,center=true);
	}
}

