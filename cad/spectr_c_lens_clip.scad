module trapezoid_3d(bottom_length, top_length, height, depth) {
    points = [
        [-(bottom_length / 2), 0], // Bottom left
        [ (bottom_length / 2), 0], // Bottom right
        [ (top_length / 2), height], // Top right
        [-(top_length / 2), height] // Top left
    ];
    
    faces = [
        [0, 1, 2, 3] // Face for the trapezoid
    ];
    
    rotate([90, 0, 90]) {
        linear_extrude(height = depth) polygon(points=points, paths=faces);
    }
}

module raw_base() {
    union() {
        translate([-10, 0, 2])
        trapezoid_3d(32, 16, 8, 20);
        cube([20, 60, 4], center = true); 
    }
}

module base() {
    difference() {
        raw_base();
        translate([0, (30-2-5), 0])
        cylinder(r = 3, h = 20, center = true);
        translate([0,-(30-2-5), 0])
        cylinder(r = 3, h = 20, center = true);
    }
}



module lens() {
    translate([0, 0, 8+25.4])
    rotate([90, 0, 0])
    cylinder(3.2, 25.4, 25.4, center=true);
}

module lens_frame() {
    difference() {
        translate([0, 0, 6+27.4])
        rotate([90, 0, 0])
        cylinder(6, 27.4, 27.4, center=true);
        
        translate([0,0,65])
        cube([100, 20, 40], center=true);
    }
}

module lens_clearance() {
    translate([0, 0, 10+23.4])
    rotate([90, 0, 0])
    cylinder(20, 23.4, 23.4, center=true);
}

difference() {
    union() {
        base();
        lens_frame();
    }
    lens();
    lens_clearance();
}