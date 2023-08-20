SHUCKLE_BERRYJUICE_PRICE EQU 175
	object_const_def
	const SHUCKLECAVE_SHUCKLE

ShuckleCave_MapScripts:
	def_scene_scripts

	def_callbacks

ShuckleCaveShuckle:
	opentext
	checkevent EVENT_SHUCKLE_CAVE_ALREADY_SEEN_TEXT
	iftrue .simplerText
.firstTimeText
	writetext ShuckleCaveSellJuiceText
	waitbutton
	setevent EVENT_SHUCKLE_CAVE_ALREADY_SEEN_TEXT
	sjump .proceed
.simplerText
	writetext ShuckleCaveSellJuiceSimpleText
	waitbutton
.proceed
	yesorno
	iffalse .BagFull
	closetext
	checkmoney YOUR_MONEY, SHUCKLE_BERRYJUICE_PRICE
	ifequal HAVE_LESS, .NotEnoughMoney
	playsound SFX_TRANSACTION
	pause 10
	giveitem BERRY_JUICE
	takemoney YOUR_MONEY, SHUCKLE_BERRYJUICE_PRICE
	closetext
	end
.BagFull
	closetext
	end
.NotEnoughMoney
	opentext
	playsound SFX_WRONG
	writetext ShuckleCaveNoMoneyText
	waitbutton
	closetext
	end
	
ShuckleCaveSellJuiceText:
	text "This SHUCKLE is"
	line "holding a lot of"
	cont "cash and some"
	cont "bottles of"
	cont "BERRY JUICE."
	
	para "There are lines"
	line "drawn on the floor"
	cont "that say '¥175'…"
	done

ShuckleCaveSellJuiceSimpleText:
	text "BERRY JUICE x ¥175"
	done

ShuckleCaveNoMoneyText:
	text "Shuckle gives you"
	line "a dissapointing"
	cont "stare…"
	done

ShuckleCave_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 7,  7, ROUTE_32, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3, 3, SPRITE_SHUCKLE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ShuckleCaveShuckle, -1
