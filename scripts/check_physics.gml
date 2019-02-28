///check_physics

//Check our horizontals
if (xspd != 0) {
    if (!place_free(x+xspd,y)) {
        //Find where to go and go there
        while (!place_free(x+sign(xspd), y)) {
            x += sign(xspd);
        }
        xspd = 0;
    }
    x += xspd * time;
}

//Check our diagonals
if (yspd != 0) {
    if (!place_free(x,y+yspd)) {
        //Find where to go and go there
        while (!place_free(x, y+sign(yspd))) {
            y += sign(yspd);
        }
        yspd = 0;
    }
    y += yspd * time;
}

