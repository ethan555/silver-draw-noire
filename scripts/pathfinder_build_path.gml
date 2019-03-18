///pathfinder_build_path(xdest, ydest)
var xd = argument[0];       // x-coords of where to go
var yd = argument[1];       // y-coords
var xs = xd;                // stairs x
var ys = yd;                // stairs y
path_building = path_add(); // path where points will be added
var value;                  // value in enemy grid
var xp;                     // coord of previous x
var a = -1;                 // enemy falling variables
var b = -1;
var n = 0;

path_add_point(path_building, xd*pathfinder.gwidth + (pathfinder.gwidth/2),
    yd*pathfinder.gheight + (pathfinder.gheight/2), 100); // init first point of path
value = grid_path[# xd, yd]; // Value in grid of the goal position

for (var i = value - 1; i > 0; i --) {
    xp = xd;
    n = 0;
    if (ds_grid_value_exists(grid_path, xd-1,yd-1,xd+1,yd, i)) {
        // Check left/right, jump
        xd = ds_grid_value_x(grid_path, xd-1,yd-1,xd+1,yd, i);
        yd = ds_grid_value_y(grid_path, xp-1,yd-1,xp+1,yd, i);
        path_add_point(path_building, xd*pathfinder.gwidth + (pathfinder.gwidth/2),
            yd*pathfinder.gheight + (pathfinder.gheight/2), 100);
    } else {
        // Check if we need to climb stairs
        // Try going to partner
        var inst = instance_place(grid_to_x(xd), grid_to_y(yd), stairs);
        if (inst != noone) {
            inst = inst.partner;
            if (inst != noone) {
                xs = x_to_grid(inst.x);
                ys = y_to_grid(inst.y);
                if (ds_grid_value_exists(grid_path, xs-1,ys,xs+1,ys, i)) {
                    // check if we should climb the stairs
                    xd = ds_grid_value_x(grid_path, xs-1,ys,xs+1,ys, i);
                    yd = ds_grid_value_y(grid_path, xs-1,ys,xs+1,ys, i);
                    path_add_point(path_building, xs*pathfinder.gwidth + (pathfinder.gwidth/2),
                        ys*pathfinder.gheight + (pathfinder.gheight/2), 100);
                }
            }
        } else {
            // We must fall, so find where we fall from
            for (n = n; a != i && b != i && yd - n >= 0; n = n) {
                n ++;
                a = grid_path[# xp-1, yd - n];
                b = grid_path[# xp+1, yd - n];
            }
            if (ds_grid_value_exists(grid_path, xp-1, yd - n, xp+1, yd, i)) {
                xd = ds_grid_value_x(grid_path, xp-1, yd - n, xp+1, yd, i);
                yd = ds_grid_value_y(grid_path, xp-1, yd - n, xp+1, yd, i);
                path_add_point(path_building, xd*pathfinder.gwidth + (pathfinder.gwidth/2),
                    yd*pathfinder.gheight + (pathfinder.gheight/2), 100);
            }
        }
    }
}

path_add_point(path_building,
    floor(x/pathfinder.gwidth)*pathfinder.gwidth+(pathfinder.gwidth/2),
    floor(y/pathfinder.gheight)*pathfinder.gheight+(pathfinder.gheight/2),
    100); // Add own position to path
path_set_closed(path_building,0);
path_reverse(path_building);

