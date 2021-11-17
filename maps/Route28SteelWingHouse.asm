	object_const_def
	const ROUTE28STEELWINGHOUSE_CELEBRITY
	const ROUTE28STEELWINGHOUSE_FEAROW

Route28SteelWingHouse_MapScripts:
	def_scene_scripts
	scene_script .DummyScene

	def_callbacks

.DummyScene:
	end

Celebrity:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM47_STEEL_WING
	iftrue .AlreadyGotItem
	writetext CelebrityText1
	promptbutton
	verbosegiveitem TM_SKETCH
	iffalse .Done
	setevent EVENT_GOT_TM47_STEEL_WING
.Done:
	closetext
	end
.AlreadyGotItem:
	writetext CelebrityText2
	waitbutton
	closetext
	end

CelebritysFearow:
	opentext
	writetext CelebritysFearowText
	cry FEAROW
	waitbutton
	closetext
	end

CelebrityHouseBookshelf:
	jumpstd MagazineBookshelfScript

CelebrityText1:
	text "Oh, wow."
	line "You've found me."

	para "Please tell every-"
	line "-one about me."

	para "I'll give you this"
	line "for giving me a"
	cont "shotout."
	done

CelebrityText2:
	text "It's tough being"
	line "an influencer."

	para "Everywhere I go,"
	line "I must tweet"
	cont "about it."
	done

CelebritysFearowText:
	text "FEAROW: Feero!"
	done

Route28SteelWingHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_28, 1
	warp_event  3,  7, ROUTE_28, 1

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, CelebrityHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, CelebrityHouseBookshelf

	def_object_events
	object_event  2,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Celebrity, -1
	object_event  6,  5, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CelebritysFearow, -1
