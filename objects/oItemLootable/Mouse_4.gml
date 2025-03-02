if( state == state_lootable.idle ) && distance_to_object( oPlayer ) < 20 {
	state = state_lootable.opening;
	}
	
if( state == state_lootable.opened ) && distance_to_object( oPlayer ) < 20 {
	state = state_lootable.closing;
	}