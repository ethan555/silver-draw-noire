///check_jumping_physics

var landed = false;
//Check our horizontals
if (!place_free(x+xspd,y)) {
    //Find where to go and go there
    var i, xdir, abs_x;
    xdir = sign(xspd);
    abs_x = abs(xspd);
    for (i = 1; i <= abs_x; i ++) {
        if (!place_free(x+i*xdir,y+yspd)) {
            x += (i-1)*xdir;
            xspd = 0;
            break;
        }
    }
}

//Check our diagonals
if (!place_free(x+xspd,y+yspd)) {
    //Find where to go and go there
    var i, ydir, abs_y;
    ydir = sign(yspd);
    abs_y = abs(yspd);
    for (i = 1; i <= abs_y; i ++) {
        if (!place_free(x+xspd,y+i*ydir)) {
            y += (i-1)*ydir;
            yspd = 0;
            landed = true;
            break;
        }
    }
}

if (landed) {
    state_index = IDLE;
    change_sprite(IDLE,0,1);
}

x += xspd;
y += yspd;

