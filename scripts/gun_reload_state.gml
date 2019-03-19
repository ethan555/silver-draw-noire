///gun_reload_state

//Directions
var left = input.left;
var right = input.right;
//Reload button cancels reload
var reload = input.reload;

// Fall if there's no floor
if (place_free(x,y+1)) {
    if (yspd < YSPDMAX) yspd += GRAVITY;
    time = TIME_STANDARD;
    state_index = JUMP;
    change_sprite(JUMP,0,0);
    check_jumping_physics();
    return 0;
}

// If the ammo has landed on a solid index, we can rotate it
if (frac(ammo_index) == 0) {
if ((left || right) && !(left && right)) {
    if (left) {
        ammo_dir = .125;
    } else if (right) {
        ammo_dir = -.125;
    }
    ammo_index = (modulo(ammo_index + ammo_dir, 6));
}
} else {
    ammo_index = (modulo(ammo_index + ammo_dir, 6));
    if (frac(ammo_index) == 0) {ammo_dir = 0;}
}

// Set ourselves back to the normal state
if (reload) {
    image_speed = 0;
    state_index = IDLE;
    if (!trail) {time = TIME_STANDARD; trailtimer = 0;}
}

