DEF MELTING_CAVE_CRACKING_ICE_0_LOWER_LEFT_BLOCK EQU $30
DEF MELTING_CAVE_CRACKING_ICE_1_LOWER_LEFT_BLOCK EQU $31
DEF MELTING_CAVE_CRACKING_ICE_2_LOWER_LEFT_BLOCK EQU $32
DEF MELTING_CAVE_CRACKING_ICE_0_LOWER_RIGHT_BLOCK EQU $34
DEF MELTING_CAVE_CRACKING_ICE_1_LOWER_RIGHT_BLOCK EQU $35
DEF MELTING_CAVE_CRACKING_ICE_2_LOWER_RIGHT_BLOCK EQU $36
DEF MELTING_CAVE_CRACKING_ICE_0_UPPER_LEFT_BLOCK EQU $3C
DEF MELTING_CAVE_CRACKING_ICE_1_UPPER_LEFT_BLOCK EQU $3D
DEF MELTING_CAVE_CRACKING_ICE_2_UPPER_LEFT_BLOCK EQU $33
DEF MELTING_CAVE_CRACKING_ICE_0_UPPER_RIGHT_BLOCK EQU $60
DEF MELTING_CAVE_CRACKING_ICE_1_UPPER_RIGHT_BLOCK EQU $61
DEF MELTING_CAVE_CRACKING_ICE_2_UPPER_RIGHT_BLOCK EQU $62

MeltingCave_MapScripts:
	def_scene_scripts

	def_callbacks

MeltingCave_CrackingIce1:
	checkevent EVENT_CRACKING_ICE_STAGE_1_A
	iffalse .first_crack
	checkevent EVENT_CRACKING_ICE_STAGE_2_A
	iffalse .second_crack
	end
	
.first_crack
	setevent EVENT_CRACKING_ICE_STAGE_1_A
	clearevent EVENT_CRACKING_ICE_STAGE_2_A
	playsound SFX_SHINE
	changeblock 24, 2, MELTING_CAVE_CRACKING_ICE_1_LOWER_RIGHT_BLOCK
	callasm MeltingCave_Aux
	end
	
.second_crack
	setevent EVENT_CRACKING_ICE_STAGE_2_A
	clearevent EVENT_CRACKING_ICE_STAGE_1_A
	playsound SFX_SUPER_EFFECTIVE
	changeblock 24, 2, MELTING_CAVE_CRACKING_ICE_2_LOWER_RIGHT_BLOCK
	callasm MeltingCave_Aux
	end
	
MeltingCave_CrackingIce2:
	playsound SFX_SUPER_EFFECTIVE
	changeblock 18, 14, MELTING_CAVE_CRACKING_ICE_2_UPPER_LEFT_BLOCK
	callasm MeltingCave_Aux
	end
	
MeltingCave_CrackingIce3:
	checkevent EVENT_CRACKING_ICE_STAGE_1_B
	iffalse .first_crack
	checkevent EVENT_CRACKING_ICE_STAGE_2_B
	iffalse .second_crack
	end
	
.first_crack
	setevent EVENT_CRACKING_ICE_STAGE_1_B
	clearevent EVENT_CRACKING_ICE_STAGE_2_B
	playsound SFX_SHINE
	changeblock 18, 16, MELTING_CAVE_CRACKING_ICE_1_UPPER_LEFT_BLOCK
	callasm MeltingCave_Aux
	end
	
.second_crack
	setevent EVENT_CRACKING_ICE_STAGE_2_B
	clearevent EVENT_CRACKING_ICE_STAGE_1_B
	playsound SFX_SUPER_EFFECTIVE
	changeblock 18, 16, MELTING_CAVE_CRACKING_ICE_2_UPPER_LEFT_BLOCK
	callasm MeltingCave_Aux
	end
	
MeltingCave_CrackingIce4:
	playsound SFX_SUPER_EFFECTIVE
	changeblock 12, 10, MELTING_CAVE_CRACKING_ICE_2_UPPER_RIGHT_BLOCK
	callasm MeltingCave_Aux
	end
	
MeltingCave_CrackingIce5:
	checkevent EVENT_CRACKING_ICE_STAGE_1_C
	iffalse .first_crack
	checkevent EVENT_CRACKING_ICE_STAGE_2_C
	iffalse .second_crack
	end
	
.first_crack
	setevent EVENT_CRACKING_ICE_STAGE_1_C
	clearevent EVENT_CRACKING_ICE_STAGE_2_C
	playsound SFX_SHINE
	changeblock 10, 12, MELTING_CAVE_CRACKING_ICE_1_UPPER_RIGHT_BLOCK
	callasm MeltingCave_Aux
	end
	
.second_crack
	setevent EVENT_CRACKING_ICE_STAGE_2_C
	clearevent EVENT_CRACKING_ICE_STAGE_1_C
	playsound SFX_SUPER_EFFECTIVE
	changeblock 10, 12, MELTING_CAVE_CRACKING_ICE_2_UPPER_RIGHT_BLOCK
	callasm MeltingCave_Aux
	end

MeltingCave_Aux:
	farcall ReanchorBGMap_NoOAMUpdate
	call _OpenAndCloseMenu_HDMATransferTilemapAndAttrmap
	ret

MeltingCaveSwinub:
	opentext
	writetext MeltingCaveSwinubFixIceText
	waitbutton
	changeblock 18, 16, MELTING_CAVE_CRACKING_ICE_0_UPPER_LEFT_BLOCK
	changeblock 18, 14, MELTING_CAVE_CRACKING_ICE_1_UPPER_LEFT_BLOCK
	changeblock 12, 10, MELTING_CAVE_CRACKING_ICE_1_UPPER_RIGHT_BLOCK
	changeblock 10, 12, MELTING_CAVE_CRACKING_ICE_0_UPPER_RIGHT_BLOCK
	playsound SFX_SHINE
	closetext
	end
	
MeltingCaveSwinubFixIceText:
	text "SWINUB'll reset all"
	line "the ice holes."
	done
	
MeltingCaveBigPearl:
	itemball BIG_PEARL

MeltingCavePotions:
	itemball POTION, 5

MeltingCaveProteins:
	itemball PROTEIN, 2

MeltingCaveCalciums:
	itemball CALCIUM, 2

MeltingCavePPUP:
	itemball PP_UP

MeltingCave_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  5, DARK_CAVE_MELTING_CAVE_CONNECTOR, 2

	def_coord_events

	coord_event 25,  3, SCENE_ALWAYS, MeltingCave_CrackingIce1
	coord_event 18, 14, SCENE_ALWAYS, MeltingCave_CrackingIce2
	coord_event 18, 16, SCENE_ALWAYS, MeltingCave_CrackingIce3
	coord_event 13, 10, SCENE_ALWAYS, MeltingCave_CrackingIce4
	coord_event 11, 12, SCENE_ALWAYS, MeltingCave_CrackingIce5

	def_bg_events

	def_object_events
	object_event  25, 15, SPRITE_SWINUB, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MeltingCaveSwinub, -1
	object_event  5, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_ROCK, OBJECTTYPE_ITEMBALL, 0, MeltingCaveBigPearl, EVENT_MELTING_CAVE_BIG_PEARL
	object_event 30,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MeltingCaveCalciums, EVENT_MELTING_CAVE_CALCIUMS
	object_event  3, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MeltingCavePPUP, EVENT_MELTING_CAVE_PP_UP
	object_event 33,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MeltingCavePotions, EVENT_MELTING_CAVE_POTIONS
	object_event  9, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MeltingCaveProteins, EVENT_MELTING_CAVE_PROTEINS
