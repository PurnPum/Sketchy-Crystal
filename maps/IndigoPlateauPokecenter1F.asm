	object_const_def
	const INDIGOPLATEAUPOKECENTER1F_NURSE
	const INDIGOPLATEAUPOKECENTER1F_CLERK
	const INDIGOPLATEAUPOKECENTER1F_COOLTRAINER_M
	const INDIGOPLATEAUPOKECENTER1F_RIVAL
	const INDIGOPLATEAUPOKECENTER1F_GRAMPS
	const INDIGOPLATEAUPOKECENTER1F_ABRA
	const INDIGOPLATEAUPOKECENTER1F_LANCE
	const INDIGOPLATEAUPOKECENTER1F_BRUNO
	const INDIGOPLATEAUPOKECENTER1F_KAREN
	const INDIGOPLATEAUPOKECENTER1F_WILL
	const INDIGOPLATEAUPOKECENTER1F_KOGA

IndigoPlateauPokecenter1F_MapScripts:
	def_scene_scripts
	scene_script IndigoPlateauPokecenter1FNoopScene, SCENE_INDIGOPLATEAUPOKECENTER1F_RIVAL_BATTLE

	def_callbacks
	callback MAPCALLBACK_NEWMAP, IndigoPlateauPokecenter1FPrepareElite4Callback

IndigoPlateauPokecenter1FNoopScene:
	end

IndigoPlateauPokecenter1FPrepareElite4Callback:
	setmapscene WILLS_ROOM, SCENE_WILLSROOM_LOCK_DOOR
	setmapscene KOGAS_ROOM, SCENE_KOGASROOM_LOCK_DOOR
	setmapscene BRUNOS_ROOM, SCENE_BRUNOSROOM_LOCK_DOOR
	setmapscene KARENS_ROOM, SCENE_KARENSROOM_LOCK_DOOR
	setmapscene LANCES_ROOM, SCENE_LANCESROOM_LOCK_DOOR
	setmapscene HALL_OF_FAME, SCENE_HALLOFFAME_ENTER
	clearevent EVENT_WILLS_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_WILLS_ROOM_EXIT_OPEN
	clearevent EVENT_KOGAS_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_KOGAS_ROOM_EXIT_OPEN
	clearevent EVENT_BRUNOS_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_BRUNOS_ROOM_EXIT_OPEN
	clearevent EVENT_KARENS_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_KARENS_ROOM_EXIT_OPEN
	clearevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_LANCES_ROOM_EXIT_OPEN
	clearevent EVENT_BEAT_ELITE_4_WILL
	clearevent EVENT_BEAT_ELITE_4_KOGA
	clearevent EVENT_BEAT_ELITE_4_BRUNO
	clearevent EVENT_BEAT_ELITE_4_KAREN
	clearevent EVENT_BEAT_CHAMPION_LANCE
	setevent EVENT_LANCES_ROOM_OAK_AND_MARY
	endcallback

IndigoPlateauPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

IndigoPlateauPokecenter1FClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_INDIGO_PLATEAU
	closetext
	end

IndigoPlateauPokecenter1FCooltrainerMScript:
	jumptextfaceplayer IndigoPlateauPokecenter1FCooltrainerMText

TeleportGuyScript:
	faceplayer
	opentext
	writetext TeleportGuyText1
	yesorno
	iffalse .No
	writetext TeleportGuyYesText
	waitbutton
	closetext
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	warp NEW_BARK_TOWN, 13, 6
	end

.No:
	writetext TeleportGuyNoText
	waitbutton
	closetext
	end

AbraScript:
	opentext
	writetext AbraText
	cry ABRA
	waitbutton
	closetext
	end


LancePostGameScript:
	opentext
	writetext LancePostGameText
	waitbutton
	closetext
	end

BrunoPostGameScript:
	opentext
	writetext BrunoPostGameText
	waitbutton
	closetext
	end

KarenPostGameScript:
	opentext
	writetext KarenPostGameText
	waitbutton
	closetext
	end
	
WillPostGameScript:
	opentext
	writetext WillPostGameText
	waitbutton
	closetext
	end
	
KogaPostGameScript:
	opentext
	writetext KogaPostGameText
	waitbutton
	closetext
	end

LancePostGameText:
	text "Oh, look who it is,"
	line "our newest CHAMPION"
	
	para "Remember that, as"
	line "the pokelaw states,"
	line "if you're on duty"
	line "you're obligated to"
	line "own 3 full restores"
	
	para "The police never"
	line "frisked me for them"
	line "but personally I"
	line "wouldn't risk it."
	
	para "Oh, what happened"
	line "to Agatha?"
	
	para "Suprisingly age is"
	line "not the reason she"
	line "stepped down from"
	line "her position."
	
	para "She actually grew"
	line "tired of being on"
	line "the same place"
	line "for so long."
	
	para "So she moved on,"
	line "to accomplish other"
	line "life goals."
	
	para "Our time is limited"
	line "and she has the"
	line "experience to know"
	line "it best."
	done
	
BrunoPostGameText:
	text "Hello CHAMPION."
	
	para "Hm?, you want to"
	line "know what happened"
	line "to the old members"
	line "of the ELITE FOUR?"
	
	para "Well, my old friend"
	line "LORELEI left to her"
	line "hometown in the"
	line "Sevii Islands."
	
	para "She left when Team"
	line "Rocket started to"
	line "cause trouble there"
	
	para "But eventually she"
	line "decided to resign"
	line "her position."
	
	para "Her showdown match"
	line "against WILL was"
	line "incredible, even"
	line "though she lost."
	done

KarenPostGameText:
	text "Welcome back,"
	line "CHAMPION."
	
	para "It appears as if"
	line "you look interested"
	line "in what happened to"
	line "the old ELITE FOUR."
	
	para "Agatha was actually"
	line "my mentor for a"
	line "long time."
	
	para "She fought for the"
	line "recognition of the"
	line "GHOST type as a"
	line "legitimate type."
	
	para "Originally ghosts"
	line "were taboo and also"
	line "feared as something"
	line "unnatural by almost"
	line "everyone."
	
	para "But she believed"
	line "in them and by pure"
	line "strenght and perse-"
	line "verance, the type"
	line "was recogniced by"
	line "the official league"
	line "after she crushed"
	line "everyone but LANCE."
	
	para "Funnily enough, the"
	line "exact same thing"
	line "happened with me."
	
	para "Dark types were"
	line "considered nothing"
	line "more than a pest."
	
	para "They were banished"
	line "from cities and"
	line "towns alike."
	
	para "And they were even"
	line "hunted down almost"
	line "to extinction."
	
	para "Thats why I stepped"
	line "in, to do what my"
	line "master taught me."
	
	para "After countless"
	line "battles I was able"
	line "to show the comple-"
	line "-xity of the DARK"
	line "type, and repeat"
	line "history."
	done
	
WillPostGameText:
	text "Oh hi! Its our new"
	line "official CHAMPION!"
	
	para "I am actually kinda"
	line "new as an ELITE"
	line "FOUR member."
	
	para "A few months ago I"
	line "was able to beat"
	line "the icy legend,"
	line "LORELEI, and earn"
	line "my position here."
	
	para "I am getting really"
	line "close to beating"
	line "KOGA and BRUNO but"
	line "their experience is"
	line "quite overwhelming."
	
	para "I come from SAFFRON"
	line "city. SABRINA is my"
	line "childhood rival."
	
	para "We both liked"
	line "PSYCHIC type #MON"
	line "a lot as kids!"
	
	para "Once she became a"
	line "GYM LEADER I knew"
	line "I had to push for-"
	line "-ward."
	
	para "I travelled around"
	line "the world for four"
	line "years, increasing"
	line "my knowledge and"
	line "power."
	
	para "And now I am here"
	line "And I think I got"
	line "pretty far out!"
	
	para "I will go visit her"
	line "soon. I would like"
	line "to get an ABRA and"
	line "she specializes in"
	line "that species of"
	line "#MON."
	done

KogaPostGameText:
	text "Fwahahahaha!"
	
	para "Welcome back to the"
	line "league, CHAMPION!"
	
	para "We gathered here to"
	line "chat with LANCE"
	line "before he leaves."
	
	para "He mentioned that"
	line "he will travel to"
	line "the Galar Region."
	
	para "Apparently there"
	line "is a very important"
	line "tournament that"
	line "happens there."
	
	para "It reminds me of"
	line "the time my comra-"
	line "-des went to the"
	line "UNOVA region to"
	line "take part on the"
	line "#MON World Champ-"
	line "-ionship."
	
	para "Sadly I couldn't"
	line "attend the event."
	
	para "I was too wrapped"
	line "up with my child."
	
	para "We spent a lot of"
	line "time training at"
	line "the FUCHSIA city's"
	line "GYM. But our fav-"
	line "-ourite spot was"
	line "the SAFARY ZONE."
	
	para "You will probably"
	line "meet her if you"
	line "haven't already."
	
	para "Don't hold back!"
	done
	
IndigoPlateauPokecenter1FCooltrainerMText:
	text "At the #MON"
	line "LEAGUE, you'll get"

	para "tested by the"
	line "ELITE FOUR."

	para "You have to beat"
	line "them all. If you"

	para "lose, you have to"
	line "start all over!"
	done

TeleportGuyText1:
	text "Ah! You're chal-"
	line "lenging the ELITE"

	para "FOUR? Are you sure"
	line "you're ready?"

	para "If you need to"
	line "train some more,"

	para "my ABRA can help"
	line "you."

	para "It can TELEPORT"
	line "you home."

	para "Would you like to"
	line "go home now?"
	done

TeleportGuyYesText:
	text "OK, OK. Picture"
	line "your house in your"
	cont "mind…"
	done

TeleportGuyNoText:
	text "OK, OK. The best"
	line "of luck to you!"
	done

AbraText:
	text "ABRA: Aabra…"
	done

IndigoPlateauPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 13, ROUTE_23, 1
	warp_event  6, 13, ROUTE_23, 2
	warp_event  0, 13, POKECENTER_2F, 1
	warp_event 14,  3, WILLS_ROOM, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  7, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IndigoPlateauPokecenter1FNurseScript, -1
	object_event 11,  7, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IndigoPlateauPokecenter1FClerkScript, -1
	object_event 11, 11, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IndigoPlateauPokecenter1FCooltrainerMScript, -1
	object_event  1,  9, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TeleportGuyScript, EVENT_TELEPORT_GUY
	object_event  0,  9, SPRITE_JYNX, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, AbraScript, EVENT_TELEPORT_GUY
	object_event  14, 9, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LancePostGameScript, EVENT_BEAT_ELITE_FOUR
	object_event  16, 11, SPRITE_BRUNO, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BrunoPostGameScript, EVENT_BEAT_ELITE_FOUR
	object_event  16, 9, SPRITE_KAREN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KarenPostGameScript, EVENT_BEAT_ELITE_FOUR
	object_event  17, 10, SPRITE_WILL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WillPostGameScript, EVENT_BEAT_ELITE_FOUR
	object_event  15, 11, SPRITE_KOGA, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KogaPostGameScript, EVENT_BEAT_ELITE_FOUR