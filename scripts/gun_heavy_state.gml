///gun_heavy_state()

// Heavy animation
if (sprite_index != sprite[HEAVY]) {
    change_sprite(HEAVY, 0, .25 * time);
}

if (image_index < 2) {
    xspd = 0;//xwalkspdmax * facing;
} else if (image_index < 5) {
    xspd = xspdmax * facing;
} 

if (animation_end()) {
    xspd = xwalkspdmax * facing;
    image_speed = 0;
    state_index = IDLE;
}

//If made it through, then we are just moving
check_player_physics();

