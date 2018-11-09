///bullet_hit_solid()
// Find place to die
var i;
// Check collisions, Move
var step = 1;
for (i = 0; i < seg_num; i ++) {
    var len = i*step;
    var px = x + lengthdir_x(len, angle);
    var py = y + lengthdir_y(len, angle);
    if (!place_empty(px, py)) {
        part_particles_create(sparks_ps, px, py, sparks_p, irandom(5));
        instance_destroy();
    }
}
