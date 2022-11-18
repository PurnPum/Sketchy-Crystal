	object_const_def
	const CHERRYGROVEMART_CLERK
	const CHERRYGROVEMART_CLERK2
	const CHERRYGROVEMART_COOLTRAINER_M
	const CHERRYGROVEMART_YOUNGSTER

CherrygroveMart_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	def_callbacks
	
.DummyScene0:
	end

.DummyScene1:
	end

CherrygroveMartClerkScript:
	opentext
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .PokeBallsInStock
	pokemart MARTTYPE_STANDARD, MART_CHERRYGROVE
	closetext
	end

.PokeBallsInStock:
	pokemart MARTTYPE_STANDARD, MART_CHERRYGROVE_DEX
	closetext
	end

CherrygroveMartYoungsterScript:
	jumptextfaceplayer CherrygroveMartYoungsterText

CherrygroveMartCooltrainerMScript:
	faceplayer
	opentext
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .PokeBallsInStock
	writetext CherrygroveMartCooltrainerMText
	waitbutton
	closetext
	end

.PokeBallsInStock:
	writetext CherrygroveMartCooltrainerMText_PokeBallsInStock
	waitbutton
	closetext
	end

CherrygroveMartClerk2Script:
	faceplayer
	opentext
	checkevent EVENT_MET_CLERK_CHERRYGROVE_CANDY_MACHINE
	iftrue .HiAgain
	writetextcheckdialogue CherrygroveMartClerk2Text, CherrygroveMartClerk2TextMin
	waitbutton
	closetext
	turnobject CHERRYGROVEMART_CLERK2, UP
	setevent EVENT_MET_CLERK_CHERRYGROVE_CANDY_MACHINE
	setscene SCENE_FINISHED
	end
.HiAgain
	writetext CherrygroveMartClerk2HiAgainText
	waitbutton
	closetext
	turnobject CHERRYGROVEMART_CLERK2, UP
	setscene SCENE_FINISHED
	end

CherrygroveMartClerk2Scene:
	turnobject CHERRYGROVEMART_CLERK2, RIGHT
	showemote EMOTE_SHOCK, CHERRYGROVEMART_CLERK2, 15
	applymovement CHERRYGROVEMART_CLERK2, CherrygroveMartClerk2Movement
	turnobject CHERRYGROVEMART_CLERK2, UP
	turnobject PLAYER, DOWN
	pause 15
	opentext
	writetextcheckdialogue CherrygroveMartClerk2Text, CherrygroveMartClerk2TextMin
	waitbutton
	closetext
	applymovement CHERRYGROVEMART_CLERK2, CherrygroveMartClerk2Movement2
	turnobject CHERRYGROVEMART_CLERK2, UP
	setscene SCENE_FINISHED
	setevent EVENT_MET_CLERK_CHERRYGROVE_CANDY_MACHINE
	end

CherrygroveMartRareCandyVendingMachine:
	farsjump RareCandyVendingMachine

CherrygroveMartClerk2Movement:
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

CherrygroveMartClerk2Movement2:
	step LEFT
	step LEFT
	step LEFT
	step_end

CherrygroveMartClerk2HiAgainText:
	text "Originally these"
	line "machines would"
	cont "give out free RARE"
	cont "CANDIES."
	
	para "Especially after"
	line "their recipe was"
	cont "discovered."
	
	para "They really aren't"
	line "rare anymore."
	
	para "However, the"
	line "#MON Centers'"
	cont "management did not"
	cont "agree on this."
	
	para "Saying that it'd"
	line "ruin their busi-"
	cont "ness. Since people"
	cont "wouldn't need to"
	cont "train and so less"
	cont "people would heal"
	cont "at their centers…"
	
	para "I really hope the"
	line "current crisis"
	cont "gets solved soon…"
	done

CherrygroveMartClerk2Text:
	text "Hi!"
	
	para "We just installed"
	line "these RARE CANDY"
	cont "machines in most"
	cont "#MON marts."
	
	para "There are big"
	line "discounts if you"
	cont "buy in bulk!."

	para "Think before you"
	line "buy and use these"
	cont "candies."
	
	para "You don't want"
	line "your adventure to"
	cont "be a chore."
	
	para "But you also want"
	line "it to be fun"
	cont "for you!"
	done

CherrygroveMartClerk2TextMin:
	text "RARE CANDY"
	line "Machines here."
	done

CherrygroveMartCooltrainerMText:
	text "They're fresh out"
	line "of # BALLS!"

	para "When will they get"
	line "more of them?"
	done

CherrygroveMartCooltrainerMText_PokeBallsInStock:
	text "# BALLS are in"
	line "stock! Now I can"
	cont "catch #MON!"
	done

CherrygroveMartYoungsterText:
	text "When I was walking"
	line "in the grass, a"

	para "bug #MON poi-"
	line "soned my #MON!"

	para "I just kept going,"
	line "but then my"
	cont "#MON fainted."

	para "You should keep an"
	line "ANTIDOTE with you."
	done

CherrygroveMart_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CHERRYGROVE_CITY, 1
	warp_event  3,  7, CHERRYGROVE_CITY, 1

	def_coord_events
	coord_event 3,  5, SCENE_DEFAULT, CherrygroveMartClerk2Scene
	
	def_bg_events
	bg_event  0,  5, BGEVENT_UP, CherrygroveMartRareCandyVendingMachine
	bg_event  1,  5, BGEVENT_UP, CherrygroveMartRareCandyVendingMachine
	
	def_object_events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygroveMartClerkScript, -1
	object_event  0,  6, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygroveMartClerk2Script, EVENT_MET_CLERK_CHERRYGROVE_CANDY_MACHINE
	object_event  7,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygroveMartCooltrainerMScript, -1
	object_event 10,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CherrygroveMartYoungsterScript, -1
