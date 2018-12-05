#define gun_stairs_enter_state
///gun_stairs_enter_state()
if (stairs_dest == noone) {state_index = IDLE; change_sprite(IDLE,0,1); return 0;}

if (sprite_index != sprite[STAIRS_ENTER]) {change_sprite(STAIRS_ENTER,0,.25);}

xspd = 0;
x += image_speed * 4 * facing;
image_alpha = 1 - image_index/(image_number - 1);

if (animation_end()) {
    image_speed = 0;
    draw = false;
    x = stairs_dest.x;
    y = stairs_dest.y;
    alarm[0] = round(stairs_dist/10);
}

if (alarm[0] == 0) {
    x = stairs_dest.x;
    y = stairs_dest.y;
    change_sprite(STAIRS_EXIT,0,.25);
    state_index = STAIRS_EXIT;
    draw = true;
}

#define gun_stairs_exit_state
///gun_stairs_exit_state()

if (sprite_index != sprite[STAIRS_EXIT]) {change_sprite(STAIRS_EXIT,0,.25);}

x -= image_speed * 4 * facing;
image_alpha = image_index/(image_number - 1);

if (animation_end()) {
    state_index = IDLE; change_sprite(IDLE,0,1);
    facing = -1 * facing;
}
