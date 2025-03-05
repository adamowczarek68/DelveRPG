draw_sprite_stretched( sInventory, 0, x-6, y-6, 12 + rowLength * 36, 12 + ((( INVENTORY_SLOTS - 1 ) div rowLength ) + 1 ) * 36 );

for ( var i = 0; i < INVENTORY_SLOTS; i += 1 ) {
	var xx = x + ( i mod rowLength ) * 36 + 2;
	var yy = y + ( i div rowLength ) * 36 + 2;
	var hover = ( oMouseManager.inventoryHover == id ) && ( oMouseManager.slotHover == i );
	draw_sprite( sInventorySlot, hover, xx, yy);
	if( inventory[i] != undefined )	{
		var alpha = 1.0;
		if (oMouseManager.inventoryDrag == id ) && ( oMouseManager.slotHover == i) alpha = 0.5;
		draw_set_alpha( alpha );
		draw_sprite( sItems, inventory[i].icon, xx, yy );
		draw_set_alpha ( 1.0 );
	}
}
	
// Handle right-clicking when a slot is hovered (ie, player is using an item)
if (( oMouseManager.slotHover != -1 ) && mouse_check_button_pressed( mb_right )) {
	var _hoverSlot = oMouseManager.slotHover;
	
	//Does the slot (the mouse is over) have an item.
	if ( inventory[_hoverSlot] != undefined ) {
		var _item = inventory[_hoverSlot];  // save copy of item so we can use it
		// If it is consumable, then remove it.
		// We do this first, because some effects add items back into the
		// inventory and so we want to have an available slot if it is full.
		if ( inventory[_hoverSlot].consume_on_use ) {
			inventory[_hoverSlot] = undefined;
		}
			
		// Use saved copy of item to apply effect.
		_item.effect();
	}
}