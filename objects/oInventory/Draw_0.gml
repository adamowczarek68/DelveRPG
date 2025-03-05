var bounds = get_bounds();

draw_sprite_stretched( sInventory, 0, bounds[0]-6, bounds[1]-6, bounds[2]-bounds[0], bounds[3]-bounds[1] );

for ( var i = 0; i < INVENTORY_SLOTS; i += 1 ) {
	var xx = bounds[0] + ( i mod rowLength ) * slotSize + 2;
	var yy = bounds[1] + ( i div rowLength ) * slotSize + 2;
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
	
		
	//If the mouse is over a slot AND they Right click.
if( oMouseManager.slotHover != -1 ) && mouse_check_button ( mb_right ){
	var _hoverSlot = oMouseManager.slotHover;
	
	//Does the slot (the mouse is over) have an item.
	if ( inventory[_hoverSlot] != undefined ){
		
		//Then apply effect.
		inventory[_hoverSlot].effect();
		
		//If it is consumable, then remove it.
		if ( inventory[_hoverSlot].consume_on_use ){
			inventory[_hoverSlot] = undefined;
		}
	}
}
