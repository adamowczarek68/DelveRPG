depth = -9999;

global.font = draw_set_font( Font1 );


//This will creating our item constructor.
function create_item( _name, _desc, _icon, _droppable, _effect ) constructor
	{
	name = _name;
	description = _desc;
	icon = _icon;
	droppable = _droppable
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
		true,
		
		function()
			{
			oPlayer.hp_current = min( oPlayer.hp_max, oPlayer.hp_current + 5); //This "clamps" the HP.
			
			//Consume the item.
			array_delete( inv, selected_item, 1 );
			
			//Add Half of the item.
			array_insert( inv, selected_item, global.item_list.foodBuffItem_half ); 
			}
		
		),
		
	foodBuffItem_half : new create_item(
		"Half of a FBI1",
		"Recovers some health and grants buff?",
		sYellowSwirly_Half,
		true,
		
		function()
			{
			oPlayer.hp_current = min( oPlayer.hp_max, oPlayer.hp_current + 5); //This "clamps" the HP.
			
			//Consume the item.
			array_delete( inv, selected_item, 1 );
			}
		
		),
		
	bomb : new create_item(
		"Bomb",
		"Make big boom.",
		sBomb,
		true,
		
		function()
		//~51:20 https://www.youtube.com/watch?v=fa26B54JDDk&t=2554s for Bomb Count associated with oPlayer.
			{
			instance_create_depth( oPlayer.x, oPlayer.y, 0, oBombTool );
			
			//Consume the item.
			array_delete( inv, selected_item, 1 );
			}
		),
		
	alter_fiery : new create_item(
		"Fiery Alter",
		"Shifts the Shimmer to a Fiery realm. The Alter is destroyed in the process.",
		sAlter_Fiery,
		false,
		
		function()
			{
				
			var _used = false;	//This variable is setup so that if the item is not used, it is not consumed.
				
			if instance_exists( oAlterDoor_Fiery )
				{
				with( oAlterDoor_Fiery )
					{
					if distance_to_object( oPlayer ) < 20 
						{
						instance_destroy();
						_used = true;
						}
					}
				}
			
			//Consume the item.
			if _used == true //This variable is setup so that if the item is not used, it is not consumed.
				{
				array_delete( inv, selected_item, 1 );
				}
				}
		),

	}
	
	
//Create the Inventory
inv = array_create( 0 );


//Inventory Size...
inv_max = 5;
	
//How to select an item.
selected_item = -1;
		
		
//For drawing and mouse positions
sep = 16;
screen_bord = 16;
