//Get select item (from the array with loop).
selected_item = -1;
for ( var i = 0; i < array_length( inv ); i++ )
	{
	var _xx = screen_bord;
	var _yy = screen_bord + sep*i;
		
	if mouse_x > _xx && mouse_x < _xx + 8 && mouse_y > _yy && mouse_y < _yy + 8
		{
		selected_item = i;
		}
	}
	
	
	
	
	
if selected_item != -1
	{
		
	//Use an item.
	if mouse_check_button_pressed( mb_left )
		{
		inv[selected_item].effect();	
		}
	
	//Drop an item (if droppable).
	if mouse_check_button_pressed( mb_right ) && inv[selected_item].droppable == true
		{
		array_delete( inv, selected_item, 1 );
		}
	
	}