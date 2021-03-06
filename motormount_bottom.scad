// tiny motormounts

include <hardware_dims.scad>
include <model_dims.scad>

l_h=70;
noodle_r = 12;

difference() {
	/*
	union() {
	rotate([0,0,45]) cube(size=[1*m_w,3*m_w,m_h], center=true);
	rotate([0,0,-45]) cube(size=[1*m_w,3*m_w,m_h], center=true);
	}
	*/
	union (){
		//landing foot
		translate([0,0,30]) rotate([0,0,0]) cylinder(h=l_h, r=noodle_r, center=true);
		translate([0,0,l_h-5]) sphere(r=noodle_r, center=true);
		// structure
		rotate([90,0,45]) translate ([0,0,-m_w/2]) linear_extrude(height = m_w) polygon(points=[[0,0],[1.5*m_w,0],[0,4*m_w]], paths=[[0,1,2]]);
		rotate([90,0,-135]) translate ([0,0,-m_w/2]) linear_extrude(height = m_w) polygon(points=[[0,0],[1.5*m_w,0],[0,4*m_w]], paths=[[0,1,2]]);
		rotate([90,0,135]) translate ([0,0,-m_w/2]) linear_extrude(height = m_w) polygon(points=[[0,0],[1.5*m_w,0],[0,4*m_w]], paths=[[0,1,2]]);
		rotate([90,0,-45]) translate ([0,0,-m_w/2]) linear_extrude(height = m_w) polygon(points=[[0,0],[1.5*m_w,0],[0,4*m_w]], paths=[[0,1,2]]);
		
		minkowski (){
			union() {
				rotate([0,0,45]) cube(size=[1*m_w,3*m_w,m_h], center=true);
				rotate([0,0,-45]) cube(size=[1*m_w,3*m_w,m_h], center=true);
			}
			sphere(r=2);
		}
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
			translate([-x_1,0,0.5*m_h]) cylinder(h=3*m_h, r=s_d-0.7, $fn=6);
			translate([x_1,0,0.5*m_h]) cylinder(h=3*m_h, r=s_d-0.7, $fn=6);
			translate([0,-x_1,0.5*m_h]) cylinder(h=3*m_h, r=s_d-0.7, $fn=6);
			translate([0,x_1,0.5*m_h]) cylinder(h=3*m_h, r=s_d-0.7, $fn=6);

		}
	}
	translate([0,0,-(2+0.5*m_h)]) cube(size=[5+3*m_w,5+3*m_w,3], center=true);
}

