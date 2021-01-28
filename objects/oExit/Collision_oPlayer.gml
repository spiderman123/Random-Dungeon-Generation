global.cur_room = index;
room_restart();
switch(orientation){
	case 0:
	_x = 64;
	_y = oPlayer.y;
	break;
	case 1:
	 _x = oPlayer.x;
	 _y = room_height-96;
	break;
	case 2:
	 _x = room_width-96;
	 _y = oPlayer.y;
	break;
	case 3:
	 _x = oPlayer.x;
	 _y = 64;
	break;
}
oPlayer.x = _x;
oPlayer.y = _y;
instance_destroy(oExit)
