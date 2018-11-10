#define draw_gui_player
///draw_gui_player(gui_type)
var gui_type = argument0;

if (gui_type == GUN) {
    //Draw gun-specific UI
    if (instance_exists(player_gun))
        draw_gui_gun();
} else if (gui_type == SWORD) {
    //Draw sword-specific UI
    if (instance_exists(player_sword))
        draw_gui_sword();
}


#define draw_gui_gun
///draw_gui_gun()

var ammo = player_gun.ammo;
var ammo_index = player_gun.ammo_index;

var cx = 80;
var cy = view_hview[0] - 80;
draw_sprite_ext(revolver_cylinder_sp, 0, cx, cy,
    1, 1, 0/*ammo_index*60*/, image_blend, image_alpha);

var i, sprite = -1, angle;
for (i = 0; i < 6; i ++) {
    switch(ammo[i]) {
        case STANDARD:
            sprite = ammo_standard_sp; break;
        case PIERCE:
            sprite = ammo_pierce_sp; break;
        case SHOTGUN:
            sprite = ammo_shotgun_sp; break;
        case BOUNCE:
            sprite = ammo_bounce_sp; break;
        case GRENADE:
            sprite = ammo_grenade_sp; break;
        default:
    }
    angle = 90 + ammo_index*60 - i*60;
    if (i == ammo_index) {
        draw_sprite_ext(ammo_selected_sp,0,cx + lengthdir_x(44, angle), cy + lengthdir_y(44, angle),
            1, 1, 0/*angle - 90*/, image_blend, image_alpha);
    } else {
        draw_sprite_ext(ammo_unselected_sp,0,cx + lengthdir_x(44, angle), cy + lengthdir_y(44, angle),
            1, 1, 0/*angle - 90*/, image_blend, image_alpha);
    }
    if (sprite != -1) {
        draw_sprite_ext(sprite, 0, cx + lengthdir_x(44, angle), cy + lengthdir_y(44, angle),
            1, 1, 0/*angle - 90*/, image_blend, image_alpha);
    }
}


#define draw_gui_sword
///draw_gui_sword()