//Get player inputs.
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

iskeyUpPressed = keyboard_check_pressed( ord( "W" )) || keyboard_check_pressed( vk_up );
iskeyLeftPressed = keyboard_check_pressed( ord( "A" )) || keyboard_check_pressed( vk_left );
iskeyDownPressed = keyboard_check_pressed( ord( "S" )) || keyboard_check_pressed( vk_down );
iskeyRightPressed = keyboard_check_pressed( ord( "D" )) || keyboard_check_pressed( vk_right );

#region Corbin's direction crap.
//If direction has just been pressed, forget the opposite direction is being held down
if( iskeyLeftPressed ) {
    keyboard_clear( ord( "D" ));
    keyboard_clear( vk_right );
}
if( iskeyRightPressed ) {
    keyboard_clear( ord( "A" ));
    keyboard_clear( vk_left );
}
if( iskeyUpPressed ) {
    keyboard_clear( ord( "S" ));
    keyboard_clear( vk_down );
}
if( iskeyDownPressed ) {
    keyboard_clear( ord( "W" ));
    keyboard_clear( vk_up );
}
#endregion

xspd = ( keyRight - keyLeft ) * mspd;
yspd = ( keyDown - keyUp ) * mspd;


//Set the sprite of player.
mask_index = sprite[DOWN];
if yspd == 0
	{
	if xspd > 0 { face = RIGHT };
	if xspd < 0 { face = LEFT };
	}
if xspd > 0 && face == LEFT { face = RIGHT };
if xspd < 0 && face == RIGHT { face = LEFT };
if xspd == 0
	{
	if yspd > 0 { face = DOWN };
	if yspd < 0 { face = UP };
	}
if yspd > 0 && face == UP { face = DOWN };
if yspd < 0 && face == DOWN { face = UP };
sprite_index = sprite[face];


//This is the collisions.
if place_meeting( x + xspd, y, oWall ) == true
	{
	xspd = 0;
	}
if place_meeting( x, y + yspd, oWall ) == true
	{
	yspd = 0;
	}

x += xspd;
y += yspd;





//Animation of the player sprite.
if xspd == 0 && yspd == 0
	{
	image_index = 0;
	}