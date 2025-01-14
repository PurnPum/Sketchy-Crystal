; these blocks all use COLL_CUT_TREE in one quadrant
CutTreeBlockPointers:
; tileset, block list pointer
	dbw TILESET_JOHTO,				.johto
	dbw TILESET_JOHTO_GOLDENROD,	.johto_goldenrod
	dbw TILESET_JOHTO_ECRUTEAK,		.johto_ecruteak
	dbw TILESET_JOHTO_OLIVINE,		.johto_olivine
	dbw TILESET_KANTO,				.kanto
	dbw TILESET_PARK,				.park
	dbw TILESET_FOREST,				.forest
	db -1 ; end

.johto:
; facing block, replacement block, animation
	db $03, $02, 1 ; grass
	db $8b, $84, 1 ; grass
	db $95, $a4, 1 ; grass
	db $9e, $02, 1 ; grass
	db $a6, $a1, 1 ; grass
	db $a7, $02, 1 ; grass
	db $e2, $dc, 1 ; grass
	db $5b, $3c, 0 ; tree
	db $5f, $3d, 0 ; tree
	db $63, $3f, 0 ; tree
	db $67, $3e, 0 ; tree
	db -1 ; end

.johto_goldenrod:
; facing block, replacement block, animation
	db $03, $02, 1 ; grass
	db $b1, $02, 1 ; grass
	db $b2, $02, 1 ; grass
	db $b3, $02, 1 ; grass
	db -1 ; end
	
.johto_ecruteak:
; facing block, replacement block, animation
	db $03, $02, 1 ; grass
	db $a7, $02, 1 ; grass
	db $a8, $02, 1 ; grass
	db $95, $94, 1 ; grass
	db $a6, $a4, 1 ; grass
	db $5b, $3c, 0 ; tree
	db $5f, $3d, 0 ; tree
	db $63, $3f, 0 ; tree
	db $67, $3e, 0 ; tree
	db -1 ; end
	
.johto_olivine:
; facing block, replacement block, animation
	db $03, $02, 1 ; grass
	db $a7, $02, 1 ; grass
	db $a8, $02, 1 ; grass
	db $95, $94, 1 ; grass
	db $a6, $a4, 1 ; grass
	db $5b, $3c, 0 ; tree
	db $5f, $3d, 0 ; tree
	db $63, $3f, 0 ; tree
	db $67, $3e, 0 ; tree
	db -1 ; end

.kanto:
; facing block, replacement block, animation
	db $0b, $0a, 1 ; grass
	db $32, $6d, 0 ; tree
	db $33, $6c, 0 ; tree
	db $34, $6f, 0 ; tree
	db $35, $4c, 0 ; tree
	db $60, $6e, 0 ; tree
	db -1 ; end

.park:
; facing block, replacement block, animation
	db $13, $03, 1 ; grass
	db $03, $04, 1 ; grass
	db -1 ; end

.forest:
; facing block, replacement block, animation
	db $0f, $17, 0
	db -1 ; end


; these blocks all use COLL_WHIRLPOOL in one quadrant
WhirlpoolBlockPointers:
	dbw TILESET_JOHTO, .johto
	db -1 ; end

.johto:
; facing block, replacement block, animation
	db $07, $36, 0
	db -1 ; end
