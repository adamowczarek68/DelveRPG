//This would make the icon on the world be the items spirte.
//sprite_index = item.icon;

//If player runs into item, it goes away from word and is "looted" to the player.
if place_meeting( x, y, oPlayer )
	{
	item_add( item );
	instance_destroy();
	}