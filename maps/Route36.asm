	object_const_def
	const ROUTE36_YOUNGSTER1
	const ROUTE36_YOUNGSTER2
	const ROUTE36_WEIRD_TREE
	const ROUTE36_LASS1
	const ROUTE36_FISHER
	const ROUTE36_WHITNEY
	const ROUTE36_SUICUNE
	const ROUTE36_ELM

Route36_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_ROUTE36_NOTHING
	scene_script .DummyScene1 ; SCENE_ROUTE36_SUICUNE

	def_callbacks

.DummyScene0:
	end

.DummyScene1:
	end

Route36SuicuneScript:
	showemote EMOTE_SHOCK, PLAYER, 15
	pause 15
	playsound SFX_WARP_FROM
	turnobject PLAYER, UP
	applymovement ROUTE36_SUICUNE, Route36SuicuneMovement
	disappear ROUTE36_SUICUNE
	turnobject PLAYER, DOWN
	pause 10
	setscene SCENE_ROUTE36_NOTHING
	clearevent EVENT_SAW_SUICUNE_AT_CIANWOOD_CITY
	setmapscene CIANWOOD_CITY, SCENE_CIANWOODCITY_SUICUNE_AND_EUSINE
	end

SudowoodoScript:
	checkitem SQUIRTBOTTLE
	iftrue .Fight

	waitsfx
	playsound SFX_SANDSTORM
	applymovement ROUTE36_WEIRD_TREE, SudowoodoShakeMovement
	end

.Fight:
	opentext
	writetext UseSquirtbottleText
	yesorno
	iffalse DidntUseSquirtbottleScript
	closetext
WateredWeirdTreeScript:: ; export (for when you use Squirtbottle from pack)
	opentext
	writetext UsedSquirtbottleText
	waitbutton
	closetext
	waitsfx
	playsound SFX_SANDSTORM
	applymovement ROUTE36_WEIRD_TREE, SudowoodoShakeMovement
	opentext
	writetext SudowoodoAttackedText
	waitbutton
	closetext
	loadwildmon SUDOWOODO, 20
	startbattle
	setevent EVENT_FOUGHT_SUDOWOODO
	ifequal DRAW, DidntCatchSudowoodo
	disappear ROUTE36_WEIRD_TREE
	variablesprite SPRITE_WEIRD_TREE, SPRITE_TWIN
	reloadmapafterbattle
	end

DidntUseSquirtbottleScript:
	closetext
	end

DidntCatchSudowoodo:
	reloadmapafterbattle
	applymovement ROUTE36_WEIRD_TREE, WeirdTreeMovement_Flee
	disappear ROUTE36_WEIRD_TREE
	variablesprite SPRITE_WEIRD_TREE, SPRITE_TWIN
	special LoadUsedSpritesGFX
	special RefreshSprites
	end

Route36WhitneyScript:
	faceplayer
	opentext
	setevent EVENT_MET_WHITNEY
	writetextcheckdialogue WhitneyText1, WhitneyText1Min
	waitbutton
	closetext
	turnobject ROUTE36_ELM, DOWN
	pause 5
	turnobject ROUTE36_WHITNEY, UP
	showemote EMOTE_SHOCK, ROUTE36_ELM, 10
	opentext
	writetextcheckdialogue ElmText1, ElmText1Min
	waitbutton
	closetext
	applymovement ROUTE36_ELM, ElmMovement1
	disappear ROUTE36_ELM
	turnobject ROUTE36_WHITNEY, DOWN
	opentext
	writetextcheckdialogue WhitneyText2, WhitneyText2Min
	waitbutton
	closetext
	applymovement PLAYER, PlayerMovement1
	applymovement ROUTE36_WHITNEY, WhitneyMovement1
	clearevent EVENT_FLORIA_AT_FLOWER_SHOP
	setevent EVENT_WHITNEY_AT_SUDOWOODO
	disappear ROUTE36_WHITNEY
	end

Route36HammerGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HAMMER_ROCK_SMASH
	iftrue .AlreadyGotHammer
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftrue .ClearedSudowoodo
	writetext HammerGuyText1
	waitbutton
	closetext
	end

.ClearedSudowoodo:
	writetext HammerGuyText2
	promptbutton
	verbosegiveitem HAMMER
	iffalse .NoRoomForTM
	setevent EVENT_GOT_HAMMER_ROCK_SMASH
.AlreadyGotHammer:
	writetext HammerGuyText3
	waitbutton
.NoRoomForTM:
	closetext
	end

Route36LassScript:
	faceplayer
	opentext
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftrue .ClearedSudowoodo
	writetext Route36LassText
	waitbutton
	closetext
	end

.ClearedSudowoodo:
	writetext Route36LassText_ClearedSudowoodo
	waitbutton
	closetext
	end

TrainerSchoolboyAlan1:
	trainer SCHOOLBOY, ALAN1, EVENT_BEAT_SCHOOLBOY_ALAN, SchoolboyAlan1SeenText, SchoolboyAlan1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_SCHOOLBOY_ALAN
	endifjustbattled
	opentext
	checkflag ENGINE_ALAN_READY_FOR_REMATCH
	iftrue .ChooseRematch
	checkflag ENGINE_ALAN_HAS_FIRE_STONE
	iftrue .GiveFireStone
	checkcellnum PHONE_SCHOOLBOY_ALAN
	iftrue .NumberAccepted
	checkevent EVENT_ALAN_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgainForPhoneNumber
	writetext SchoolboyAlanBooksText
	promptbutton
	setevent EVENT_ALAN_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .ContinueAskForPhoneNumber

.AskAgainForPhoneNumber:
	scall .AskNumber2
.ContinueAskForPhoneNumber:
	askforphonenumber PHONE_SCHOOLBOY_ALAN
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, SCHOOLBOY, ALAN1
	scall .RegisteredNumber
	sjump .NumberAccepted

.ChooseRematch:
	scall .Rematch
	winlosstext SchoolboyAlan1BeatenText, 0
	readmem wAlanFightCount
	ifequal 4, .Fight4
	ifequal 3, .Fight3
	ifequal 2, .Fight2
	ifequal 1, .Fight1
	ifequal 0, .LoadFight0
.Fight4:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight4
.Fight3:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight3
.Fight2:
	checkflag ENGINE_FLYPOINT_BLACKTHORN
	iftrue .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_OLIVINE
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer SCHOOLBOY, ALAN1
	startbattle
	reloadmapafterbattle
	loadmem wAlanFightCount, 1
	clearflag ENGINE_ALAN_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer SCHOOLBOY, ALAN2
	startbattle
	reloadmapafterbattle
	loadmem wAlanFightCount, 2
	clearflag ENGINE_ALAN_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer SCHOOLBOY, ALAN3
	startbattle
	reloadmapafterbattle
	loadmem wAlanFightCount, 3
	clearflag ENGINE_ALAN_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer SCHOOLBOY, ALAN4
	startbattle
	reloadmapafterbattle
	loadmem wAlanFightCount, 4
	clearflag ENGINE_ALAN_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer SCHOOLBOY, ALAN5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ALAN_READY_FOR_REMATCH
	end

.GiveFireStone:
	scall .Gift
	verbosegiveitem FIRE_STONE
	iffalse .BagFull
	clearflag ENGINE_ALAN_HAS_FIRE_STONE
	setevent EVENT_ALAN_GAVE_FIRE_STONE
	sjump .NumberAccepted

.BagFull:
	sjump .PackFull

.AskNumber1:
	jumpstd AskNumber1MScript
	end

.AskNumber2:
	jumpstd AskNumber2MScript
	end

.RegisteredNumber:
	jumpstd RegisteredNumberMScript
	end

.NumberAccepted:
	jumpstd NumberAcceptedMScript
	end

.NumberDeclined:
	jumpstd NumberDeclinedMScript
	end

.PhoneFull:
	jumpstd PhoneFullMScript
	end

.Rematch:
	jumpstd RematchMScript
	end

.Gift:
	jumpstd GiftMScript
	end

.PackFull:
	jumpstd PackFullMScript
	end

TrainerPsychicMark:
	trainer PSYCHIC_T, MARK, EVENT_BEAT_PSYCHIC_MARK, PsychicMarkSeenText, PsychicMarkBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicMarkAfterBattleText
	waitbutton
	closetext
	end

Route36Sign:
	jumptext Route36SignText

RuinsOfAlphNorthSign:
	jumptext RuinsOfAlphNorthSignText

Route36TrainerTips1:
	jumptext Route36TrainerTips1Text

Route36TrainerTips2:
	jumptext Route36TrainerTips2Text

SudowoodoShakeMovement:
	tree_shake
	step_end

WeirdTreeMovement_Flee:
	fast_jump_step UP
	fast_jump_step UP
	step_end

ElmMovement1:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step RIGHT
	step RIGHT
	step_end

WhitneyMovement1:
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end
	
PlayerMovement1:
	step DOWN
	step LEFT
	step_end

Route36SuicuneMovement:
	set_sliding
	fast_jump_step DOWN
	fast_jump_step DOWN
	fast_jump_step DOWN
	fast_jump_step RIGHT
	fast_jump_step RIGHT
	fast_jump_step RIGHT
	remove_sliding
	step_end

UseSquirtbottleText:
	text "It's a weird tree."
	line "Use SQUIRTBOTTLE?"
	done

UsedSquirtbottleText:
	text "<PLAYER> used the"
	line "SQUIRTBOTTLE."
	done

SudowoodoAttackedText:
	text "The weird tree"
	line "doesn't like the"
	cont "SQUIRTBOTTLE!"

	para "The weird tree"
	line "attacked!"
	done

WhitneyText1:
	text "Hmm?…"
	
	para "Well hello there,"
	line "cutie! I'm the GYM"
	cont "leader WHITNEY."
	
	para "WHITNEY: I heard"
	line "about a weird tree"
	cont "in this route."
	
	para "And many people"
	line "have asked to move"
	cont "this tree so that"
	cont "the path is freed."
	
	para "When I saw it, it"
	line "was clear this was"
	cont "not going to be an"
	cont "actual tree."
	
	para "Therefore, I asked"
	line "Professor ELM for"
	cont "help to identify"
	cont "this odd creature."
	
	para "I can try to"
	line "subdue it if it"
	cont "gets aggressive."
	done

WhitneyText1Min:
	text "WHITNEY: I'll"
	line "wrestle the tree."
	done
	
ElmText1:
	text "ELM: Oh hi again"
	line "<PLAYER>."
	
	para "WHITNEY called me"
	line "about possibly a"
	cont "new #MON!"
	
	para "I already did all"
	line "the tests that I"
	cont "needed to do, and"
	
	para "I can confidently"
	line "say that this is a"
	cont "new #MON!"
	
	para "WHITNEY: What can"
	line "we do to try to"
	cont "remove it from the"
	cont "path though?"
	
	para "ELM: Eh, probably"
	line "dousing it with"
	cont "water should help."
	
	para "I'll leave now to"
	line "document these"
	cont "findings."
	
	para "There should be a"
	line "new #DEX entry"
	cont "avaliable soon!"
	
	para "See you two, and"
	line "thanks again for"
	cont "the help, WHITNEY!"
	done
	
ElmText1Min:
	text "ELM: No, fuck off."
	done
	
WhitneyText2:
	text "WHITNEY: I could"
	line "get a water source"
	cont "from the flower"
	cont "shop in Goldenrod."
	
	para "Oh? You have two"
	line "badges already?!"
	
	para "I have an idea,"
	line "defeat me in the"
	cont "GYM and I'll ask"
	cont "the flower shop"
	cont "owner to lend you"
	cont "a SQUIRTBOTTLE."
	
	para "That should give"
	line "you the chance to"
	cont "capture whatever"
	cont "this #MON is."
	
	para "I'll be waiting"
	line "in the GYM, don't"
	cont "be late!!"
	done
	
WhitneyText2Min:
	text "Then I'll wrestle"
	line "you at the GYM."
	done

HammerGuyText1:
	text "Wa-hey!"

	para "I was going to"
	line "snap that tree"

	para "with my straight-"
	line "arm punch."

	para "But I couldn't!"
	line "I'm a failure!"
	done

HammerGuyText2:
	text "Did you clear that"
	line "wretched tree?"

	para "I'm impressed!"
	line "I want you to"
	cont "have this."
	done

Text_ReceivedTM08: ; unreferenced
	text "<PLAYER> received"
	line "TM08. Suprisingly."
	done

HammerGuyText3:
	text "That happens to be"
	line "a HAMMER."

	para "You can shatter"
	line "rocks with just a"

	para "single well-aimed"
	line "smack."

	para "If any rocks are"
	line "in your way, just"
	cont "smash 'em up!"
	done

UnusedOddTreeText: ; unreferenced
	text "An odd tree is"
	line "blocking the way"
	cont "to GOLDENROD CITY."

	para "I wanted to go see"
	line "the huge #MON"

	para "CENTER they just"
	line "opened…"
	done

Route36LassText:
	text "An odd tree is"
	line "blocking the way"
	cont "to GOLDENROD CITY."

	para "It's preventing"
	line "me from shopping."

	para "Something should"
	line "be done about it."
	done

Route36LassText_ClearedSudowoodo:
	text "That odd tree dis-"
	line "appeared without a"
	cont "trace."

	para "Oh! That tree was"
	line "really a #MON?"
	done

PsychicMarkSeenText:
	text "I'm going to read"
	line "your thoughts!"
	done

PsychicMarkBeatenText:
	text "I misread you!"
	done

PsychicMarkAfterBattleText:
	text "I'd be strong if"
	line "only I could tell"

	para "what my opponent"
	line "was thinking."
	done

SchoolboyAlan1SeenText:
	text "Thanks to my stud-"
	line "ies, I'm ready for"
	cont "any #MON!"
	done

SchoolboyAlan1BeatenText:
	text "Oops! Computation"
	line "error?"
	done

SchoolboyAlanBooksText:
	text "Darn. I study five"
	line "hours a day too."

	para "There's more to"
	line "learning than just"
	cont "reading books."
	done

Route36SignText:
	text "ROUTE 36"
	done

RuinsOfAlphNorthSignText:
	text "RUINS OF ALPH"
	line "NORTH ENTRANCE"
	done

Route36TrainerTips1Text:
	text "TRAINER TIPS"

	para "#MON stats"
	line "vary--even within"
	cont "the same species."

	para "Their stats may be"
	line "similar at first."

	para "However, differ-"
	line "ences will become"

	para "pronounced as the"
	line "#MON grow."
	done

Route36TrainerTips2Text:
	text "TRAINER TIPS"

	para "Use DIG to return"
	line "to the entrance of"
	cont "any place."

	para "It is convenient"
	line "for exploring"

	para "caves and other"
	line "landmarks."
	done

Route36_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  8, ROUTE_36_NATIONAL_PARK_GATE, 3
	warp_event  6,  9, ROUTE_36_NATIONAL_PARK_GATE, 4
	warp_event 47, 13, ROUTE_36_RUINS_OF_ALPH_GATE, 1
	warp_event 48, 13, ROUTE_36_RUINS_OF_ALPH_GATE, 2
	warp_event 55,  8, VIOLET_ROUTE_36_GATE, 1
	warp_event 55,  9, VIOLET_ROUTE_36_GATE, 2

	def_coord_events
	coord_event 20,  7, SCENE_ROUTE36_SUICUNE, Route36SuicuneScript
	coord_event 22,  7, SCENE_ROUTE36_SUICUNE, Route36SuicuneScript

	def_bg_events
	bg_event 29,  1, BGEVENT_READ, Route36TrainerTips2
	bg_event 45, 11, BGEVENT_READ, RuinsOfAlphNorthSign
	bg_event 55,  7, BGEVENT_READ, Route36Sign
	bg_event 21,  7, BGEVENT_READ, Route36TrainerTips1

	def_object_events
	object_event 16, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicMark, -1
	object_event 22, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerSchoolboyAlan1, -1
	object_event 35,  9, SPRITE_WEIRD_TREE, SPRITEMOVEDATA_SUDOWOODO, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SudowoodoScript, EVENT_ROUTE_36_SUDOWOODO
	object_event 51,  8, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route36LassScript, -1
	object_event 44,  9, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route36HammerGuyScript, -1
	object_event 35, 10, SPRITE_WHITNEY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route36WhitneyScript, EVENT_WHITNEY_AT_SUDOWOODO
	object_event 21,  6, SPRITE_SUICUNE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SAW_SUICUNE_ON_ROUTE_36
	object_event 36,  9, SPRITE_ELM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route36WhitneyScript, EVENT_WHITNEY_AT_SUDOWOODO
