	object_const_def
	const SHUCKLECAVE_SHUCKLE

ShuckleCave_MapScripts:
	def_scene_scripts

	def_callbacks

ShuckleCaveShuckle:
	opentext
	checkevent EVENT_SHUCKLE_CAVE_GOT_JUICE
	iftrue .got_juice
	writetext ShuckleCaveGetJuiceText
	waitbutton
	verbosegiveitem BERRY_JUICE, 99
	iffalse .BagFull
	setevent EVENT_SHUCKLE_CAVE_GOT_JUICE
	closetext
	end
.got_juice:
	writetext ShuckleCaveDrunkShuckle
	waitbutton
	closetext
	end
.BagFull
	writetext ShuckleCaveNoRoomForJuiceText
	waitbutton
	closetext
	end
	
ShuckleCaveGetJuiceText:
	text "This SHUCKLE looks"
	line "passed out."
	
	para "Its not injured so"
	line "battling isn't the"
	cont "cause."
	
	para "Hopefully it does"
	line "not mind me taking"
	cont "some of this…"
	done
	
ShuckleCaveNoRoomForJuiceText:
	text "No space left in"
	line "the bag for this."
	done
	
ShuckleCaveDrunkShuckle:
	text "Someone has had a"
	line "bit too much juice"
	done

ShuckleCave_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 7,  7, ROUTE_32, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3, 3, SPRITE_SHUCKLE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ShuckleCaveShuckle, EVENT_SHUCKLE_CAVE_GOT_JUICE
