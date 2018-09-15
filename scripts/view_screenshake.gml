///view_screenshake(amount, duration)
var amount = argument0;
var duration = argument1;

if (instance_exists(view_parent)) {
    view_parent.screenshake = amount;
    view_parent.alarm[0] = duration;
}
