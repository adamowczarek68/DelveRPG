draw_sprite_stretched( sInventory, 0, x-6, y-6, 12 + rowLength * 36, 12 + ((( INVENTORY_SLOTS - 1 ) div rowLength ) + 1 ) * 36 );

for ( var i = 0; i < INVENTORY_SLOTS; i += 1 )
	{
	var xx = x + ( i mod rowLength ) * 36 + 2;
	var yy = y + ( i div rowLength ) * 36 + 2;
	var hover = ( oMouseManager.inventoryHover == id ) && ( oMouseManager.slotHover == i )
	draw_sprite( sInventorySlot, hover, xx, yy)
	if( inventory[i] != undefined )
		{
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
		inventory[_hoverSlot].effect ();
		
			//If it is consumable, then remove it.
			if ( inventory[_hoverSlot].consume_on_use ){
			inventory[_hoverSlot] = undefined;
			}
		}
	}
		
		
		
		//If it is consumable, then remove it.
		