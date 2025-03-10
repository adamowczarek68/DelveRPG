depth = -9999;

global.font = font_add_sprite( sDelveFont, 32, true, 1.5 );


//This will creating our item constructor.
function create_item( _name, _desc, _icon, _droppable, _consume_on_use, _effect ) constructor
	{
	name = _name;
	description = _desc;
	icon = _icon;
	droppable = _droppable;
	consume_on_use = _consume_on_use;
	effect = _effect;
	//purchase = _purchase
	//vendor = _vendor
	//stacks = _stacks
	//ilvl = ilvl;
	//idnum = _id;
	}




//Create the items. We will be utilzing structs.
global.item_list = 
	{
		
	foodBuffItem : new create_item(
		"FBI1",
		"Recovers health and grants buff?",
		0,
		true, // droppable
		true, // consume
		function() {
			oPlayer.hp_current = min( oPlayer.hp_max, oPlayer.hp_current + 5); //This "clamps" the HP.	
			//Add Half of the item.
			//show_debug_message("Health buff from FBI1 applied, adding half food buff item");
			oInventory.item_add( global.item_list.foodBuffItem_half ); 
		}
	),
		
	foodBuffItem_half : new create_item(
		"Half of a FBI1",
		"Recovers some health and grants buff?",
		1,
		true,
		true,
		
		function() {
			oPlayer.hp_current = min( oPlayer.hp_max, oPlayer.hp_current + 5); //This "clamps" the HP.
			//show_debug_message("Health buff from half FBI1 applied.");
		}
		
		),
		
	bomb : new create_item(
		"Bomb",
		"Make big boom.",
		2,
		true,
		true,
		
		function()
		//~51:20 https://www.youtube.com/watch?v=fa26B54JDDk&t=2554s for Bomb Count associated with oPlayer.
			{
			instance_create_depth( oPlayer.x, oPlayer.y, 0, oBombTool );
			}
		),
		
	alter_fiery : new create_item(
		"Fiery Alter",
		"Shifts the Shimmer to a Fiery realm. The Alter is destroyed in the process.",
		3,
		false,
		true,
		
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
