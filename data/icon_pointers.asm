IconPointers:
; entries correspond to ICON_* constants (see constants/icon_constants.asm)
	table_width 2, IconPointers
	dw NullIcon
	dw PoliwagIcon
	dw JigglypuffIcon
	dw DiglettIcon
	dw PikachuIcon
	dw StaryuIcon
	dw FishIcon
	dw BirdIcon
	dw MonsterIcon
	dw ClefairyIcon
	dw OddishIcon
	dw BugIcon
	dw GhostIcon
	dw LaprasIcon
	dw HumanshapeIcon
	dw FoxIcon
	dw EquineIcon
	dw ShellIcon
	dw BlobIcon
	dw SerpentIcon
	dw VoltorbIcon
	dw SquirtleIcon
	dw BulbasaurIcon
	dw CharmanderIcon
	dw CaterpillarIcon
	dw UnownIcon
	dw GeodudeIcon
	dw FighterIcon
	dw EggIcon
	dw JellyfishIcon
	dw MothIcon
	dw BatIcon
	dw SnorlaxIcon
	dw HoOhIcon
	dw LugiaIcon
	dw GyaradosIcon
	dw SlowpokeIcon
	dw SudowoodoIcon
	dw BigmonIcon
	dw BalloonsIcon
	dw BalloonsOWChrisIcon
	dw BalloonsOWKrisIcon
	assert_table_length NUM_ICONS + 1

TypeIconPointers:
; entries correspond to TYPEICON_* constants (see constants/icon_constants.asm)
	table_width 2, TypeIconPointers
	dw GhostTypeIcon
	dw DarkTypeIcon
	dw NormalTypeIcon
	dw GroundTypeIcon
	dw FireTypeIcon
	dw PsychicTypeIcon
	dw FightingTypeIcon
	dw FlyingTypeIcon
	dw PoisonTypeIcon
	dw RockTypeIcon
	dw GrassTypeIcon
	dw BugTypeIcon
	dw SteelTypeIcon
	dw DragonTypeIcon
	dw WaterTypeIcon
	dw ElectricTypeIcon
	dw IceTypeIcon
	assert_table_length NUM_TYPE_ICONS + 1
	
TypeIconPalPointers:
; entries correspond to TYPEICONPAL_* constants (see constants/icon_constants.asm)
	table_width 2, TypeIconPalPointers
	dw GhostTypeIconPal
	dw DarkTypeIconPal
	dw NormalTypeIconPal
	dw GroundTypeIconPal
	dw FireTypeIconPal
	dw PsychicTypeIconPal
	dw FightingTypeIconPal
	dw FlyingTypeIconPal
	dw PoisonTypeIconPal
	dw RockTypeIconPal
	dw GrassTypeIconPal
	dw BugTypeIconPal
	dw SteelTypeIconPal
	dw DragonTypeIconPal
	dw WaterTypeIconPal
	dw ElectricTypeIconPal
	dw IceTypeIconPal
	assert_table_length NUM_TYPE_ICONS + 1