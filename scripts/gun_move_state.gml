///gun_move_state

//Directions
var left = input.left;
var right = input.right;
//Jump
var up = input.up;
//Crouch
var down = input.down;

//Jump
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
    change_sprite(WALK,-1,.125 * time);
} else {
    change_sprite(IDLE,0,1 * time);
    var sig = sign(xspd);
    xspd -= xslowspd*sig * time;
    if (sign(xspd) != sig) {xspd = 0;}
}

//State Changes
if (shift) {
    //state_index = SPECIAL;
    //Make things shifty
    if (application_shader == invert_sh) {application_shader = noone;}
    else {application_shader = invert_sh;}
    if (time == TIME_SHIFT) {time = TIME_STANDARD;}
    else {time = TIME_SHIFT; trail = true;}
    return 0;
}
if (special) {
    if (up) {
        //Jump
        yspd = -jspd;
        state_index = JUMP;
        change_sprite(JUMP,0,0);
    } else if (down) {
        //Dive
        
    } else if (hspd != 0) {
        //Directional dodge
        state_index = DODGE;
        change_sprite(DODGE,0,.25*time);
        xspd = xdodgespd * facing;
        trail = true;
    } else if (hspd == 0) {
        //Backdodge
        state_index = DODGE;
        change_sprite(DODGE,sprite_get_number(sprite[DODGE]) - 2,-.25*time);
        xspd = xdodgespd * facing * -1;
        trail = true;
    }
    return 0;
}
if (place_free(x,y+1)) {
    if (yspd < YSPDMAX) yspd += GRAVITY;
    state_index = JUMP;
    change_sprite(JUMP,0,0);
    check_jumping_physics();
    return 0;
}
if (down) {
    //yspd = jspd;
    xspd = 0;
    state_index = CROUCH;
    change_sprite(CROUCH,0,.25 * time);
    return 0;
}
if (light) {
    state_index = LIGHT;
    //sprite_state = LIGHT;
    change_sprite(LIGHT,0,1 * time);
    xspd = 0;
    return 0;
}
if (heavy) {
    state_index = HEAVY;
    //sprite_state = HEAVY;
    change_sprite(HEAVY,0,1 * time);
    xspd = 0;
    return 0;
}
if (range) {
    state_index = RANGE;
    //sprite_state = RANGE;
    change_sprite(RANGE,0,.35 * time);
    xspd = 0;
    return 0;
}

if (interact) {
    //Interact with nearby interactables
    return 0;
}

//If made it through, then we are just moving
check_physics();

