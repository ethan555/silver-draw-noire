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

//Execute walk state
script_execute(states[WALK], left, right);

//State Changes
if (shift) {
    state = player_shift_state;
    //Make things shifty
    return 0;
}
if (space) {
    state = player_dodge_state;
    change_sprite(DASH,0,1);
    //sprite_state = DASH;
    return 0;
}
if (down) {
    yspd = jspd;
    //state = player_crouch_state;
    //sprite_state = CROUCH;
    change_sprite(CROUCH,0,.25);
    //return 0;
}
if (up || (place_free(x,y+1))) {
    if (up) {
        yspd = -jspd;
    }
    if (yspd < YSPDMAX) yspd ++;
    //state = player_jump_state;
    //sprite_state = JUMP;
    change_sprite(JUMP,0,1);
    //return 0;
}
if (light) {
    state = player_light_state;
    //sprite_state = LIGHT;
    change_sprite(LIGHT,0,1);
    xspd = 0;
    return 0;
}
if (heavy) {
    state = player_heavy_state;
    //sprite_state = HEAVY;
    change_sprite(HEAVY,0,1);
    xspd = 0;
    return 0;
}
if (range) {
    state = player_range_state;
    //sprite_state = RANGE;
    change_sprite(RANGE,0,1);
    xspd = 0;
    return 0;
}
if (interact) {
    //Interact with nearby interactables
    return 0;
}

//If made it through, then we are just moving
check_physics();

