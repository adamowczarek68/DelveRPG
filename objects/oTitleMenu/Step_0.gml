//get inputs on menu
up_key = keyboard_check_pressed( vk_up );
down_key = keyboard_check_pressed( vk_down );
accept_key = keyboard_check_pressed( vk_space );

//Store number of options in current menu.
op_length = array_length( option[menu_level]);

//movement through the menu (allowing to go from bottom to top and vice versa).
position += down_key - up_key;
if position >= op_length { position = 0 };
if position < 0 { position = op_length - 1 };

//using the options
if accept_key {
	
	var _startMenuLevel = menu_level
	
	switch( menu_level) {
	
		//Pause menu.
		case 0:
			switch( position ){
	
				//Start the game.
				case 0:
					room_goto_next();
					break;
	
				//Open up settings.
				case 1:
				menu_level = 1;
					break;
	
				//Quit the game.
				case 2:
					game_end();
					break;
			}
		break;
	
		//Settings menu.
		case 1:
			switch( position ) {
				//Window size
				case 0:
			
					break;
				//Brightness
				case 1:
				
					break;
				//Controls
				case 2:
			
					break;
				//Back
				case 3:
					menu_level = 0;
					break;
			}
		break;
		}
	
	//Set position on back.
	if _startMenuLevel != menu_level { position = 0 };

	//Correcting the option length.
	op_length = array_length( option[menu_level])
	}