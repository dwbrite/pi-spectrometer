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



module lens(size, depth) {
    translate([0, 0, 8+size/2])
    rotate([0, 0, 45])
    cube([size, depth, size], center=true);
}

module lens_frame(size, depth) {
    difference() {
        translate([0, 0, 8+size/2])
        rotate([0, 0, 45])
        cube([size+2, depth+4, size+2], center=true);
        
        translate([0,0,76])
        rotate([0, 0, 45])
        cube([100, 20, 40], center=true);
    }
}

module lens_clearance(size, depth) {
    translate([0, 0, 8+size/2])
    rotate([0, 0, 45])
    cube([size-4, depth+5, size-4], center=true);
}

size = 50.8;
depth = 3.41;

difference() {
    union() {
        base();
        lens_frame(size, depth);
    }
    lens(size, depth);
    lens_clearance(size, depth);
}


rotate([0, 0, -45])
translate([-3, 0, -2])
trapezoid_3d(20, size+2, 9, depth+4);
