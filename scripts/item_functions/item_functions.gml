//Picking up items.
function item_add( _item )
	{
	
	array_push( oItemManager.inv, _item );
	
	}
	
//Consume item... not sure how to make this work. Move it out of the item Create event.
//function item_remove( _item )
//	{
//	array_delete( inv, selected_item, 1 );
//	}