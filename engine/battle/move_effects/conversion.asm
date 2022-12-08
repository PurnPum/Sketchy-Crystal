BattleCommand_Conversion:
	ld de, wBattleMonType1
	ld hl, wEnemyMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, .got_first_type
	ld de, wEnemyMonType1
	ld hl, wBattleMonType1
.got_first_type
	ld a, [hl] 				; Get the first type in 'a' from the target of the move
	ld [de], a				; Change the user's first type to the one we just got
	push hl					; Save hl to compare later for monotypes
	ld [wNamedObjectIndex], a
	farcall GetTypeName
	ld de, wBattleMonType2
	ld hl, wEnemyMonType2
	ldh a, [hBattleTurn]
	and a
	jr z, .got_second_type
	ld de, wEnemyMonType2
	ld hl, wBattleMonType2
.got_second_type
	ld a, [hl]				; Get the second type in 'a' from the target of the move
	ld [de], a				; Change the user's second type to the one we just got
	pop hl					; Restore 'hl' that contains the previous type address
	cp [hl]					; Compare 'a' (target's 2nd type) with [hl] (target's 1st type)
	jr z, .finish2			; If they match, the target only had 1 type, thus print the simpler version.
	ld [wNamedObjectIndex], a
	farcall GetTypeName2	; This custom function does the same as GetTypeName but writes to wStringBuffer2
	call AnimateCurrentMove
	ld hl, TransformedTypeText
	jp StdBattleTextbox
.finish2
	call AnimateCurrentMove
	ld hl, Transformed2TypeText
	jp StdBattleTextbox
