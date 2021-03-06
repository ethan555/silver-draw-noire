///player_move_state

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
//Lateral facing direction and movement
var hdir = (right - left);
var hspd = xspdmax * hdir;

/* Order of Actions:
 * hspd - Direction of dodge, attacks, etc.
 * shift > space > crouch > up - dodge takes priority
 * light > range > range > special - attack order
 * interact - interaction takes lowest priority
 */

//Lateral Movement
if (hdir != 0) {
    facing = hdir;
    xspd = hspd;
    //sprite_state = WALK;
    change_sprite(WALK,-1,.125);
} else {
    change_sprite(IDLE,0,1);
    xspd -= xslowspd*sign(xspd);
}

//State Changes
if (shift) {
    state_index = SPECIAL;
    //Make things shifty
    return 0;
}
if (space) {
    state_index = DODGE;
    change_sprite(DODGE,0,1);
    //sprite_state = DODGE;
    return 0;
}
if (down) {
    yspd = jspd;
    state_index = CROUCH;
    //sprite_state = CROUCH;
    change_sprite(CROUCH,0,.25);
    //return 0;
}
if (up || (place_free(x,y+1))) {
    if (up) {
        yspd = -jspd;
    }
    if (yspd < YSPDMAX) yspd += GRAVITY;
    state_index = JUMP;
    change_sprite(JUMP,0,1);
    //return 0;
}
if (light) {
    state_index = LIGHT;
    //sprite_state = LIGHT;
    change_sprite(LIGHT,0,1);
    xspd = 0;
    return 0;
}
if (heavy) {
    state_index = HEAVY;
    //sprite_state = HEAVY;
    change_sprite(HEAVY,0,1);
    xspd = 0;
    return 0;
}
if (range) {
    state_index = RANGE;
    //sprite_state = RANGE;
    change_sprite(RANGE,0,.25);
    xspd = 0;
    return 0;
}
if (interact) {
    //Interact with nearby interactables
    return 0;
}

//If made it through, then we are just moving
check_physics();

