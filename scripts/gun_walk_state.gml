///gun_walk_state(left, right)
//Directions
var left = argument0;
var right = argument1;
//Lateral facing direction and movement
var hdir = (right - left);
var hspd = xspdmax * hdir;

//Lateral Movement
if (hdir != 0) {
    facing = hdir;
    xspd = hspd;
    //sprite_state = WALK;
    change_sprite(WALK,-1,.25);
} else {
    change_sprite(IDLE,0,1);
    xspd -= sign(xspd);
}
