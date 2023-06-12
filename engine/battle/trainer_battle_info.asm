TrainerBattleInfo::
	push hl
	push de
	push bc
	xor a
	ld [wTrainerInfoPage], a
	call UpdatePageText
	call StatChangesInfoBox
	call WaitButtonInfoTrainer
	pop bc
	pop de
	pop hl
	ret
	
StatChangesInfoBox:
	hlcoord 0, 0
	ld b, 14
	ld c, 8
	call Textbox
	ld b, 14
	ld c, 8
	hlcoord 10, 0
	call Textbox
	
	hlcoord 1, 0
	ld de, MainText.player
	call PlaceString
	ld de, StatTexts.attack
	ld b, 1
	ld c, 2
	ld hl, wPlayerStatLevels
	call StatChangesInfoBoxLoop
	
	hlcoord 11, 0
	ld de, MainText.enemy
	call PlaceString
	ld de, StatTexts.attack
	ld b, 11
	ld c, 2
	ld hl, wEnemyStatLevels
	call StatChangesInfoBoxLoop
	
StatChangesInfoBoxLoop:
	push hl
	call CoordsBCtoHL
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
	call PrintStatChangeValue
	inc hl				; hl = StatLevel + 1
	inc de				; de gets increased to the end of the string in PlaceString, so increase it 1 more for the next string
	ld a, b
	sub 6
	ld b, a
	inc c
	inc c
	jr StatChangesInfoBoxLoop
.finish
	pop hl
	ret

PrintStatChangeValue: ; Input is hl (either wPlayerStatX or wEnemyStatX) and bc (coords to place text)
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
	call CoordsBCtoHL
	ld b, h
	ld c, l
	pop hl
	call PlaceHLTextAtBC
	pop bc
	pop hl
	pop de
	ret

StatsInfoBox:
	hlcoord 0, 0
	ld b, 14
	ld c, 8
	call Textbox
	ld b, 14
	ld c, 8
	hlcoord 10, 0
	call Textbox

	hlcoord 1, 0
	ld de, MainText.player
	call PlaceString
	ld de, StatTexts
	ld b, 1
	ld c, 2
	ld hl, wBattleMonMaxHP
	call StatsInfoBoxLoop
	
	hlcoord 11, 0
	ld de, MainText.enemy
	call PlaceString
	ld de, StatTexts
	ld b, 11
	ld c, 2
	ld hl, wEnemyMonMaxHP
	call StatsInfoBoxLoop
	ret

StatsInfoBoxLoop:
	push hl
	call CoordsBCtoHL
	ld a, c
	cp 14
	jr nc, .finish
	push bc
	call PlaceString
	pop bc
	ld a, b
	add 4				; b = 6 or 16
	ld b, a
	pop hl
	push de
	ld d, h
	ld e, l
	push hl
	call CoordsBCtoHL
	push bc
	lb bc, 2, 4
	call PrintNum
	pop bc
	pop hl
	pop de
	inc hl
	inc hl
	inc de				; de gets increased to the end of the string in PlaceString, so increase it 1 more for the next string
	ld a, b
	sub 4
	ld b, a
	inc c
	inc c
	jr StatsInfoBoxLoop
.finish
	pop hl
	ret

FieldInfoBox:
	ret

MainText:
.page1:
	db "  PAGE 1/3 ▶@"

.page2:
	db "◀ PAGE 2/3 ▶@"
	
.page3:
	db "◀ PAGE 3/3  @"

.player:
	db " PLAYER @"
	
.enemy:
	db " ENEMY @"

StatTexts:
.health:
	db "HP:  @"

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

JoyWaitAorBorDPADInfoTrainer:
.loop
	call DelayFrame
	call GetJoypad
	ldh a, [hJoyPressed]
	and A_BUTTON | B_BUTTON
	ret nz
	ldh a, [hJoyPressed]
	and D_RIGHT
	call nz, InfoBoxRightPress
	ldh a, [hJoyPressed]
	and D_LEFT
	call nz, InfoBoxLeftPress
	call UpdateTimeAndPals
	jr .loop

WaitButtonInfoTrainer:
	ldh a, [hOAMUpdate]
	push af
	ld a, 1
	ldh [hOAMUpdate], a
	call WaitBGMap
	call JoyWaitAorBorDPADInfoTrainer
	pop af
	ldh [hOAMUpdate], a
	ret
	
InfoBoxLeftPress:
	ld a, [wTrainerInfoPage]
	cp 1
	ret c					; We're on page 1, pressing left shouldn't do anything
	jr z, .jump_to_page_1	; We're on page 2, jump to page 1
	call DecreasePage		; We're on page 3, jump to page 2
	call UpdatePageText
	jp StatsInfoBox	
.jump_to_page_1
	call DecreasePage
	call UpdatePageText
	jp StatChangesInfoBox
	
InfoBoxRightPress:
	ld a, [wTrainerInfoPage]
	cp 1
	jr z, .jump_to_page_3	; We're on page 2, jump to page 3
	ret nc					; We're on page 3, pressing right shouldn't do anything
	call IncreasePage		; We're on page 1, jump to page 2
	call UpdatePageText
	jp StatsInfoBox
.jump_to_page_3
	call IncreasePage
	call UpdatePageText
	jp FieldInfoBox
	
IncreasePage:
	ld a, [wTrainerInfoPage]
	inc a
	ld [wTrainerInfoPage], a
	ret

DecreasePage:
	ld a, [wTrainerInfoPage]
	dec a
	ld [wTrainerInfoPage], a
	ret

UpdatePageText:
	hlcoord 4, 17
	ld de, MainText.page1
	ld a, [wTrainerInfoPage]
	cp 1
	jr z, .page_2
	jr nc, .page_3
	jr .done
.page_2
	ld de, MainText.page2
	jr .done
.page_3
	ld de, MainText.page3
.done
	call PlaceString
	ret

CoordsBCtoHL:
	ld hl, wTilemap
	ld a, c
	push bc
	ld c, SCREEN_WIDTH
	call HLMultiply
	pop bc
	ld a, b
	add l
	ld l, a
	ret nc
	inc h
	ret
