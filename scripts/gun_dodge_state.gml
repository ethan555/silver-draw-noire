///gun_dodge_state()

//Lateral Movement
if (sprite_index != sprite[DODGE]) {
    change_sprite(DODGE, 0, .25 * time);
}

if (place_free(x,y+1)) {
    if (yspd < YSPDMAX) yspd += GRAVITY;
    state_index = JUMP;
    change_sprite(JUMP,0,0);
    check_jumping_physics();
    if (time == TIME_STANDARD) {trail = false;}
    return 0;
}

xspd = facing * xdodgespd * sign(image_speed);

if (image_speed > 0) {
if (animation_end()) {
    state_index = IDLE;
    if (time == TIME_STANDARD) {trail = false;}
}
} else {
    if (animation_end_reverse()) {
        state_index = IDLE;
        if (time == TIME_STANDARD) {trail = false;}
    }
}

//If made it through, then we are just moving
check_physics();

