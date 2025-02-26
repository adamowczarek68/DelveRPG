/// @desc Health Bar

draw_sprite( sHealthBarBackground, 0, healthbar_x, healthbar_y );
//draw_sprite_stretched( sGreenHealthBar, 0, healthbar_x, healthbar_y, min((hp/hp_max) * healthbar_width, healthbar_width), healthbar_height ); 
draw_sprite_stretched( sGreenHealthBar, 0, healthbar_x, healthbar_y, (hp/hp_max) * healthbar_width, healthbar_height ); 
draw_sprite( sHealthBarFrame, 0, healthbar_x, healthbar_y );