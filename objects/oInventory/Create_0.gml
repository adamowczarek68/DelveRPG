//this is in the Macros Scripts.
rowLength = 6;
inventory = array_create( INVENTORY_SLOTS, undefined );

// Attempt to add the given item to the inventory, returning true or false on whether it was added successfully.
function item_add( _item ) {
	// iterate over all inv slots
	for( var i = 0; i < INVENTORY_SLOTS; i +=1 ) {
		// If we find an empty slot then add item to the empty slot and stop the loop.
		if( inventory[i] == undefined ){
			inventory[i] = _item;
			return true;
		}
	}
	// Otherwise if no empty slots, cannot pick up item.
	return false;	
}