///gun_range_state

// Stop, shoot
xspd = 0;
if (sprite_index != sprite[RANGE]) {
    change_sprite(sprite[RANGE], 0, .4);
}

if (animation_hit_frame(2)) {
    gun_fire_player(x + 12*image_xscale, y - 1*image_yscale, ammo[ammo_index], image_xscale);
    ammo[ammo_index] = EMPTY;
    ammo_index = modulo(ammo_index + 1, ammo_cylinder);
}

if (animation_end()) {
    state = player_move_state;
}
