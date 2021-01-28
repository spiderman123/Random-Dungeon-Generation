for(var _x = 0; _x <grid_width; _x++){
	for(var _y = 0; _y <grid_height; _y++){
		if(grid[# _x,_y]==-4) draw_rectangle(_x*32,_y*32,_x*32 + 32, _y *32 + 32, false);
		else {
			draw_rectangle(_x*32,_y*32,_x*32 + 32, _y *32 + 32, true);
			draw_text(_x*32+16,_y*32+16,grid[# _x,_y]);
		}
		if(_x==active_x) and (_y==active_y) draw_circle(_x*32+16,_y*32+16,16,false);
	}
}

draw_text(500, 100, global.cur_room);