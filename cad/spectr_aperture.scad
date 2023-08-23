
// wall_left
module wall() {
    difference() {
        cube([50, 1, 100], center = true);
        
        translate([0, 0, 25])
        cube([5, 2, 35.5], center = true);
    }
}

module static_razer_mount() {
    razer_pegs();
    #cylinder(5, 1.75, 1.75, center = true);    
}

module razer_pegs() {
    union() {
        color("green")
        translate([0, 17.5, 1])
        cube([3, 0.5, 2], center=true);

        color("green")
        translate([0, -17.5, 1])
        cube([3, 0.5, 2], center=true);
        
        color("#00008060")
        cube([22, 42, 2.1], center=true);
    }
}

module rails() {
    translate([11+0.25 - 2, 0, 25])
    union() {
        translate([0, 0, 17.5])
        #cube([16, 4, 0.5], center=true);
        translate([0, 0, -17.5])
        #cube([16, 4, 0.5], center=true);
        translate([0, 0, 0])
        #cube([16, 4, 3], center=true);
    }
}



difference() {
    wall();
    rails();
}

translate([-11.25, 0, 25])
rotate([90, 0, 0])
static_razer_mount();



