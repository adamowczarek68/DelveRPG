///// @desc Health Bar
var _hpX = oPlayer.x - (oPlayer.sprite_width/2) - 2 //x origin point is bottom center of sprite
var _hpY = oPlayer.y - (oPlayer.sprite_height) - 2 //y origin point is bottom center of sprite

draw_sprite( sHealthBarBackgroundSmall, 0, _hpX, _hpY );
draw_sprite_stretched( sGreenHealthBarSmall, 0, _hpX, _hpY, 
	(oPlayer.hp_current/oPlayer.hp_max) * healthbar_width, healthbar_height ); 
draw_sprite( sHealthBarFrameSmall, 0, _hpX, _hpY );
