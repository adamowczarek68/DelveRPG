//Picking up items.
function item_add( _item )
	{
	
	var _pickup = false;
	
	if array_length( oInventory.inventory ) < INVENTORY_SLOTS
		{
		array_push( oInventory.inventory, _item );
		_pickup = true;
		}
		
	return _pickup;	
		
	}
	
//Consume item... not sure how to make this work. Move it out of the item Create event.
//function item_remove( _item )
//	{
//	array_delete( inv, selected_item, 1 );
//	}