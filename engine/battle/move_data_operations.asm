GetMoveSpecificData: ; Input -> B : Move ID, HL -> Data type (MOVE_XXX) | Output -> C : Data Value
	push bc
	ld a, b
	dec a
	ld bc, MOVE_LENGTH
	call AddNTimes
	pop bc
	ld c, [hl]
	ret

GetMoveAccuracy: ; Input -> B : Move ID | Output -> C : Accuracy
	ld hl, Moves + MOVE_ACC
	jp GetMoveSpecificData
	
GetMoveBasePower: ; Input -> B : Move ID | Output -> C : Base Power
	ld hl, Moves + MOVE_POWER
	jp GetMoveSpecificData
	
GetMoveMaxPP: ; Input -> B : Move ID | Output -> C : Base Power
	ld hl, Moves + MOVE_PP
	jp GetMoveSpecificData
	
GetMoveEffectChance: ; Input -> B : Move ID | Output -> C : Effect Chance
	ld hl, Moves + MOVE_CHANCE
	jp GetMoveSpecificData
	
GetMoveType: ; Input -> B : Move ID | Output -> C : Type
	ld hl, Moves + MOVE_TYPE
	jp GetMoveSpecificData
	
