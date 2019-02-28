///check_jumping_physics

var landed = 0;
//Check our horizontals
if (xspd != 0) {
if (!place_free(x+xspd * time,y)) {
    //Find where to go and go there
    var i, xdir, abs_x;
    xdir = sign(xspd);
    abs_x = abs(xspd * time);
    for (i = time; i <= abs_x; i += time) {
        if (!place_free(x+i*xdir,y+yspd * time)) {
            x += (i-1)*xdir;
            xspd = 0;
            break;
        }
    }
}
x += xspd * time;
}

//Check our diagonals
if (yspd != 0) {
if (!place_free(x,y+yspd * time)) {
    //Find where to go and go there
    var i, ydir, abs_y;
    ydir = sign(yspd);
    abs_y = abs(yspd * time);
    for (i = time; i <= abs_y; i += time) {
        if (!place_free(x,y+i*ydir)) {
            y += (i-1)*ydir;
            yspd = 0;
            landed = 1;
            break;
        }
    }
    if (ydir < 0 && landed == 1) {
        landed = 2;
    }
}
y += yspd * time;
}

/*if (!place_free(x,y)) {
    while (!place_free(x,y+yspd)) {
        yspd --;
    }
    y = y+yspd;
    yspd = 0;
    landed = 1;
}*/

if (landed == 1) {
    state_index = IDLE;
    change_sprite(IDLE,0,1);
} else if (landed == 2) {
    //Change to ceiling climb
}


