//I want to setup a global.font and replace Font 1 with it.
draw_set_font( global.font );

for ( var i = 0; i < array_length( inv ); i++ )
	{
	var _xx = screen_bord;
	var _yy = screen_bord;
	var _sep = sep; //_sep is for separation.
	var _col = c_white;
		
	//Item Icon.	
	draw_sprite( inv[i].icon, 0, _xx, _yy + _sep*i );	
	//draw_sprite( inv[i].icon, 0, camera_get_view_x( view_camera[0] ) + 16, camera_get_view_y( view_camera[0] ) + 16 );

	//If you mouse over the item in the inventory, it will highlight text yellow.
	if selected_item == i { _col = c_yellow };
	draw_set_color( _col );
	
	//Provides the name of the item next to the item icon.
	draw_text ( _xx + 16, _yy + _sep*i, inv[i].name );
	
	//Description text of said item.
	if selected_item == i
		{
		draw_text_ext( _xx, _yy + _sep*array_length( inv ), inv[i].description, 12, 100 );
		}
	
	//Sets text to item in inventory back to white, when you stop mousing over said item.
	draw_set_color ( c_white );
	}