///gun_light_state()

// Punch animation
if (sprite_index != sprite[LIGHT]) {
    change_sprite(LIGHT, 0, .25 * time);
}

// Check for falling
if (place_free(x,y+1)) {
    if (yspd < YSPDMAX) yspd += GRAVITY;
    state_index = JUMP;
    change_sprite(JUMP,0,0);
    check_jumping_physics();
    return 0;
}

xspd = 0;

// Return to idle state
if (animation_end()) {
    image_speed = 0;
    image_index = 0;
    state_index = IDLE;
}

