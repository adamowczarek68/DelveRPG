/// @desc Health Bar
var _hpX = oPlayer.x
var _hpY = oPlayer.y

draw_sprite( sHealthBarBackground, 0, _hpX, _hpY );
//draw_sprite_stretched( sGreenHealthBar, 0, healthbar_x, healthbar_y, 
//min((hp/hp_max) * healthbar_width, healthbar_width), healthbar_height ); 
draw_sprite_stretched( sGreenHealthBar, 0, _hpX, _hpY, 
	(hp/hp_max) * healthbar_width, healthbar_height ); 
draw_sprite( sHealthBarFrame, 0, _hpX, _hpY );