///initialize_array(length,number)
var array, i;
var length = argument0;
var number = argument1;

array[length-1] = number;
for (i = 0; i < length; i ++) {
    array[i] = number;
}

return array;
