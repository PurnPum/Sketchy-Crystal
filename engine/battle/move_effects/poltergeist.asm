BattleCommand_Poltergeist:
	ld c, 60
	call DelayFrames		; Add delay so that the text "used POLTERGEIST" can be read
	call GetOpponentItem	; Load the item that the target is holding
	ld a, [hl]
	and a					; If its 0 (No item) make the move fail with a specific text
	jr z, .failed_no_item
	ld [wNamedObjectIndex], a
	callfar GetItemName		; Get its name
	ld hl, PoltergeistText
	jp StdBattleTextbox
	
.failed_no_item
	ld hl, PoltergeistFailedText
	call StdBattleTextbox
	ld hl, wAttackMissed
	xor a
	inc a
	ld [hl], a
	ret