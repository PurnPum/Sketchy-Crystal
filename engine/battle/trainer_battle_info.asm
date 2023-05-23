TrainerBattleInfo::
	push hl
	push de
	push bc
	call CreateInfoBox
	pop bc
	pop de
	pop hl
	ret
	
CreateInfoBox:
	hlcoord 0, 0
	ld b, 14
	ld c, 8
	call Textbox
	ld b, 14
	ld c, 8
	hlcoord 10, 0
	call Textbox
	
	hlcoord 1, 0
	ld de, .player
	call PlaceString
	ld de, StatTexts
	ld b, 1
	ld c, 2
	ld hl, wPlayerStatLevels
	call InfoBoxLoop
	
	hlcoord 11, 0
	ld de, .enemy
	call PlaceString
	ld de, StatTexts
	ld b, 11
	ld c, 2
	ld hl, wEnemyStatLevels
	call InfoBoxLoop
	jp WaitButton
	
.player:
	db " PLAYER @"
	
.enemy:
	db " ENEMY @"

StatTexts:
.attack:
	db "ATK: @"

.defense:
	db "DEF: @"

.speed:
	db "SPE: @"
	
.sattack:
	db "SATK:@"
	
.sdefense:
	db "SDEF:@"
	
.accuracy:
	db "ACC: @"
	
.evasiveness:
	db "EVA:@"
	
InfoBoxLoop:
	push hl
	coordHL b, c
	ld a, c
	cp 16
	jr nc, .finish
	push bc
	call PlaceString
	pop bc
	ld a, b
	add 6				; b = 7 or 17
	ld b, a
	pop hl
	call PrintStatValue
	inc hl				; hl = StatLevel + 1
	inc de				; de gets increased to the end of the string in PlaceString, so increase it 1 more for the next string
	ld a, b
	sub 6
	ld b, a
	inc c
	inc c
	jr InfoBoxLoop
.finish
	pop hl
	ret

PrintStatValue: ; Input is hl (either wPlayerStatX or wEnemyStatX) and bc (coords to place text)
	push de
	push hl
	push bc
	ld de, wStringBuffer4
	ld a, TX_START
	ld [de], a
	inc de
	ld a, [hl]  	; Stat
	ld c, a
	cp 7			; 7 = no changes
	jr c, .lowered
	jr z, .same
	ld a, "<PLUS>"
	ld [de], a
	inc de
	ld a, c
	sub 7			; a = a - 7
	jr .insert
.same
	ld a, "<PLUS>"
	ld [de], a
	inc de
	xor a
	jr .insert
.lowered
	ld a, "<MINUS>"
	ld [de], a
	inc de
	ld a, 7
	sub c
.insert
	add $F6 		; F6 = 0 in the charmap
	ld [de], a
	ld a, TX_END
	inc de
	ld [de], a		; Terminate string
	inc de
	ld [de], a		; Terminate string
	ld hl, wStringBuffer4
	pop bc
	push bc
	push hl
	coordHL b, c
	ld b, h
	ld c, l
	pop hl
	call PlaceHLTextAtBC
	pop bc
	pop hl
	pop de
	ret