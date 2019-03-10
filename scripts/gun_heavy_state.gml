///gun_heavy_state()

// Heavy animation
if (sprite_index != sprite[HEAVY]) {
    change_sprite(HEAVY, 0, .25 * time);
}

xspd = xspdmax * facing;

if (animation_end()) {
    image_speed = 0;
    state_index = IDLE;
}

//If made it through, then we are just moving
check_player_physics();

