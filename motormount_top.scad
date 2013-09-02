// tiny motormounts

include <hardware_dims.scad>
include <model_dims.scad>

difference() {
    minkowski (){
        union() {
                cube(size=[3*m_w,1*m_w,m_h], center=true);
                cube(size=[1*m_w,3*m_w,m_h], center=true);
        }
        sphere(r=2);

    }
	union() {
		translate([0,1.5*m_w,-m_h/2]) rotate([90,0,0]) cylinder(h=4*m_w, r=c_d/2, center=true);
		translate([x_1,0,0]) cylinder(h=2*m_h, r=s_d/2,center=true);
		translate([-x_1,0,0]) cylinder(h=2*m_h, r=s_d/2,center=true);
		translate([0,-x_1,0]) cylinder(h=2*m_h, r=s_d/2,center=true);
		translate([0,x_1,0]) cylinder(h=2*m_h, r=s_d/2,center=true);
	}
    translate([0,0,-(2+0.5*m_h)]) cube(size=[5+3*m_w,5+3*m_w,3], center=true);
}

