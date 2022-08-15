	object_const_def
	const SPROUTTOWER3F_SAGE1
	const SPROUTTOWER3F_SAGE2
	const SPROUTTOWER3F_SAGE3
	const SPROUTTOWER3F_SAGE4
	const SPROUTTOWER3F_POKE_BALL1
	const SPROUTTOWER3F_POKE_BALL2
	const SPROUTTOWER3F_SILVER
	const SPROUTTOWER3F_FALKNER

SproutTower3F_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	def_callbacks

.DummyScene0:
	end

.DummyScene1:
	end

SproutTower3FRivalScene:
	turnobject PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	playsound SFX_TACKLE
	playsound SFX_ELEVATOR
	earthquake 79
	pause 15
	playsound SFX_TACKLE
	playsound SFX_ELEVATOR
	earthquake 79
	applymovement PLAYER, SproutTower3FPlayerApproachesRivalMovement
	applymovement SPROUTTOWER3F_SILVER, SproutTower3FRivalApproachesElderMovement
	opentext
	writetextcheckdialogue SproutTowerElderLecturesRivalText, SproutTowerElderLecturesRivalTextMin
	waitbutton
	closetext
	showemote EMOTE_SHOCK, SPROUTTOWER3F_SILVER, 15
	turnobject SPROUTTOWER3F_SILVER, DOWN
	pause 15
	applymovement SPROUTTOWER3F_SILVER, SproutTower3FRivalLeavesElderMovement
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetextcheckdialogue SproutTowerRivalOnlyCareAboutStrongText, SproutTowerRivalOnlyCareAboutStrongTextMin
	waitbutton
	closetext
	turnobject SPROUTTOWER3F_SILVER, UP
	opentext
	writetext SproutTowerRivalUsedEscapeRopeText
	pause 15
	closetext
	playsound SFX_WARP_TO
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear SPROUTTOWER3F_SILVER
	waitsfx
	special FadeInQuickly
	setscene SCENE_FINISHED
	special RestartMapMusic
	end

SageLiScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM05_FLASH
	iftrue .GotFlash
	writetextcheckdialogue SageLiSeenText, SageLiSeenTextMin
	waitbutton
	closetext
	winlosstext SageLiBeatenText, 0
	loadtrainer SAGE, LI
	startbattle
	reloadmapafterbattle
	opentext
	writetextcheckdialogue SageLiTakeThisFlashText, SageLiTakeThisFlashTextMin
	promptbutton
	verbosegiveitem HM_FLASH
	setevent EVENT_GOT_HM05_FLASH
	setevent EVENT_BEAT_SAGE_LI
	writetextcheckdialogue SageLiFlashExplanationText, SageLiFlashExplanationTextMin
	waitbutton
	closetext
	showemote EMOTE_SHOCK, SPROUTTOWER3F_FALKNER, 15
	applymovement SPROUTTOWER3F_FALKNER, SproutTower3FFalknerApproachesLiMovement
	opentext
	writetextcheckdialogue SproutTowerFalknerLikedBattleText, SproutTowerFalknerLikedBattleTextMin
	setevent EVENT_FALKNER_SPROUT_TOWER
	waitbutton
	closetext
	turnobject SPROUTTOWER3F_FALKNER, UP
	opentext
	writetext SproutTowerFalknerUsedEscapeRopeText
	pause 15
	closetext
	playsound SFX_WARP_TO
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear SPROUTTOWER3F_FALKNER
	waitsfx
	special FadeInQuickly
	end

.GotFlash:
	writetext SageLiAfterBattleText
	waitbutton
	closetext
	end

TrainerSageJin:
	trainer SAGE, JIN, EVENT_BEAT_SAGE_JIN, SageJinSeenText, SageJinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageJinAfterBattleText
	waitbutton
	closetext
	end

TrainerSageTroy:
	trainer SAGE, TROY, EVENT_BEAT_SAGE_TROY, SageTroySeenText, SageTroyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageTroyAfterBattleText
	waitbutton
	closetext
	end

TrainerSageNeal:
	trainer SAGE, NEAL, EVENT_BEAT_SAGE_NEAL, SageNealSeenText, SageNealBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageNealAfterBattleText
	waitbutton
	closetext
	end

SproutTower3FPainting:
	jumptext SproutTower3FPaintingText

SproutTower3FStatue:
	jumptext SproutTower3FStatueText

SproutTower3FPokeBalls:
	itemball POKE_BALL, 3

SproutTower3FEscapeRope:
	itemball ESCAPE_ROPE, 5

SproutTower3FPlayerApproachesRivalMovement:
	step UP
	step UP
	step UP
	step UP
	step_end
	
SproutTower3FFalknerApproachesLiMovement:
	step RIGHT
	step_end

SproutTower3FRivalApproachesElderMovement:
	step UP
	step_end

SproutTower3FRivalLeavesElderMovement:
	step RIGHT
	step DOWN
	step_end
	
SproutTowerFalknerScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_FALKNER
	iftrue .WelcomeBack
	writetext SproutTowerFalknerBeforeLiBattle
	waitbutton
	closetext
	end

.WelcomeBack
	writetext SproutTowerFalknerAfterGymBattle
	waitbutton
	closetext
	end

SproutTowerFalknerAfterGymBattle:
	text "FALKNER: Li and I"
	line "have trained"
	cont "together since"
	cont "I was a kid."
	
	para "He has been my"
	line "fatherly figure"
	cont "ever since the"
	cont "aerostat accident."
	
	para "At least I still"
	line "have his #MON…"
	done

SproutTowerFalknerLikedBattleText:
	text "FALKNER: Wow!"
	line "That was a great"
	line "battle! It was as"
	cont "fierce as a raging"
	cont "Fearow!"
	
	para "Well done! I can't"
	line "wait for our "
	cont "battle to happen"
	cont "at the GYM!"
	
	para "I'll see you"
	line "there!"
	done
	
SproutTowerFalknerLikedBattleTextMin:
	text "FALKNER: Cool."
	line "Back to the GYM."
	done

SproutTowerFalknerUsedEscapeRopeText:
	text "FALKNER used an"
	line "ESCAPE ROPE!"
	done

SproutTowerFalknerBeforeLiBattle:
	text "FALKNER: I was"
	line "training with my"
	cont "old friend LI when"
	cont "that boy appeared…"
	
	para "They looked very"
	line "determined but"
	cont "also quite angry…"
	
	para "Regardless, I can"
	line "arbitrate a match"
	cont "between you and LI"

	para "Give it all"
	line "you've got!"
	done

SproutTowerElderLecturesRivalText:
	text "ELDER: You are in-"
	line "deed skilled as a"
	cont "trainer."

	para "As promised, here"
	line "is your HM."

	para "But let me say"
	line "this: You should"

	para "treat your"
	line "#MON better."

	para "The way you battle"
	line "is far too harsh."

	para "#MON are not"
	line "tools of war…"
	done
	
SproutTowerElderLecturesRivalTextMin:
	text "ELDER: Yo chill."
	done

SproutTowerRivalOnlyCareAboutStrongText:
	text "…"
	line "…Humph!"

	para "He claims to be"
	line "the ELDER but"
	cont "he's weak."

	para "It stands to"
	line "reason."

	para "I'd never lose to"
	line "fools who babble"

	para "about being nice"
	line "to #MON."

	para "I only care about"
	line "strong #MON"
	cont "that can win."

	para "I really couldn't"
	line "care less about"
	cont "weak #MON."
	done
	
SproutTowerRivalOnlyCareAboutStrongTextMin:
	text "Somehow he sucks"
	line "more than you."
	done

SproutTowerRivalUsedEscapeRopeText:
	text "<RIVAL> used an"
	line "ESCAPE ROPE!"
	done

SageLiSeenText:
	text "So good of you to"
	line "come here!"

	para "SPROUT TOWER is a"
	line "place of training."

	para "People and #MON"
	line "test their bonds"

	para "to build a bright"
	line "future together."

	para "I am the final"
	line "test."

	para "Allow me to check"
	line "the ties between"

	para "your #MON and"
	line "you!"
	done
	
SageLiSeenTextMin:
	text "One sec let me"
	line "heal my bois."
	done
	
SageLiBeatenText:
	text "Ah, excellent!"
	done

SageLiTakeThisFlashText:
	text "You and your #-"
	line "MON should have"

	para "no problem using"
	line "this move."

	para "Take this FLASH"
	line "HM."
	done
	
SageLiTakeThisFlashTextMin:
	text "Here take this"
	line "junk."
	done

SageLiFlashExplanationText:
	text "FLASH illuminates"
	line "even the darkest"
	cont "of all places."

	para "But to use it out"
	line "of battle, you"

	para "need the BADGE"
	line "from VIOLET's GYM."
	done

SageLiFlashExplanationTextMin:
	text "Just use a map…"
	done

SageLiAfterBattleText:
	text "I hope you learn"
	line "and grow from your"
	cont "journey."
	done

SageJinSeenText:
	text "I train to find"
	line "enlightenment in"
	cont "#MON!"
	done

SageJinBeatenText:
	text "My training is"
	line "incomplete…"
	done

SageJinAfterBattleText:
	text "As #MON grow"
	line "stronger, so does"
	cont "the trainer."

	para "No, wait. As the"
	line "trainer grows"

	para "stronger, so do"
	line "the #MON."
	done

SageTroySeenText:
	text "Let me see how"
	line "much you trust"
	cont "your #MON."
	done

SageTroyBeatenText:
	text "Yes, your trust is"
	line "real!"
	done

SageTroyAfterBattleText:
	text "It is not far to"
	line "the ELDER."
	done

SageNealSeenText:
	text "The ELDER's HM"
	line "lights even pitch-"
	cont "black darkness."
	done

SageNealBeatenText:
	text "It is my head that"
	line "is bright!"
	done

SageNealAfterBattleText:
	text "Let there be light"
	line "on your journey."
	done

SproutTower3FPaintingText:
	text "It's a powerful"
	line "painting of a"
	cont "BELLSPROUT."
	done

SproutTower3FStatueText:
	text "A #MON statue…"

	para "It looks very"
	line "distinguished."
	done

SproutTower3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 10, 14, SPROUT_TOWER_2F, 4

	def_coord_events
	coord_event 11,  9, SCENE_DEFAULT, SproutTower3FRivalScene

	def_bg_events
	bg_event  8,  1, BGEVENT_READ, SproutTower3FStatue
	bg_event 11,  1, BGEVENT_READ, SproutTower3FStatue
	bg_event  9,  0, BGEVENT_READ, SproutTower3FPainting
	bg_event 10,  0, BGEVENT_READ, SproutTower3FPainting
	bg_event  5, 15, BGEVENT_READ, SproutTower3FStatue
	bg_event 14, 15, BGEVENT_READ, SproutTower3FStatue

	def_object_events
	object_event  9, 12, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSageJin, -1
	object_event  8,  9, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSageTroy, -1
	object_event 10,  2, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SageLiScript, -1
	object_event  9, 11, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSageNeal, -1
	object_event  6, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SproutTower3FPokeBalls, EVENT_SPROUT_TOWER_3F_POKE_BALLS
	object_event 14,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SproutTower3FEscapeRope, EVENT_SPROUT_TOWER_3F_ESCAPE_ROPES
	object_event 10,  4, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_SPROUT_TOWER
	object_event  7,  3, SPRITE_FALKNER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SproutTowerFalknerScript, EVENT_FALKNER_SPROUT_TOWER
