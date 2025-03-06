///State machine for mouse.
inventoryHover = -1;
slotHover = -1;
inventoryDrag = -1;
slotDrag = -1;
itemDrag = -1;

mouseOver = function()
	{
	//empty hover results
	slotHover = -1;
	inventoryHover = -1;
	
	//mouse coordinates
	var mx = mouse_x;
	var my = mouse_y;
	
	//check for inventory slot hover
	with ( oInventory )	{
		var bounds = get_bounds();
		
		if ( point_in_rectangle( mx, my, bounds[0], bounds[1], bounds[2], bounds[3] ) )	{
			//check for mouseover in each slot
			for ( var i = 0; i < INVENTORY_SLOTS; i += 1 )
				{
				var xx = bounds[0] + ( i mod rowLength ) * 36 + 2;
				var yy = bounds[1]  + ( i div rowLength ) * 36 + 2;
				if ( point_in_rectangle( mx, my, xx, yy, xx + 32, yy + 32 ) )
					{
					other.slotHover = i; //other bc we are in a with statement
					other.inventoryHover = id;
					}
				}
			}
		}
	}


stateFree = function()
	{
	mouseOver();
	//Start to drag an item if slot is not empty
	if ( mouse_check_button ( mb_left ) ) && ( slotHover != -1 ) && ( inventoryHover.inventory[slotHover] != -1 )
		{
		//Enter the drag state.
		state = stateDrag;
//		itemDrag = inventoryHover.inventory[slotHover];
		inventoryDrag = inventoryHover;
		slotDrag = slotHover;
		}
	}
	
stateDrag = function()
	{
	mouseOver();
	if ( !mouse_check_button ( mb_left ) )
		{
		//Swap with slot if hovering
		if ( slotHover != -1 ) InventorySwap( inventoryDrag, slotDrag, inventoryHover, slotHover )
		
		//Return to the free state
		state = stateFree;
//		itemDrag = -1;
		inventoryDrag = -1;
		slotDrag = -1;
		}
	}
	
state = stateFree;