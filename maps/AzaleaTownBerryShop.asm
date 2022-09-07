	object_const_def
	const AZALEA_TOWN_BERRYSHOP_GRANNY
	const AZALEA_TOWN_BERRYSHOP_LASS

AzaleaTownBerryShop_MapScripts:
	def_scene_scripts

	def_callbacks

AzaleaTownBerryShopSellerScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_AZALEA_BERRYSHOP
	closetext
	end
	
AzaleaTownBerryShopLassScript:
	jumptextfaceplayer AzaleaTownBerryShopLassText
	
AzaleaTownBerryShopLassText:
	text "There are many"
	line "shops like this"
	
	para "all around the"
	line "region."
	
	para "However, there"
	line "seems to be a"
	cont "shortage of"
	cont "berries now."
	
	para "I fear prices"
	line "will increase in"
	cont "the future."
	done

AzaleaTownBerryShop_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, AZALEA_TOWN, 9
	warp_event  3,  7, AZALEA_TOWN, 9

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  2, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownBerryShopSellerScript, -1
	object_event  1,  5, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownBerryShopLassScript, -1
