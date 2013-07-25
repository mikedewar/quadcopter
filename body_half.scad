include <hardware_dims.scad>
include <model_dims.scad>
include <chassis.scad>

module arm_holder(){
	// this bit holds the carbon fiber steady in the center
	difference(){
		union() {
				cube([ah_l,m_w,m_h],center=true); // main arm
				translate([ah_l/2,0,0]) cube(size=[1*m_w,3*m_w,m_h], center=true); //clamp blocks
		}
		translate([0,0,m_h/2]){
			rotate([0,90,0]){
				cylinder(h=2*ah_l, r=c_d/2, center=true); // carbon fiber cutout
			}
		}
		translate([ah_l/2,-x_1,0]) cylinder(h=2*m_h, r=s_d/2,center=true); // screw holes
		translate([ah_l/2,x_1,0]) cylinder(h=2*m_h, r=s_d/2,center=true); // screw holes
	}	
}

module fiber_cutout(){
	translate([0,0,m_h/2]){
		rotate([90,0,45]){
			cylinder(h=2*ah_l, r=c_d/2, center=true); // carbon fiber cutout
		}
	}
	translate([0,0,m_h/2]){
		rotate([90,0,90+45]){
			cylinder(h=2*ah_l, r=c_d/2, center=true); // carbon fiber cutout
		}
	}
}

module center_block(){
	cube([m_w,m_w,m_h],center=true);
}

module mount_block(){
	cube([ch_full_l,1.6*m_w,ch_full_h],center=true);
}


translate([0,0,-m_h/2]){
	difference(){
		chassis();
		// clean up channels
		fiber_cutout();
	}
}


rotate(45){
	center_block();
	for (i = [0: 90: 270]) {
		rotate([0,0,i]){
			translate([ah_l/2 + m_w/2 ,0,0]){
				arm_holder();	
			}
		}
	}
}
difference(){
	translate([0,0,-2.7]) mount_block();
	fiber_cutout();
}