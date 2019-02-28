///check_physics

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
            break;
        }
    }
}
y += yspd * time;
}

