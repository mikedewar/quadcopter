// tiny motormounts

include <hardware_dims.scad>
include <model_dims.scad>

difference() {
    /*
    union() {
                rotate([0,0,45]) cube(size=[1*m_w,3*m_w,m_h], center=true);
                rotate([0,0,-45]) cube(size=[1*m_w,3*m_w,m_h], center=true);
            }
            */
    minkowski (){
        union() {
                rotate([0,0,45]) cube(size=[1*m_w,3*m_w,m_h], center=true);
                rotate([0,0,-45]) cube(size=[1*m_w,3*m_w,m_h], center=true);
        }
        sphere(r=2);
    }
	union() {
        // tube
		translate([0,0,-m_h/2]) rotate([90,0,0]) cylinder(h=4*m_w, r=c_d/2, center=true);
        // holes
        rotate([0,0,45]){
		translate([x_1,0,0]) cylinder(h=2*m_h, r=s_d/2,center=true);
		translate([-x_1,0,0]) cylinder(h=2*m_h, r=s_d/2,center=true);
		translate([0,-x_1,0]) cylinder(h=2*m_h, r=s_d/2,center=true);
		translate([0,x_1,0]) cylinder(h=2*m_h, r=s_d/2,center=true);
        // nut holders
		translate([-x_1,0,1+0.5*m_h]) cylinder(h=m_h, r=s_d-0.7,center=true, $fn=6);
		translate([x_1,0,1+0.5*m_h]) cylinder(h=m_h, r=s_d-0.7,center=true, $fn=6);
		translate([0,-x_1,1+0.5*m_h]) cylinder(h=m_h, r=s_d-0.7,center=true, $fn=6);
		translate([0,x_1,1+0.5*m_h]) cylinder(h=m_h, r=s_d-0.7,center=true, $fn=6);
        
        }
	}
    translate([0,0,-(2+0.5*m_h)]) cube(size=[5+3*m_w,5+3*m_w,3], center=true);
}

