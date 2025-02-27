xspd = ( oInputManager.keyRight - oInputManager.keyLeft ) * mspd;
yspd = ( oInputManager.keyDown - oInputManager.keyUp ) * mspd;


//Set the sprite of player.
mask_index = sprite[DOWN];
if yspd == 0
	{
	if xspd > 0 { face = RIGHT };
	if xspd < 0 { face = LEFT };
	}
if xspd > 0 && face == LEFT { face = RIGHT };
if xspd > 0 && yspd > 0 {face = DOWNRIGHT};
if xspd < 0 && yspd > 0 {face = DOWNLEFT};
if xspd < 0 && face == RIGHT { face = LEFT };
if xspd == 0
	{
	if yspd > 0 { face = DOWN };
	if yspd < 0 { face = UP };
	}
if yspd > 0 && face == UP { face = DOWN };
if yspd < 0 && xspd > 0 { face = UPRIGHT };
if yspd < 0 && xspd < 0 { face = UPLEFT };
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