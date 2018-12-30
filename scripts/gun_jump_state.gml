///gun_jump_state
//Directions
var left = input.left;
var right = input.right;
//Jump
var up_pressed = input.up_pressed;
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
//Lateral facing direction and movement
var hdir = (right - left);
var hspd = xjspdmax * hdir;

//Lateral Movement
if (hdir != 0) {
    xspd = hspd;
} else {
    //xspd -= xslowspd*sign(xspd);
}

if (place_free(x,y+1)) {
    if (yspd < YSPDMAX) yspd += GRAVITY * time;
    state_index = JUMP;
    image_index = sign(round(yspd/4))+1;
}

//If made it through, then we are just falling
check_jumping_physics();
