	object_const_def
	const UNIONCAVE1F_POKEFAN_M1
	const UNIONCAVE1F_SUPER_NERD
	const UNIONCAVE1F_POKEFAN_M2
	const UNIONCAVE1F_FISHER1
	const UNIONCAVE1F_FISHER2
	const UNIONCAVE1F_POKE_BALL1
	const UNIONCAVE1F_POKE_BALL2
	const UNIONCAVE1F_POKE_BALL3
	const UNIONCAVE1F_POKE_BALL4

UnionCave1F_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerPokemaniacLarry:
	trainer POKEMANIAC, LARRY, EVENT_BEAT_POKEMANIAC_LARRY, PokemaniacLarrySeenText, PokemaniacLarryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacLarryAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerRussell:
	trainer HIKER, RUSSELL, EVENT_BEAT_HIKER_RUSSELL, HikerRussellSeenText, HikerRussellBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerRussellAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerDaniel:
	trainer HIKER, DANIEL, EVENT_BEAT_HIKER_DANIEL, HikerDanielSeenText, HikerDanielBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerDanielAfterBattleText
	waitbutton
	closetext
	end

TrainerFirebreatherBill:
	trainer FIREBREATHER, BILL, EVENT_BEAT_FIREBREATHER_BILL, FirebreatherBillSeenText, FirebreatherBillBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherBillAfterBattleText
	waitbutton
	closetext
	end

TrainerFirebreatherRay:
	trainer FIREBREATHER, RAY, EVENT_BEAT_FIREBREATHER_RAY, FirebreatherRaySeenText, FirebreatherRayBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherRayAfterBattleText
	waitbutton
	closetext
	end

UnionCave1FStardust:
	itemball STARDUST

UnionCave1FPotions:
	itemball POTION, 4

UnionCave1FEthers:
	itemball ETHER, 3

UnionCave1FParlyzHeals:
	itemball PARLYZ_HEAL, 4

UnionCave1FUnusedSign: ; unreferenced
	jumptext UnionCave1FUnusedSignText

HikerRussellSeenText:
	text "You're headed to"
	line "AZALEA, are you?"

	para "Let my #MON see"
	line "if you are good"
	cont "enough to battle."
	done

HikerRussellBeatenText:
	text "Oh, oh, oh!"
	done

HikerRussellAfterBattleText:
	text "All right, then!"
	line "I've decided."

	para "I'm not leaving"
	line "until my #MON"
	cont "get tougher!"
	done

PokemaniacLarrySeenText:
	text "I roam far and"
	line "wide in search of"
	cont "#MON."

	para "Are you looking"
	line "for #MON too?"

	para "Then you're my"
	line "collecting rival!"
	done

PokemaniacLarryBeatenText:
	text "Ugh. My poor #-"
	line "MON…"
	done

PokemaniacLarryAfterBattleText:
	text "Every Friday, you"
	line "can hear #MON"

	para "roars from deep"
	line "inside the cave."
	done

HikerDanielSeenText:
	text "Whoa! What a"
	line "surprise!"

	para "I didn't expect to"
	line "see anyone here!"
	done

HikerDanielBeatenText:
	text "Whoa! I'm beaten"
	line "big time!"
	done

HikerDanielAfterBattleText:
	text "I was conned into"
	line "buying a SLOWPOKE-"
	cont "TAIL."

	para "I feel sorry for"
	line "the poor #MON."
	done

FirebreatherBillSeenText:
	text "ZUBAT's SUPERSONIC"
	line "keeps confusing"
	cont "my #MON."

	para "I'm seriously"
	line "upset about that!"
	done

FirebreatherBillBeatenText:
	text "I flamed out!"
	done

FirebreatherBillAfterBattleText:
	text "On weekends, you"
	line "can hear strange"

	para "roars from deep in"
	line "the cave."
	done

FirebreatherRaySeenText:
	text "If it's light, a"
	line "cave isn't scary."

	para "If you're strong,"
	line "#MON aren't"
	cont "scary."
	done

FirebreatherRayBeatenText:
	text "FLASH!"
	done

FirebreatherRayAfterBattleText:
	text "It's my #MON's"
	line "fire that lights"
	cont "up this cave."
	done

UnionCave1FUnusedSignText:
	text "UNION CAVE"
	done

UnionCave1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 19, UNION_CAVE_B1F, 3
	warp_event  3, 33, UNION_CAVE_B1F, 4
	warp_event 17, 31, ROUTE_33, 1
	warp_event 17,  3, ROUTE_32, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerHikerDaniel, -1
	object_event  6, 22, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerPokemaniacLarry, -1
	object_event 10,  7, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerHikerRussell, -1
	object_event 17, 28, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerFirebreatherRay, -1
	object_event 11, 17, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerFirebreatherBill, -1
	object_event 14, 19, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_ROCK, OBJECTTYPE_ITEMBALL, 0, UnionCave1FStardust, EVENT_UNION_CAVE_1F_GREAT_BALL
	object_event  4,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCave1FPotions, EVENT_UNION_CAVE_1F_POTIONS
	object_event  4, 17, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCave1FEthers, EVENT_UNION_CAVE_1F_ETHERS
	object_event 12, 33, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCave1FParlyzHeals, EVENT_UNION_CAVE_1F_PARLYZ_HEALS
