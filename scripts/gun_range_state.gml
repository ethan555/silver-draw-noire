///gun_range_state
// Available actions
var range = input.range;
// Stop, shoot
xspd = 0;

if (place_free(x,y+1)) {
    if (yspd < YSPDMAX) yspd += GRAVITY;
    state_index = JUMP;
    change_sprite(JUMP,0,0);
    check_jumping_physics();
    return 0;
}

if (frac(ammo_index) == 0) {
if (sprite_index != sprite[RANGE]) {
    change_sprite(sprite[RANGE], 0, .5 * time);
}

if (animation_hit_frame(2)) {
    gun_fire_player(x + 12*image_xscale, y /*- image_yscale*/, ammo[ammo_index], image_xscale);
    ammo[ammo_index] = EMPTY;
    //ammo_index = modulo(ammo_index + 1, ammo_cylinder);
    ammo_dir = .125
    ammo_index += ammo_dir;
}
} else {
    ammo_index = (modulo(ammo_index + ammo_dir, 6));
    if (frac(ammo_index) == 0) {ammo_dir = 0;}
}

if (image_index > 2) {
    if (range) {
        image_index = 1;
    }
}

if (animation_end()) {
    //change_sprite(IDLE,0,1 * time);
    image_speed = 0;
    state_index = IDLE;
}
