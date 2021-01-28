if(global.cur_room==room_index){
	oDungeonGenerator.active_x = total_x;
	oDungeonGenerator.active_y = total_y;
	for(var i = 0; i<=ds_list_size(exits)-1;i++){
		if(exits[| i]!=-4){
			var pos_array = exit_positions[i];
			show_debug_message("Exit Position "+ string(i) + ": " + string(pos_array[0]) + ", " + string(pos_array[1]));
			grid[# pos_array[0], pos_array[1]] = FLOOR;
			orientation = i;
			var dist = 1;
			var x_offset = lengthdir_x(dist,i*90);
			var y_offset = lengthdir_y(dist,i*90);
			while(grid[# pos_array[0]-x_offset,pos_array[1]-y_offset]!=FLOOR){
				grid[# pos_array[0]-x_offset,pos_array[1]-y_offset] = FLOOR;
				dist++;
				x_offset = lengthdir_x(dist,i*90);
				y_offset = lengthdir_y(dist,i*90)
			}
			with(instance_create_layer(pos_array[0]* 64,pos_array[1] *64,"Player",oExit)){
				orientation = i;
				index = oDungeonGenerator.grid[# other.total_x+lengthdir_x(1,i*90),other.total_y+lengthdir_y(1,i*90)];
			}
		}
	}
	for(var _x =0;_x<=grid_width-1;_x++){
		for(var _y = 0;_y<=grid_height-1;_y++){
			tilemap_set(oPlayer.tilemap,0,_x,_y);
			if(grid[# _x,_y]!=FLOOR){
				var north_tile = grid[# _x,_y-1] == -4;
				var west_tile = grid[# _x-1,_y] == -4;
				var east_tile = grid[# _x+1,_y] == -4;
				var south_tile = grid[# _x,_y+1] == -4;
				var tile_index = north_tile * 1 + west_tile * 2 + east_tile * 4 + south_tile * 8 + 1;
				if(tile_index==1) grid[# _x,_y] = FLOOR;
				else tilemap_set(oPlayer.tilemap,tile_index,_x,_y);
			}
		}
	}
}