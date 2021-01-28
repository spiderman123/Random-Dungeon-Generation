var h_move = keyboard_check_direct(ord("D")) - keyboard_check_direct(ord("A"));
var v_move = keyboard_check_direct(ord("S")) - keyboard_check_direct(ord("W"));

if(h_move!=0){
	hsp += accel * h_move;
	hsp = clamp(hsp,-max_speed,max_speed);
}else{
	if(hsp>decel){
		hsp -= decel;
	}else if(hsp<-decel){
		hsp += decel;
	}else{
		hsp = 0;
	}
}

if(v_move!=0){
	vsp += accel * v_move;
	vsp = clamp(vsp,-max_speed,max_speed);
}else{
	if(vsp>decel){
		vsp -= decel;
	}else if(vsp<-decel){
		vsp += decel;
	}else{
		vsp = 0;
	}
}

move_and_contact(tilemap);