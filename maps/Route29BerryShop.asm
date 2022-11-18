	object_const_def
	const ROUTE29_BERRYSHOP_GRANNY
	const ROUTE29_BERRYSHOP_LASS

Route29BerryShop_MapScripts:
	def_scene_scripts

	def_callbacks

Route29BerryShopSellerScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_ROUTE_29_BERRYSHOP
	closetext
	end
	
Route29BerryShopLassScript:
	jumptextfaceplayer Route29BerryShopLassText
	
Route29BerryShopLassText:
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

Route29BerryShop_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_29, 2
	warp_event  3,  7, ROUTE_29, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  2, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route29BerryShopSellerScript, -1
	object_event  1,  5, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route29BerryShopLassScript, -1
