MACRO type_icon_pal
; # type ID, Icon Address, Pal Address 
	db \1
	dw \2
	dw \3
ENDM

TypeIconMatches:
	table_width 5, TypeIconMatches
	type_icon_pal 0, GhostTypeIcon, GhostTypeIconPal
	type_icon_pal 1, DarkTypeIcon, DarkTypeIconPal
	type_icon_pal 2, NormalTypeIcon, NormalTypeIconPal
	type_icon_pal 3, GroundTypeIcon, GroundTypeIconPal
	type_icon_pal 4, FireTypeIcon, FireTypeIconPal
	type_icon_pal 5, PsychicTypeIcon, PsychicTypeIconPal
	type_icon_pal 6, FightingTypeIcon, FightingTypeIconPal
	type_icon_pal 7, FlyingTypeIcon, FlyingTypeIconPal
	type_icon_pal 8, PoisonTypeIcon, PoisonTypeIconPal
	type_icon_pal 9, RockTypeIcon, RockTypeIconPal
	type_icon_pal 10, GrassTypeIcon, GrassTypeIconPal
	type_icon_pal 11, BugTypeIcon, BugTypeIconPal
	type_icon_pal 12, SteelTypeIcon, SteelTypeIconPal
	type_icon_pal 13, DragonTypeIcon, DragonTypeIconPal
	type_icon_pal 14, WaterTypeIcon, WaterTypeIconPal
	type_icon_pal 15, ElectricTypeIcon, ElectricTypeIconPal
	type_icon_pal 16, IceTypeIcon, IceTypeIconPal
	assert_table_length NUM_TYPE_ICONS + 1
	
TypeIconPositions:
	table_width 4, TypeIconPositions
	db $80, 1, 0, $C7   ; Enemy mon, first type
	db $81, 3, 0, $CB   ; Enemy mon, second type
	db $82, 10, 7, $D7  ; Your mon, first type
	db $83, 12, 7, $DB  ; Your mon, second type
	db $84, 17, 3, $CB	; Move type
