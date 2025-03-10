//Get inputs
keyUp = keyboard_check( ord( "W" )) || keyboard_check( vk_up );
keyLeft = keyboard_check( ord( "A" )) || keyboard_check( vk_left );
keyDown = keyboard_check( ord( "S" )) || keyboard_check( vk_down );
keyRight = keyboard_check( ord( "D" )) || keyboard_check( vk_right );
keyJump = keyboard_check( vk_space );
keyActionButton1 = keyboard_check( ord( "1" ) );
keyActionButton2 = keyboard_check( ord( "2" ) );
keyActionButton3 = keyboard_check( ord( "3" ) );
keyActionButton4 = keyboard_check( ord( "4" ) );
keyActionButton5 = keyboard_check( ord( "Q" ) );
keyActionButton6 = keyboard_check( ord( "E" ) );
keyActionButton7 = keyboard_check( ord( "R" ) );
keyActionButton8 = keyboard_check( ord( "F" ) );
keyActionButton9 = keyboard_check( ord( "Z" ) );
keyActionButton10 = keyboard_check( ord( "X" ) );
keyActionButton11 = keyboard_check( ord( "C" ) );
keyActionButton12 = keyboard_check( ord( "V" ) );
keyToggleInventory = keyboard_check_pressed( ord( "B" ) );
keyToggleHealthBar = keyboard_check_pressed( ord( "P" ) );

isKeyUpPressed = keyboard_check_pressed( ord( "W" )) || keyboard_check_pressed( vk_up );
isKeyLeftPressed = keyboard_check_pressed( ord( "A" )) || keyboard_check_pressed( vk_left );
isKeyDownPressed = keyboard_check_pressed( ord( "S" )) || keyboard_check_pressed( vk_down );
isKeyRightPressed = keyboard_check_pressed( ord( "D" )) || keyboard_check_pressed( vk_right );

#region Corbin's direction crap.
//If direction has just been pressed, forget the opposite direction is being held down
if( isKeyLeftPressed ) {
    keyboard_clear( ord( "D" ));
    keyboard_clear( vk_right );
}
if( isKeyRightPressed ) {
    keyboard_clear( ord( "A" ));
    keyboard_clear( vk_left );
}
if( isKeyUpPressed ) {
    keyboard_clear( ord( "S" ));
    keyboard_clear( vk_down );
}
if( isKeyDownPressed ) {
    keyboard_clear( ord( "W" ));
    keyboard_clear( vk_up );
}
#endregion


#region Toggles
if (keyToggleHealthBar) {
	oHealthBar.visible = !oHealthBar.visible;
}

if (keyToggleInventory) {
	oInventory.visible = !oInventory.visible;
}
#endregion