//this is in the Macros Scripts.
rowLength = 6;
inventory = array_create( INVENTORY_SLOTS, undefined );
visible = true;
slotSize = 36;

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

// returns the bounds (top-left x, top-left y, bottom-right x, bottom-right y) of the inventory
function get_bounds() {
	var top_left_x = camera_get_view_x(view_camera[0]);
	var top_left_y = camera_get_view_y(view_camera[0]);

	var bot_right_x = top_left_x + 12 + (rowLength * slotSize);
	var bot_right_y = top_left_y + 12 + (((INVENTORY_SLOTS - 1) div rowLength) + 1) * slotSize;

	var coords = [ top_left_x, top_left_y, bot_right_x, bot_right_y ];
	return coords;
}