	object_const_def
	const VioletRoute36GATE_OFFICER
	const VioletRoute36GATE_COOLTRAINER_M

VioletRoute36Gate_MapScripts:
	def_scene_scripts

	def_callbacks

VioletRoute36GateOfficerScript:
	jumptextfaceplayer VioletRoute36GateOfficerText

VioletRoute36GateCooltrainerMScript:
	jumptextfaceplayer VioletRoute36GateCooltrainerMText

VioletRoute36GateOfficerText:
	text "ZZZZZZZZZZZZZZZZ"
	
	para "They appear to be"
	line "doozing off…"
	done

VioletRoute36GateCooltrainerMText:
	text "Sigh, officers in"
	line "this region are so"
	cont "damn incompetent…"
	done

VioletRoute36Gate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  4, ROUTE_36, 5
	warp_event  0,  5, ROUTE_36, 6
	warp_event  9,  4, VIOLET_CITY, 10
	warp_event  9,  5, VIOLET_CITY, 11

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VioletRoute36GateOfficerScript, -1
	object_event  4,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VioletRoute36GateCooltrainerMScript, -1
