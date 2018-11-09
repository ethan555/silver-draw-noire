///gun_fire_player(x, y, ammo_type, direction)
var xpos = argument0;
var ypos = argument1;
var ammo_type = argument2;
var shot_dir = argument3;

var spread = 2;
var bullet_spread = random_range(-spread, spread);
var bullet_dir = 0;
if (shot_dir < 0) {
    bullet_dir = 180;
}

var bullet_angle = bullet_dir + bullet_spread;

var bullet;

switch(ammo_type) {
    case STANDARD :
        bullet = instance_create(xpos, ypos, bullet_player);
        with (bullet) {
            set_bullet_speed(BULLET_SPEED, bullet_angle);
        }
        break;
    case PIERCE :
        break;
    case SHOTGUN :
        break;
    case BOUNCE :
        break;
    case GRENADE :
        break;
    default :
        break;
}
