//This would make the icon on the world be the items spirte.
//sprite_index = item.icon;	
switch( state ) {
	case state_lootable.idle:
		image_speed = 0;
		image_index = 0;
	break;
	case state_lootable.opening:
		image_speed = 1;
		if( ceil( image_index ) >= image_number - 1 ) {
			//transition to next state.
			state = state_lootable.opened;
		}
	break;
	case state_lootable.opened:
		image_speed = 0;
		image_index = image_number - 1;
	break;
	case state_lootable.closing:
		image_speed = -1;
		if( ceil( image_index ) <= 1 ) {
			//Go back to closed/idle state & image.
			state = state_lootable.idle;
	break;
	}
}

//If player runs into item, it goes away from word and is "looted" to the player.
if place_meeting( x, y, oPlayer ) && state = state_lootable.opened
	{
	if item_add( item ) == true
		{
		instance_destroy();
		}
}