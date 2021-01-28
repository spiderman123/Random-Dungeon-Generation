#macro ROOM 3
randomise();
grid_height = 6;
grid_width = 6;
grid = ds_grid_create(grid_width,grid_height);
ds_grid_set_region(grid,0,0,grid_width,grid_height,-4);
var steps = 20;
tilemap = layer_tilemap_get_id("Tile");

var controller_x = 3;
var controller_y = 3;
var controller_direction = 0;
var direction_change = 0;

repeat(steps){
	grid[# controller_x,controller_y] = ROOM;
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
	if (controller_x < 1 || controller_x >= grid_width - 1) {
		controller_x -= _x_direction * 1;
	}
	if (controller_y < 1 || controller_y >= grid_height - 1) {
		controller_y -= _y_direction * 1;
	}
}

active_x = -4;
active_y = -4;

exits = ds_list_create();
room_count = 0;
for(var _x =1;_x<grid_width;_x++){
	for(var _y = 1;_y<grid_height;_y++){
		if(grid[# _x,_y]!=-4){
			grid[# _x,_y] = room_count;
			room_count++;
		}
	}
}

for(var _x =1;_x<grid_width;_x++){
	for(var _y = 1;_y<grid_height;_y++){
		if(grid[# _x,_y]!=-4){
			var east_tile = grid[# _x+1,_y];
			var north_tile = grid[# _x,_y-1];
			var west_tile = grid[# _x-1,_y];
			var south_tile = grid[# _x,_y+1];
			ds_list_add(exits, east_tile,north_tile,west_tile,south_tile);
			with(instance_create_layer(0,0,"Player",oGrid)){
				total_x = _x;
				total_y = _y;
				room_index = other.grid[# _x,_y];
				exits = ds_list_create();
				ds_list_copy(exits, other.exits);
			}
			ds_list_clear(exits);
		}
	}
}

