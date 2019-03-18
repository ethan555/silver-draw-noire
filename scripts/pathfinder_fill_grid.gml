///pathfinder_fill_grid(xt, yt, destx, desty)
var i = 0;
var xt = argument[i++];
var yt = argument[i++];
var xd = argument[i++];
var yd = argument[i++];
var path_found = false;
var fall_n = 1;
var fall_a = 0;

// Copy the global pathfinding
grid_path = ds_grid_create(ds_grid_width(grid_pathfinding), ds_grid_height(grid_pathfinding));
ds_grid_copy(grid_path, grid_pathfinding);

// Add point into list
var point_list = ds_list_create();
add_point(point_list, xt, yt);
ds_grid_set(grid_path, xt, yt, 0);

for (var i = 1; i < 200; i ++) {

    if (path_found) {
        ds_list_destroy(point_list);
        //ds_grid_destroy(grid_path); // Only comment for debug purposes
        return path_found;
    }

    var list_size = ds_list_size(point_list);
    // No points were found, no good path
    if (list_size == 0) {
        ds_list_destroy(point_list);
        ds_grid_destroy(grid_path);
        return path_found;
    }
    
    for (var j = 0; j < list_size; j += 2) {
        xt = point_list[| j];
        yt = point_list[| j+1];
        
        if (xt == xd && yt == yd) {
            path_found = true;
            pathfinder_build_path(xd,yd);
            break;
        }
        
        fall_n = 1;
        
        var xp = xt+1;
        if (xp >= 0 && xp < ds_grid_width(grid_path)) {
        // Check if there is floor at 3
        if ((grid_path[# xp,yt] == -1 || grid_path[# xp,yt] == STAIRS_UP
            || grid_path[# xp,yt] == STAIRS_DOWN)
            && grid_path[# xp,yt+1] == -2) {
            if (grid_path[# xt,yt-1] == STAIRS_UP || grid_path[# xt,yt-1] == STAIRS_DOWN) {
                // Try going to partner
                var inst = instance_place(grid_to_x(xt), grid_to_y(yt), stairs);
                if (inst != noone) {
                    inst = inst.partner;
                    if (inst != noone) {
                        grid_path[# x_to_grid(inst.x), y_to_grid(inst.y)] = i;
                        add_point(point_list,x_to_grid(inst.x),y_to_grid(inst.y));
                    }
                }
            }
            grid_path[# xp,yt] = i;
            add_point(point_list,xp,yt);
        } else { // Only happens if can't go 6
            // Check if we can jump one block up to 9
            /*if (grid_path[# xp,yt] == -2 && grid_path[# xp,yt-1] == -1) {
                grid_path[# xp,yt-1] = i;
                add_point(point_list, xp, yt-1);
            } else { // Only happens if can't jump up to 9
                // Check if we can jump over a void at 3
                if (grid_path[# xp,yt] == -1 && grid_path[# xt+2,yt] == -1
                    && grid_path[# xt+2,yt+1] == -2) {
                    
                    grid_path[# xt+2,yt] = i;
                    add_point(point_list, xt+2, yt);
                }*/
                // Check if we can fall to 3
                if (grid_path[# xp,yt] == -1 && grid_path[# xp,yt+1] == -1) {
                    // Find where we will fall to
                    var h = ds_grid_height(grid_path) - 1;
                    for (fall_n = fall_n; fall_a != -2 && yt+fall_n < h; fall_n++) {
                        fall_a = grid_path[# xp, yt+fall_n];
                    }
                    // When we find it, fall_n will be 1 too large
                    fall_n --;
                    if (grid_path[# xp,yt+fall_n-1] == -1 && grid_path[# xp, yt+fall_n] == -2) {
                        grid_path[# xp,yt+fall_n-1] = i;
                        add_point(point_list, xp,yt+fall_n-1);
                    }
                }
            //}
        }
        }
        
        fall_n = 1;
        fall_a = 0;
        
        xp = xt-1;
        if (xp >= 0 && xp < ds_grid_width(grid_path)) {
        // Check if there is floor at 1
        if ((grid_path[# xp,yt] == -1 || grid_path[# xp,yt] == STAIRS_UP
            || grid_path[# xp,yt] == STAIRS_DOWN) && grid_path[# xp,yt+1] == -2) {
            if (grid_path[# xt,yt-1] == STAIRS_UP || grid_path[# xt,yt-1] == STAIRS_DOWN) {
                // Try going to partner
                var inst = instance_place(grid_to_x(xt), grid_to_y(yt), stairs);
                if (inst != noone) {
                    inst = inst.partner;
                    if (inst != noone) {
                        grid_path[# x_to_grid(inst.x), y_to_grid(inst.y)] = i;
                        add_point(point_list,x_to_grid(inst.x),y_to_grid(inst.y));
                    }
                }
            }
            grid_path[# xp,yt] = i;
            add_point(point_list,xp,yt);
        } else { // Only happens if can't go 4
            // Check if we can jump one block up to 7
            /*if (grid_path[# xp,yt] == -2 && grid_path[# xp,yt-1] == -1) {
                grid_path[# xp,yt-1] = i;
                add_point(point_list, xp, yt-1);
            } else { // Only happens if can't jump up to 7
                // Check if we can jump over a void at 1
                if (grid_path[# xp,yt] == -1 && grid_path[# xt-2,yt] == -1
                    && grid_path[# xt-2,yt+1] == -2) {
                    
                    grid_path[# xt-2,yt] = i;
                    add_point(point_list, xt-2, yt);
                }*/
                // Check if we can fall to 1
                if (grid_path[# xp,yt] == -1 && grid_path[# xp,yt+1] == -1) {
                    // Find where we will fall to
                    var h = ds_grid_height(grid_path) - 1;
                    for (fall_n = fall_n; fall_a != -2 && yt+fall_n < h; fall_n++) {
                        fall_a = grid_path[# xp, yt+fall_n];
                    }
                    // When we find it, fall_n will be 1 too large
                    fall_n --;
                    if (grid_path[# xp,yt+fall_n-1] == -1 && grid_path[# xp, yt+fall_n] == -2) {
                        grid_path[# xp,yt+fall_n-1] = i;
                        add_point(point_list, xp,yt+fall_n-1);
                    }
                }
            //}
        }
        }
    }
    
    // Delete all previous points
    for (var d = 0; d < list_size; d ++) {
        ds_list_delete(point_list, 0);
    }
}


