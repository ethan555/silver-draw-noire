///player_interact()
var interact = instance_place(x,y,interactable_parent);
if (interact == noone) {return -1;}

var type = interact.object_index;
switch (type) {
    case stairs :
        interact = interact.partner;
        if (interact != noone) {
            //x = interact.x;
            //y = interact.y;
            stairs_dest = interact;
            stairs_dist = abs(interact.y - y);
            state_index = STAIRS_ENTER;
            change_sprite(STAIRS_ENTER,0,.25);
            facing = sign(interact.x - x);
            if (facing == 0) {facing = 1;}
        }
        break;
    default:
        break;
}
