	object_const_def
	const DARKCAVEROUTE46ENTRANCE_PHARMACIST
	const DARKCAVEROUTE46ENTRANCE_POKE_BALL1
	const DARKCAVEROUTE46ENTRANCE_POKE_BALL2

DarkCaveRoute46Entrance_MapScripts:
	def_scene_scripts

	def_callbacks

DarkCaveRoute46EntranceDingusScript:
	faceplayer
	opentext
	trade NPC_TRADE_DINGUS
	waitbutton
	closetext
	end

DarkCaveRoute46EntranceEthers:
	itemball ETHER, 4

DarkCaveRoute46EntranceTMSnore:
	itemball TM_SKETCH

DarkCaveRoute46Entrance_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 23,  3, ROUTE_46, 4
	warp_event  3, 25, ROUTE_31, 4
	warp_event 27, 15, DARK_CAVE_MELTING_CAVE_CONNECTOR, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  7,  3, SPRITE_PHARMACIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DarkCaveRoute46EntranceDingusScript, -1
	object_event 17, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCaveRoute46EntranceEthers, EVENT_DARK_CAVE_ROUTE46_ENTRANCE_ETHERS
	object_event 22, 24, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCaveRoute46EntranceTMSnore, EVENT_DARK_CAVE_ROUTE46_ENTRANCE_TM_SNORE
