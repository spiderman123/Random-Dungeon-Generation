global.cur_room = 0;
#macro tile_size 64
function tile_collide(tilemap){
	var collide = false;
	for(var i = 1;i<argument_count;i++){
		var points = argument[i];
		collide = collide || tilemap_get_at_pixel(tilemap,points[0],points[1]);
	}
	return collide;
}

function move_and_contact(tilemap){
	x += hsp;
	if(hsp>decel){
		var tile_right = tile_collide(tilemap,[bbox_right-1,bbox_bottom-1],[bbox_right-1,bbox_top]);
		if(tile_right){
			x = bbox_right&~(tile_size-1);
			x -= bbox_right-x;
			hsp = 0;
		}
	}else if(hsp<-decel){
		var tile_left = tile_collide(tilemap,[bbox_left,bbox_bottom-1],[bbox_left,bbox_top]);
		if(tile_left){
			x = bbox_left&~(tile_size-1);
			x += tile_size+x-bbox_left;
			hsp = 0;
		}
	}
	y += vsp;
	if(vsp>decel){
		var tile_bottom = tile_collide(tilemap,[bbox_right-1,bbox_bottom-1],[bbox_left,bbox_bottom-1]);
		if(tile_bottom){
			y = bbox_bottom&~(tile_size-1);
			y -= bbox_bottom-y;
			vsp = 0;
		}
	}else if(vsp<-decel){
		var tile_top = tile_collide(tilemap,[bbox_right-1,bbox_top],[bbox_left,bbox_top]);
		if(tile_top){
			y = bbox_top&~(tile_size-1);
			y += tile_size+y-bbox_top;
			vsp = 0;
		}
	}
}