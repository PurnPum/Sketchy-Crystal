DEF MAPGROUP_N_A  EQU -1
DEF GROUP_N_A     EQU -1
DEF MAP_N_A       EQU -1
DEF MAPGROUP_NONE EQU 0
DEF GROUP_NONE    EQU 0
DEF MAP_NONE      EQU 0

; map struct members (see data/maps/maps.asm)
rsreset
DEF MAP_MAPATTRIBUTES_BANK rb ; 0
DEF MAP_TILESET            rb ; 1
DEF MAP_ENVIRONMENT        rb ; 2
DEF MAP_MAPATTRIBUTES      rw ; 3
DEF MAP_LOCATION           rb ; 5
DEF MAP_MUSIC              rb ; 6
DEF MAP_PALETTE            rb ; 7
DEF MAP_FISHGROUP          rb ; 8
DEF MAP_LENGTH EQU _RS

; map environments (wEnvironment)
; EnvironmentColorsPointers indexes (see data/maps/environment_colors.asm)
	const_def 1
	const TOWN
	const ROUTE
	const INDOOR
	const CAVE
	const ENVIRONMENT_5
	const GATE
	const DUNGEON
DEF NUM_ENVIRONMENTS EQU const_value - 1

; map palettes (wEnvironment)
	const_def
	const PALETTE_AUTO
	const PALETTE_DAY
	const PALETTE_NITE
	const PALETTE_MORN
	const PALETTE_DARK
DEF NUM_MAP_PALETTES EQU const_value

; FishGroups indexes (see data/wild/fish.asm)
	const_def
	const FISHGROUP_NONE
	const FISHGROUP_NEWBARK
	const FISHGROUP_CHERRYGROVE
	const FISHGROUP_ROUTE30
	const FISHGROUP_ROUTE31
	const FISHGROUP_DARKCAVEVIOLET
	const FISHGROUP_DARKCAVEBLACKTHORN
	const FISHGROUP_VIOLET
	const FISHGROUP_RUINSALPH
	const FISHGROUP_ROUTE32
	const FISHGROUP_UNION
	const FISHGROUP_SLOWPOKEWELL
	const FISHGROUP_AZALEA
	const FISHGROUP_ILEX
	const FISHGROUP_ROUTE34
	const FISHGROUP_GOLDENROD
	const FISHGROUP_ROUTE35
	const FISHGROUP_NATIONALPARK
	const FISHGROUP_ECRUTEAK
	const FISHGROUP_ROUTE38
	const FISHGROUP_OLIVINE
	const FISHGROUP_ROUTE40
	const FISHGROUP_ROUTE41
	const FISHGROUP_CIANWOOD
	const FISHGROUP_ROUTE42
	const FISHGROUP_ROUTE43
	const FISHGROUP_MTMORTAR
	const FISHGROUP_LAKEOFRAGE
	const FISHGROUP_ROUTE44
	const FISHGROUP_BLACKTHORN
	const FISHGROUP_DRAGONSDEN
	const FISHGROUP_ROUTE45
	const FISHGROUP_ROUTE27
	const FISHGROUP_TOHJOFALLS
	const FISHGROUP_ROUTE26
	const FISHGROUP_ROUTE22
	const FISHGROUP_VIRIDIAN
	const FISHGROUP_CERULEAN
	const FISHGROUP_ROUTE24
	const FISHGROUP_ROUTE25
	const FISHGROUP_ROUTE6
	const FISHGROUP_VERMILLION
	const FISHGROUP_ROCKTUNNEL
	const FISHGROUP_ROUTE9
	const FISHGROUP_ROUTE10NORTH
	const FISHGROUP_ROUTE12
	const FISHGROUP_ROUTE13
	const FISHGROUP_ROUTE14
	const FISHGROUP_ROUTE18
	const FISHGROUP_ROUTE19
	const FISHGROUP_ROUTE20
	const FISHGROUP_ROUTE21
	const FISHGROUP_CELADON
	const FISHGROUP_PALLET
	const FISHGROUP_FUCHSIA
	const FISHGROUP_CINNABAR
	const FISHGROUP_VICTORYROAD
	const FISHGROUP_ROUTE28
	const FISHGROUP_SILVER
	const FISHGROUP_WHIRL_ISLANDS
DEF NUM_FISHGROUPS EQU const_value - 1

; connection directions (see data/maps/data.asm)
	const_def
	const EAST_F
	const WEST_F
	const SOUTH_F
	const NORTH_F

; wMapConnections
	const_def
	shift_const EAST
	shift_const WEST
	shift_const SOUTH
	shift_const NORTH

; SpawnPoints indexes (see data/maps/spawn_points.asm)
	const_def
	const SPAWN_HOME
	const SPAWN_DEBUG
; kanto
	const SPAWN_PALLET
	const SPAWN_VIRIDIAN
	const SPAWN_PEWTER
	const SPAWN_CERULEAN
	const SPAWN_ROCK_TUNNEL
	const SPAWN_VERMILION
	const SPAWN_LAVENDER
	const SPAWN_SAFFRON
	const SPAWN_CELADON
	const SPAWN_FUCHSIA
	const SPAWN_CINNABAR
	const SPAWN_INDIGO
; johto
	const SPAWN_NEW_BARK
	const SPAWN_CHERRYGROVE
	const SPAWN_VIOLET
	const SPAWN_UNION_CAVE
	const SPAWN_AZALEA
	const SPAWN_CIANWOOD
	const SPAWN_GOLDENROD
	const SPAWN_OLIVINE
	const SPAWN_ECRUTEAK
	const SPAWN_MAHOGANY
	const SPAWN_LAKE_OF_RAGE
	const SPAWN_BLACKTHORN
	const SPAWN_MT_SILVER
	const SPAWN_FAST_SHIP
DEF NUM_SPAWNS EQU const_value

DEF SPAWN_N_A EQU -1

; Flypoints indexes (see data/maps/flypoints.asm)
	const_def
; johto
DEF JOHTO_FLYPOINT EQU const_value
	const FLY_NEW_BARK
	const FLY_CHERRYGROVE
	const FLY_VIOLET
	const FLY_AZALEA
	const FLY_GOLDENROD
	const FLY_ECRUTEAK
	const FLY_OLIVINE
	const FLY_CIANWOOD
	const FLY_MAHOGANY
	const FLY_LAKE_OF_RAGE
	const FLY_BLACKTHORN
	const FLY_MT_SILVER
; kanto
DEF KANTO_FLYPOINT EQU const_value
	const FLY_PALLET
	const FLY_VIRIDIAN
	const FLY_PEWTER
	const FLY_CERULEAN
	const FLY_VERMILION
	const FLY_ROCK_TUNNEL
	const FLY_LAVENDER
	const FLY_CELADON
	const FLY_SAFFRON
	const FLY_FUCHSIA
	const FLY_CINNABAR
	const FLY_INDIGO
DEF NUM_FLYPOINTS EQU const_value

DEF MAX_OUTDOOR_SPRITES EQU 23 ; see engine/overworld/overworld.asm
