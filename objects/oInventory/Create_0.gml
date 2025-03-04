//this is in the Macros Scripts.
rowLength = 6;
inventory = array_create( INVENTORY_SLOTS, -1 );

//Picking up items.
function item_add( _item )
	{
	
	//iterate over all inv slots
	for( var i = 0; i < INVENTORY_SLOTS; i +=1 ){
		//If we find an empty slot then add item to the empty slot.
		if( inventory[i] == -1 ){
		inventory[i] = _item.icon;
		return true;
		}

	}
		//Otherwise if no empty slots, cannot pick up item.
	return false;	
	}