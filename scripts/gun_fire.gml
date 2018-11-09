///gun_fire(x, y, ammo_type, direction)
var xpos = argument0;
var ypos = argument1;
var ammo_type = argument2;
var shot_dir = argument3;
var xspd, yspd;

var bullet_spread = random_range(-15,15);
var bullet_angle = 0;
if (shot_dir < 0) {
    bullet_angle = 180;
}

bullet_angle += bullet_spread;

switch(ammo_type) {
    case STANDARD :
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
