	object_const_def
	const DARKCAVEVIOLETENTRANCE_POKE_BALL1
	const DARKCAVEVIOLETENTRANCE_POKE_BALL2
	const DARKCAVEVIOLETENTRANCE_POKE_BALL3
	const DARKCAVEVIOLETENTRANCE_POKE_BALL4

DarkCaveVioletEntrance_MapScripts:
	def_scene_scripts

	def_callbacks

DarkCaveVioletEntranceElixers:
	itemball ELIXER, 2

DarkCaveVioletEntranceParlyzHeal:
	itemball PARLYZ_HEAL, 4

DarkCaveVioletEntranceBurnHeals:
	itemball BURN_HEAL, 4

DarkCaveVioletEntranceNugget:
	itemball NUGGET

DarkCaveVioletEntranceHiddenFreshWater:
	hiddenitem FRESH_WATER, EVENT_DARK_CAVE_VIOLET_ENTRANCE_HIDDEN_FRESH_WATER

DarkCaveVioletEntrance_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3, 15, ROUTE_31, 3
	warp_event 35, 33, ROUTE_46, 3

	def_coord_events

	def_bg_events
	bg_event 32,  6, BGEVENT_ITEM, DarkCaveVioletEntranceHiddenFreshWater

	def_object_events
	object_event  6,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCaveVioletEntranceElixers, EVENT_DARK_CAVE_VIOLET_ENTRANCE_ELIXERS
	object_event 36, 22, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCaveVioletEntranceParlyzHeal, EVENT_DARK_CAVE_VIOLET_ENTRANCE_PARALYZ_HEAL
	object_event 37, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCaveVioletEntranceBurnHeals, EVENT_DARK_CAVE_VIOLET_ENTRANCE_BURN_HEALS
	object_event 16,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_ITEMBALL, 0, DarkCaveVioletEntranceNugget, EVENT_DARK_CAVE_VIOLET_ENTRANCE_NUGGET
