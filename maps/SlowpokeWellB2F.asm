	object_const_def
	const SLOWPOKEWELLB2F_GYM_GUIDE
	const SLOWPOKEWELLB2F_POKE_BALL

SlowpokeWellB2F_MapScripts:
	def_scene_scripts

	def_callbacks

SlowpokeWellB2FGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_ULTRA_BALLS_IN_SLOWPOKE_WELL
	iftrue .GotUltraBalls
	writetext SlowpokeWellB2FGymGuideText
	promptbutton
	verbosegiveitem ULTRA_BALL, 5
	iffalse .NoRoom
	setevent EVENT_GOT_ULTRA_BALLS_IN_SLOWPOKE_WELL
.NoRoom:
	closetext
	end

.GotUltraBalls:
	writetext SlowpokeWellB2FGymGuideText_GotUltraBalls
	waitbutton
	closetext
	end

SlowpokeWellB2FTMRainDance:
	itemball TM_SKETCH

SlowpokeWellB2FGymGuideText:
	text "I'm waiting to see"
	line "SLOWPOKE's moment"
	cont "of evolution."

	para "Through observa-"
	line "tion, I made a new"
	cont "discovery."

	para "A SLOWPOKE with a"
	line "KING'S ROCK often"

	para "gets bitten by a"
	line "SHELLDER."

	para "Here, I'll share"
	line "some balls with"
	cont "you."
	done

SlowpokeWellB2FGymGuideText_GotUltraBalls:
	text "I'm going to be"
	line "like SLOWPOKE."

	para "I'll wait patient-"
	line "ly, so I can see"
	cont "one evolve."
	done

SlowpokeWellB2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 11, SLOWPOKE_WELL_B1F, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  4, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 1, SlowpokeWellB2FGymGuideScript, -1
	object_event 15,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_ITEMBALL, 0, SlowpokeWellB2FTMRainDance, EVENT_SLOWPOKE_WELL_B2F_TM_RAIN_DANCE
