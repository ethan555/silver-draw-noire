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
var hspd = xmaxspd * hdir;

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
} else {
    xspd -= sign(xspd);
}
//State Changes
if (shift) {
    state = player_shift_state;
    //Make things shifty
    return 0;
}
if (space) {
    state = player_dodge_state;
    sprite_state = DASH;
    return 0;
}
if (crouch) {
    state = player_crouch_state;
    sprite_state = CROUCH;
    return 0;
}
if (up) {
    state = player_jump_state;
    sprite_state = JUMP;
    return 0;
}
if (light) {
    state = player_light_state;
    sprite_state = LIGHT;
    xspd = 0;
    return 0;
}
if (heavy) {
    state = player_heavy_state;
    sprite_state = HEAVY;
    xspd = 0;
    return 0;
}
if (range) {
    state = player_range_state;
    sprite_state = RANGE;
    xspd = 0;
    return 0;
}
if (interact) {
    //Interact with nearby interactables
    return 0;
}
//


