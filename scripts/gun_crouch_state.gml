///gun_crouch_state()
//Directions
var left = input.left;
var right = input.right;
//Jump
var up = input.up;
//Crouch
var down = input.down;

//Dodge
var space = input.space;
//Phase Shift
var shift = input.shift;
//Actions
var light = input.light;
var heavy = input.heavy;
var range = input.range;
var special = input.special;
var interact = input.interact;

//Lateral facing direction
var hdir = (right - left);

if (hdir != 0) {
    facing = hdir;
}
if (!down) {
    state_index = IDLE;
    change_sprite(IDLE,0,1);
} else {
    if (image_speed > 0) {
        if (animation_end()) {
            image_speed = 0;
            image_index = image_number-1;
        }
    }
}

