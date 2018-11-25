///trail_add(sprite,index,xpos,ypos,xscale,yscale,rot,blend,alpha)
var sprite = argument0;
var index = argument1;
var xpos = argument2;
var ypos = argument3;
var xscale = argument4;
var yscale = argument5;
var rot = argument6;
var blend = argument7;
var alpha = argument8;

var afterimage = ds_map_create();

afterimage[? "sprite"] = sprite;
afterimage[? "index"] = index;
afterimage[? "xpos"] = xpos;
afterimage[? "ypos"] = ypos;
afterimage[? "xscale"] = xscale;
afterimage[? "yscale"] = yscale;
afterimage[? "rot"] = rot;
afterimage[? "blend"] = blend;
afterimage[? "alpha"] = alpha;

with (trail_drawer) {
    ds_list_add(trail_list, afterimage);
    ds_list_mark_as_map(trail_list, ds_list_size(trail_list) - 1);
}
