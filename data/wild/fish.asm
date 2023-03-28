DEF time_group EQUS "0," ; use the nth TimeFishGroups entry

MACRO fishgroup
; chance, old rod, good rod, super rod
	db \1
	dw \2, \3, \4
ENDM

FishGroups:
; entries correspond to FISHGROUP_* constants
	table_width FISHGROUP_DATA_LENGTH, FishGroups
	fishgroup 95 percent + 1, .NEWBARK_Old,				.NEWBARK_Good,				.NEWBARK_Super
	fishgroup 95 percent + 1, .CHERRYGROVE_Old,			.CHERRYGROVE_Good,			.CHERRYGROVE_Super
	fishgroup 95 percent + 1, .ROUTE30_Old,				.ROUTE30_Good,				.ROUTE30_Super
	fishgroup 95 percent + 1, .ROUTE31_Old,				.ROUTE31_Good,				.ROUTE31_Super
	fishgroup 95 percent + 1, .DARKCAVEVIOLET_Old,		.DARKCAVEVIOLET_Good,		.DARKCAVEVIOLET_Super
	fishgroup 95 percent + 1, .DARKCAVEROUTE46_Old,		.DARKCAVEROUTE46_Good,		.DARKCAVEROUTE46_Super
	fishgroup 95 percent + 1, .VIOLET_Old,				.VIOLET_Good,				.VIOLET_Super
	fishgroup 95 percent + 1, .RUINSALPH_Old,			.RUINSALPH_Good,			.RUINSALPH_Super
	fishgroup 95 percent + 1, .ROUTE32_Old,				.ROUTE32_Good,				.ROUTE32_Super
	fishgroup 95 percent + 1, .UNION1F_Old,				.UNION1F_Good,				.UNION1F_Super
	fishgroup 95 percent + 1, .UNIONB1F_Old,			.UNIONB1F_Good,				.UNIONB1F_Super
	fishgroup 95 percent + 1, .UNIONB2F_Old,			.UNIONB2F_Good,				.UNIONB2F_Super
	fishgroup 95 percent + 1, .SLOWPOKEWELL_Old,		.SLOWPOKEWELL_Good,			.SLOWPOKEWELL_Super
	fishgroup 95 percent + 1, .AZALEA_Old,				.AZALEA_Good,				.AZALEA_Super
	fishgroup 95 percent + 1, .ILEX_Old,				.ILEX_Good,					.ILEX_Super
	fishgroup 95 percent + 1, .ROUTE34_Old,				.ROUTE34_Good,				.ROUTE34_Super
	fishgroup 95 percent + 1, .GOLDENROD_Old,			.GOLDENROD_Good,			.GOLDENROD_Super
	fishgroup 95 percent + 1, .ROUTE35_Old,				.ROUTE35_Good,				.ROUTE35_Super
	fishgroup 95 percent + 1, .NATIONALPARK_Old,		.NATIONALPARK_Good,			.NATIONALPARK_Super
	fishgroup 95 percent + 1, .ECRUTEAK_Old,			.ECRUTEAK_Good,				.ECRUTEAK_Super
	fishgroup 95 percent + 1, .ROUTE38_Old,				.ROUTE38_Good,				.ROUTE38_Super
	fishgroup 95 percent + 1, .OLIVINE_Old,				.OLIVINE_Good,				.OLIVINE_Super
	fishgroup 95 percent + 1, .ROUTE40_Old,				.ROUTE40_Good,				.ROUTE40_Super
	fishgroup 95 percent + 1, .ROUTE41_Old,				.ROUTE41_Good,				.ROUTE41_Super
	fishgroup 95 percent + 1, .CIANWOOD_Old,			.CIANWOOD_Good,				.CIANWOOD_Super
	fishgroup 95 percent + 1, .ROUTE42_Old,				.ROUTE42_Good,				.ROUTE42_Super
	fishgroup 95 percent + 1, .ROUTE43_Old,				.ROUTE43_Good,				.ROUTE43_Super
	fishgroup 95 percent + 1, .MTMORTAR_Old,			.MTMORTAR_Good,				.MTMORTAR_Super
	fishgroup 95 percent + 1, .LAKEOFRAGE_Old,			.LAKEOFRAGE_Good,			.LAKEOFRAGE_Super
	fishgroup 95 percent + 1, .ROUTE44_Old,				.ROUTE44_Good,				.ROUTE44_Super
	fishgroup 95 percent + 1, .BLACKTHORN_Old,			.BLACKTHORN_Good,			.BLACKTHORN_Super
	fishgroup 95 percent + 1, .DRAGONSDEN_Old,			.DRAGONSDEN_Good,			.DRAGONSDEN_Super
	fishgroup 95 percent + 1, .ROUTE45_Old,				.ROUTE45_Good,				.ROUTE45_Super
	fishgroup 95 percent + 1, .ROUTE27_Old,				.ROUTE27_Good,				.ROUTE27_Super
	fishgroup 95 percent + 1, .TOHJOFALLS_Old,			.TOHJOFALLS_Good,			.TOHJOFALLS_Super
	fishgroup 95 percent + 1, .ROUTE26_Old,				.ROUTE26_Good,				.ROUTE26_Super
	fishgroup 95 percent + 1, .ROUTE22_Old,				.ROUTE22_Good,				.ROUTE22_Super
	fishgroup 95 percent + 1, .VIRIDIAN_Old,			.VIRIDIAN_Good,				.VIRIDIAN_Super
	fishgroup 95 percent + 1, .CERULEAN_Old,			.CERULEAN_Good,				.CERULEAN_Super
	fishgroup 95 percent + 1, .ROUTE24_Old,				.ROUTE24_Good,				.ROUTE24_Super
	fishgroup 95 percent + 1, .ROUTE25_Old,				.ROUTE25_Good,				.ROUTE25_Super
	fishgroup 95 percent + 1, .ROUTE6_Old,				.ROUTE6_Good,				.ROUTE6_Super
	fishgroup 95 percent + 1, .VERMILLION_Old,			.VERMILLION_Good,			.VERMILLION_Super
	fishgroup 95 percent + 1, .ROCKTUNNEL_Old,			.ROCKTUNNEL_Good,			.ROCKTUNNEL_Super
	fishgroup 95 percent + 1, .ROUTE9_Old,				.ROUTE9_Good,				.ROUTE9_Super
	fishgroup 95 percent + 1, .ROUTE10NORTH_Old,		.ROUTE10NORTH_Good,			.ROUTE10NORTH_Super
	fishgroup 95 percent + 1, .ROUTE12_Old,				.ROUTE12_Good,				.ROUTE12_Super
	fishgroup 95 percent + 1, .ROUTE13_Old,				.ROUTE13_Good,				.ROUTE13_Super
	fishgroup 95 percent + 1, .ROUTE14_Old,				.ROUTE14_Good,				.ROUTE14_Super
	fishgroup 95 percent + 1, .ROUTE18_Old,				.ROUTE18_Good,				.ROUTE18_Super
	fishgroup 95 percent + 1, .ROUTE19_Old,				.ROUTE19_Good,				.ROUTE19_Super
	fishgroup 95 percent + 1, .ROUTE20_Old,				.ROUTE20_Good,				.ROUTE20_Super
	fishgroup 95 percent + 1, .ROUTE21_Old,				.ROUTE21_Good,				.ROUTE21_Super
	fishgroup 95 percent + 1, .CELADON_Old,				.CELADON_Good,				.CELADON_Super
	fishgroup 95 percent + 1, .PALLET_Old,				.PALLET_Good,				.PALLET_Super
	fishgroup 95 percent + 1, .FUCHSIA_Old,				.FUCHSIA_Good,				.FUCHSIA_Super
	fishgroup 95 percent + 1, .CINNABAR_Old,			.CINNABAR_Good,				.CINNABAR_Super
	fishgroup 95 percent + 1, .VICTORYROAD_Old,			.VICTORYROAD_Good,			.VICTORYROAD_Super
	fishgroup 95 percent + 1, .ROUTE28_Old,				.ROUTE28_Good,				.ROUTE28_Super
	fishgroup 95 percent + 1, .SILVER_Old,				.SILVER_Good,				.SILVER_Super
	fishgroup 95 percent + 1, .WHIRL_ISLANDS_Old,		.WHIRL_ISLANDS_Good,		.WHIRL_ISLANDS_Super


	assert_table_length NUM_FISHGROUPS

.NEWBARK_Old:
	db 100 percent,	WOOPER,		2

.NEWBARK_Good:
	db 100 percent,	QUAGSIRE,	2

.NEWBARK_Super:
	db 100 percent,	QUAGSIRE,	2

.CHERRYGROVE_Old:
	db 100 percent,	CORSOLA,	3

.CHERRYGROVE_Good:
	db 100 percent,	CORSOLA,	3

.CHERRYGROVE_Super:
	db 100 percent,	CORSOLA,	3

.ROUTE30_Old:
	db 100 percent,	POLIWAG,	4

.ROUTE30_Good:
	db 100 percent,	POLIWHIRL,	4

.ROUTE30_Super:
	db 100 percent,	POLITOED,	4

.ROUTE31_Old:
	db 100 percent,	HORSEA,		5

.ROUTE31_Good:
	db 100 percent,	SEADRA,		5

.ROUTE31_Super:
	db 100 percent,	KINGDRA,	5

.DARKCAVEVIOLET_Old:
	db 100 percent,	MARILL,		5

.DARKCAVEVIOLET_Good:
	db 100 percent,	AZUMARILL,	5

.DARKCAVEVIOLET_Super:
	db 100 percent,	AZUMARILL,	5

.DARKCAVEROUTE46_Old:
	db 100 percent,	WOOPER,		6

.DARKCAVEROUTE46_Good:
	db 100 percent,	QUAGSIRE,	6

.DARKCAVEROUTE46_Super:
	db 100 percent,	QUAGSIRE,	6

.VIOLET_Old:
	db 100 percent,	SHELLDER,	6

.VIOLET_Good:
	db 100 percent,	SHELLDER,	6

.VIOLET_Super:
	db 100 percent,	CLOYSTER,	6

.RUINSALPH_Old:
	db 100 percent,	PSYDUCK,	7

.RUINSALPH_Good:
	db 100 percent,	PSYDUCK,	7

.RUINSALPH_Super:
	db 100 percent,	GOLDUCK,	7

.ROUTE32_Old:
	db 100 percent,	REMORAID,	8

.ROUTE32_Good:
	db 100 percent,	REMORAID,	8

.ROUTE32_Super:
	db 100 percent,	OCTILLERY,	8

.UNION1F_Old:
	db 100 percent,	OMANYTE,	9

.UNION1F_Good:
	db 100 percent,	OMANYTE,	9

.UNION1F_Super:
	db 100 percent,	OMASTAR,	9

.UNIONB1F_Old:
	db 100 percent,	KABUTO,		9

.UNIONB1F_Good:
	db 100 percent,	KABUTO,		9

.UNIONB1F_Super:
	db 100 percent,	KABUTOPS,	9
	
.UNIONB2F_Old:
	db 100 percent,	SQUIRTLE,	9

.UNIONB2F_Good:
	db 100 percent,	WARTORTLE,	9

.UNIONB2F_Super:
	db 100 percent,	BLASTOISE,	9

.SLOWPOKEWELL_Old:
	db 100 percent,	SEEL,		11

.SLOWPOKEWELL_Good:
	db 100 percent,	SEEL,		11

.SLOWPOKEWELL_Super:
	db 100 percent,	DEWGONG,	11
	
.AZALEA_Old:
	db 100 percent,	QWILFISH,	11

.AZALEA_Good:
	db 100 percent,	QWILFISH,	11

.AZALEA_Super:
	db 100 percent,	QWILFISH,	11

.ILEX_Old:
	db 100 percent,	CHINCHOU,	15

.ILEX_Good:
	db 100 percent,	LANTURN,	15

.ILEX_Super:
	db 100 percent,	LANTURN,	15

.ROUTE34_Old:
	db 100 percent,	GOLDEEN,	15

.ROUTE34_Good:
	db 100 percent,	SEAKING,	15

.ROUTE34_Super:
	db 100 percent,	SEAKING,	15

.GOLDENROD_Old:
	db 100 percent,	STARYU,		16

.GOLDENROD_Good:
	db 100 percent,	STARYU,		16

.GOLDENROD_Super:
	db 100 percent,	STARMIE,	16

.ROUTE35_Old:
	db 100 percent,	KRABBY,	10

.ROUTE35_Good:
	db 100 percent,	KRABBY,	10

.ROUTE35_Super:
	db 100 percent,	KRABBY,	10

.NATIONALPARK_Old:
	db 100 percent,	KRABBY,	10

.NATIONALPARK_Good:
	db 100 percent,	KRABBY,	10

.NATIONALPARK_Super:
	db 100 percent,	KRABBY,	10

.ECRUTEAK_Old:
	db 100 percent,	KRABBY,	10

.ECRUTEAK_Good:
	db 100 percent,	KRABBY,	10

.ECRUTEAK_Super:
	db 100 percent,	KRABBY,	10

.ROUTE38_Old:
	db 100 percent,	KRABBY,	10

.ROUTE38_Good:
	db 100 percent,	KRABBY,	10

.ROUTE38_Super:
	db 100 percent,	KRABBY,	10

.OLIVINE_Old:
	db 100 percent,	KRABBY,	10

.OLIVINE_Good:
	db 100 percent,	KRABBY,	10

.OLIVINE_Super:
	db 100 percent,	KRABBY,	10

.ROUTE40_Old:
	db 100 percent,	KRABBY,	10

.ROUTE40_Good:
	db 100 percent,	KRABBY,	10

.ROUTE40_Super:
	db 100 percent,	KRABBY,	10

.ROUTE41_Old:
	db 100 percent,	KRABBY,	10

.ROUTE41_Good:
	db 100 percent,	KRABBY,	10

.ROUTE41_Super:
	db 100 percent,	KRABBY,	10

.CIANWOOD_Old:
	db 100 percent,	KRABBY,	10

.CIANWOOD_Good:
	db 100 percent,	KRABBY,	10

.CIANWOOD_Super:
	db 100 percent,	KRABBY,	10

.ROUTE42_Old:
	db 100 percent,	KRABBY,	10

.ROUTE42_Good:
	db 100 percent,	KRABBY,	10

.ROUTE42_Super:
	db 100 percent,	KRABBY,	10

.ROUTE43_Old:
	db 100 percent,	KRABBY,	10

.ROUTE43_Good:
	db 100 percent,	KRABBY,	10

.ROUTE43_Super:
	db 100 percent,	KRABBY,	10

.MTMORTAR_Old:
	db 100 percent,	KRABBY,	10

.MTMORTAR_Good:
	db 100 percent,	KRABBY,	10

.MTMORTAR_Super:
	db 100 percent,	KRABBY,	10

.LAKEOFRAGE_Old:
	db 100 percent,	KRABBY,	10

.LAKEOFRAGE_Good:
	db 100 percent,	KRABBY,	10

.LAKEOFRAGE_Super:
	db 100 percent,	KRABBY,	10

.ROUTE44_Old:
	db 100 percent,	KRABBY,	10

.ROUTE44_Good:
	db 100 percent,	KRABBY,	10

.ROUTE44_Super:
	db 100 percent,	KRABBY,	10

.BLACKTHORN_Old:
	db 100 percent,	KRABBY,	10

.BLACKTHORN_Good:
	db 100 percent,	KRABBY,	10

.BLACKTHORN_Super:
	db 100 percent,	KRABBY,	10

.DRAGONSDEN_Old:
	db 100 percent,	KRABBY,	10

.DRAGONSDEN_Good:
	db 100 percent,	KRABBY,	10

.DRAGONSDEN_Super:
	db 100 percent,	KRABBY,	10

.ROUTE45_Old:
	db 100 percent,	KRABBY,	10

.ROUTE45_Good:
	db 100 percent,	KRABBY,	10

.ROUTE45_Super:
	db 100 percent,	KRABBY,	10

.ROUTE27_Old:
	db 100 percent,	KRABBY,	10

.ROUTE27_Good:
	db 100 percent,	KRABBY,	10

.ROUTE27_Super:
	db 100 percent,	KRABBY,	10

.TOHJOFALLS_Old:
	db 100 percent,	KRABBY,	10

.TOHJOFALLS_Good:
	db 100 percent,	KRABBY,	10

.TOHJOFALLS_Super:
	db 100 percent,	KRABBY,	10

.ROUTE26_Old:
	db 100 percent,	KRABBY,	10

.ROUTE26_Good:
	db 100 percent,	KRABBY,	10

.ROUTE26_Super:
	db 100 percent,	KRABBY,	10

.ROUTE22_Old:
	db 100 percent,	KRABBY,	10

.ROUTE22_Good:
	db 100 percent,	KRABBY,	10

.ROUTE22_Super:
	db 100 percent,	KRABBY,	10

.VIRIDIAN_Old:
	db 100 percent,	KRABBY,	10

.VIRIDIAN_Good:
	db 100 percent,	KRABBY,	10

.VIRIDIAN_Super:
	db 100 percent,	KRABBY,	10

.CERULEAN_Old:
	db 100 percent,	KRABBY,	10

.CERULEAN_Good:
	db 100 percent,	KRABBY,	10

.CERULEAN_Super:
	db 100 percent,	KRABBY,	10

.ROUTE24_Old:
	db 100 percent,	KRABBY,	10

.ROUTE24_Good:
	db 100 percent,	KRABBY,	10

.ROUTE24_Super:
	db 100 percent,	KRABBY,	10

.ROUTE25_Old:
	db 100 percent,	KRABBY,	10

.ROUTE25_Good:
	db 100 percent,	KRABBY,	10

.ROUTE25_Super:
	db 100 percent,	KRABBY,	10

.ROUTE6_Old:
	db 100 percent,	KRABBY,	10

.ROUTE6_Good:
	db 100 percent,	KRABBY,	10

.ROUTE6_Super:
	db 100 percent,	KRABBY,	10

.VERMILLION_Old:
	db 100 percent,	KRABBY,	10

.VERMILLION_Good:
	db 100 percent,	KRABBY,	10

.VERMILLION_Super:
	db 100 percent,	KRABBY,	10

.ROCKTUNNEL_Old:
	db 100 percent,	KRABBY,	10

.ROCKTUNNEL_Good:
	db 100 percent,	KRABBY,	10

.ROCKTUNNEL_Super:
	db 100 percent,	KRABBY,	10

.ROUTE9_Old:
	db 100 percent,	KRABBY,	10

.ROUTE9_Good:
	db 100 percent,	KRABBY,	10

.ROUTE9_Super:
	db 100 percent,	KRABBY,	10

.ROUTE10NORTH_Old:
	db 100 percent,	KRABBY,	10

.ROUTE10NORTH_Good:
	db 100 percent,	KRABBY,	10

.ROUTE10NORTH_Super:
	db 100 percent,	KRABBY,	10

.ROUTE12_Old:
	db 100 percent,	KRABBY,	10

.ROUTE12_Good:
	db 100 percent,	KRABBY,	10

.ROUTE12_Super:
	db 100 percent,	KRABBY,	10

.ROUTE13_Old:
	db 100 percent,	KRABBY,	10

.ROUTE13_Good:
	db 100 percent,	KRABBY,	10

.ROUTE13_Super:
	db 100 percent,	KRABBY,	10

.ROUTE14_Old:
	db 100 percent,	KRABBY,	10

.ROUTE14_Good:
	db 100 percent,	KRABBY,	10

.ROUTE14_Super:
	db 100 percent,	KRABBY,	10

.ROUTE18_Old:
	db 100 percent,	KRABBY,	10

.ROUTE18_Good:
	db 100 percent,	KRABBY,	10

.ROUTE18_Super:
	db 100 percent,	KRABBY,	10

.ROUTE19_Old:
	db 100 percent,	KRABBY,	10

.ROUTE19_Good:
	db 100 percent,	KRABBY,	10

.ROUTE19_Super:
	db 100 percent,	KRABBY,	10

.ROUTE20_Old:
	db 100 percent,	KRABBY,	10

.ROUTE20_Good:
	db 100 percent,	KRABBY,	10

.ROUTE20_Super:
	db 100 percent,	KRABBY,	10

.ROUTE21_Old:
	db 100 percent,	KRABBY,	10

.ROUTE21_Good:
	db 100 percent,	KRABBY,	10

.ROUTE21_Super:
	db 100 percent,	KRABBY,	10

.CELADON_Old:
	db 100 percent,	KRABBY,	10

.CELADON_Good:
	db 100 percent,	KRABBY,	10

.CELADON_Super:
	db 100 percent,	KRABBY,	10

.PALLET_Old:
	db 100 percent,	KRABBY,	10

.PALLET_Good:
	db 100 percent,	KRABBY,	10

.PALLET_Super:
	db 100 percent,	KRABBY,	10

.FUCHSIA_Old:
	db 100 percent,	KRABBY,	10

.FUCHSIA_Good:
	db 100 percent,	KRABBY,	10

.FUCHSIA_Super:
	db 100 percent,	KRABBY,	10

.CINNABAR_Old:
	db 100 percent,	KRABBY,	10

.CINNABAR_Good:
	db 100 percent,	KRABBY,	10

.CINNABAR_Super:
	db 100 percent,	KRABBY,	10

.VICTORYROAD_Old:
	db 100 percent,	KRABBY,	10

.VICTORYROAD_Good:
	db 100 percent,	KRABBY,	10

.VICTORYROAD_Super:
	db 100 percent,	KRABBY,	10

.ROUTE28_Old:
	db 100 percent,	KRABBY,	10

.ROUTE28_Good:
	db 100 percent,	KRABBY,	10

.ROUTE28_Super:
	db 100 percent,	KRABBY,	10

.SILVER_Old:
	db 100 percent,	KRABBY,	10

.SILVER_Good:
	db 100 percent,	KRABBY,	10

.SILVER_Super:
	db 100 percent,	KRABBY,	10

.WHIRL_ISLANDS_Old:
	db 100 percent,	KRABBY,	10

.WHIRL_ISLANDS_Good:
	db 100 percent,	KRABBY,	10

.WHIRL_ISLANDS_Super:
	db 100 percent,	KRABBY,	10

TimeFishGroups: ;Will go unused since no time_groups are used in the tables
	;  day              nite
	db CORSOLA,    20,  STARYU,     20 ; 0
	db CORSOLA,    40,  STARYU,     40 ; 1
	db SHELLDER,   20,  SHELLDER,   20 ; 2
	db SHELLDER,   40,  SHELLDER,   40 ; 3
	db GOLDEEN,    20,  GOLDEEN,    20 ; 4
	db GOLDEEN,    40,  GOLDEEN,    40 ; 5
	db POLIWAG,    20,  POLIWAG,    20 ; 6
	db POLIWAG,    40,  POLIWAG,    40 ; 7
	db DRATINI,    20,  DRATINI,    20 ; 8
	db DRATINI,    40,  DRATINI,    40 ; 9
	db QWILFISH,   20,  QWILFISH,   20 ; 10
	db QWILFISH,   40,  QWILFISH,   40 ; 11
	db REMORAID,   20,  REMORAID,   20 ; 12
	db REMORAID,   40,  REMORAID,   40 ; 13
	db GYARADOS,   20,  GYARADOS,   20 ; 14
	db GYARADOS,   40,  GYARADOS,   40 ; 15
	db DRATINI,    10,  DRATINI,    10 ; 16
	db DRATINI,    10,  DRATINI,    10 ; 17
	db HORSEA,     20,  HORSEA,     20 ; 18
	db HORSEA,     40,  HORSEA,     40 ; 19
	db TENTACOOL,  20,  TENTACOOL,  20 ; 20
	db TENTACOOL,  40,  TENTACOOL,  40 ; 21
