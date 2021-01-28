#macro cell_size 64
#macro FLOOR 2
randomise();
grid_height = (1080 div cell_size)+1;
grid_width = 1920 div cell_size;
grid = ds_grid_create(grid_width,grid_height);
ds_grid_set_region(grid,0,0,grid_width,grid_height,-4);
tilemap = noone;

var steps = 1200;
var controller_x = grid_width div 2;
var controller_y = grid_height div 2;
var controller_direction = 0;
var direction_change = 0;
repeat(steps){
	grid[# controller_x,controller_y] = FLOOR;
	direction_change = choose(0,1,2);
	if(direction_change==0){
		var new_controller_direction = irandom(3);
		var ang_diff = abs(angle_difference(new_controller_direction,controller_direction));
		while(new_controller_direction==controller_direction) or (ang_diff==180){
			if(new_controller_direction>=3){
				new_controller_direction = 0;
			}else new_controller_direction++;
		}
		controller_direction = new_controller_direction;
	}
	var _x_direction = lengthdir_x(1, controller_direction * 90);
	var _y_direction = lengthdir_y(1, controller_direction * 90);
	controller_x += _x_direction;
	controller_y += _y_direction;
	if (controller_x < 2 || controller_x >= grid_width - 1) {
		controller_x -= _x_direction * 2;
	}
	if (controller_y < 2 || controller_y >= grid_height-2) {
		controller_y -= _y_direction * 2;
	}
}

exit_positions = [[grid_width,grid_height div 2], [grid_width div 2,0], [0,grid_height div 2], [grid_width div 2,grid_height-1]];
