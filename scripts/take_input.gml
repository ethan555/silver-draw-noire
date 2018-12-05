///take_input

///Take input
left = keyboard_check(vk_left);
right = keyboard_check(vk_right);
up = keyboard_check(vk_up);
up_pressed = keyboard_check_pressed(vk_up);
down = keyboard_check(vk_down);

space = keyboard_check_pressed(vk_space);
shift = keyboard_check_pressed(vk_shift);

light = keyboard_check_pressed(ord('A'));
heavy = keyboard_check_pressed(ord('S'));
range = keyboard_check_pressed(ord('D'));
special = keyboard_check_pressed(ord('F'));

walk = keyboard_check_pressed(ord('Z'));

interact = keyboard_check_pressed(ord('E'));
