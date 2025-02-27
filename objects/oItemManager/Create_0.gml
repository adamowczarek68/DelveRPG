depth = -9999;

global.font = draw_set_font( Font1 );


//This will creating our item constructor.
function create_item( _name, _desc, _icon, _effect ) constructor
	{
	name = _name;
	description = _desc;
	icon = _icon;
	effect = _effect;
	//ilvl = ilvl;
	//idnum = _id;
	}




//Create the items. We will be utilzing structs.
global.item_list = 
	{
		
	foodBuffItem : new create_item(
		"FBI1",
		"Recovers health and grants buff?",
		sYellowSwirly,
		
		function()
			{
			oPlayer.hp_current = min( oPlayer.hp_max, oPlayer.hp_current + 10); //This "clamps" the HP.
			
			//Consume the item.
			array_delete( inv, selected_item, 1 );
			}
		
		),
		
	bomb : new create_item(
		"Bomb",
		"Make big boom.",
		sBomb,
		
		function()
		//~51:20 https://www.youtube.com/watch?v=fa26B54JDDk&t=2554s for Bomb Count associated with oPlayer.
			{
			instance_create_depth( oPlayer.x, oPlayer.y, 0, oBombTool );
			
			//Consume the item.
			array_delete( inv, selected_item, 1 );
			}
		),

	}
	
	
//Create the Inventory
inv = array_create( 0 );

	
	
//How to select an item.
selected_item = -1;
		
		
//For drawing and mouse positions
sep = 16;
screen_bord = 16;
