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
	add "0"
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
	hlcoord 0, 0
	ld b, 2
	ld c, 18
	call Textbox
	ld b, 10
	ld c, 8
	hlcoord 0, 4
	call Textbox
	ld b, 10
	ld c, 8
	hlcoord 10, 4
	call Textbox
.weather
	hlcoord 6, 0
	ld de, FieldTexts.weather
	call PlaceString
	ld a, [wBattleWeather]
	cp WEATHER_HAIL
	ld de, FieldTexts.hail
	jr z, .done
	cp WEATHER_SUN
	ld de, FieldTexts.sun
	jr z, .done
	cp WEATHER_RAIN
	ld de, FieldTexts.rain
	jr z, .done
	cp WEATHER_SANDSTORM
	ld de, FieldTexts.sand
	jr z, .done
	ld de, FieldTexts.none
.done
	hlcoord 1, 1
	call PlaceString
	ld a, [wBattleWeather]
	cp WEATHER_NONE
	jr z, .skip_weather_turns
	ld de, wStringBuffer5
	ld a, [wWeatherCount]
	add "0"
	ld [de], a
	ld a, TX_END
	inc de
	ld [de], a
	ld de, wStringBuffer5
	hlcoord 1, 2
	call PlaceString
	ld a, [wWeatherCount]
	cp 1
	ld de, FieldTexts.turnsleft
	jr nz, .not_1_turn
	ld de, FieldTexts.turnleft
.not_1_turn
	hlcoord 2, 2
	call PlaceString
.skip_weather_turns
	hlcoord 1, 4
	ld de, MainText.player
	call PlaceString	
	hlcoord 11, 4
	ld de, MainText.enemy
	call PlaceString
	lb bc, 1, 5
	call FieldInfoBoxReflect
	lb bc, 1, 7
	call FieldInfoBoxLScreen
	lb bc, 1, 9
	ld de, FieldTexts.spikes
	call FieldInfoBoxSpikes
.player_confuse
	ld de, FieldTexts.confused
	ld a, [wPlayerSubStatus3]
	bit SUBSTATUS_CONFUSED, a
	jr z, .enemy_confuse
	lb bc, 1, 10
	call FieldInfoBoxStatus
.enemy_confuse
	ld a, [wEnemySubStatus3]
	bit SUBSTATUS_CONFUSED, a
	jr z, .player_encore
	lb bc, 11, 10
	call FieldInfoBoxStatus
.player_encore
	ld de, FieldTexts.encored
	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_ENCORED, a
	jr z, .enemy_encore
	lb bc, 1, 11
	call FieldInfoBoxStatus
.enemy_encore
	ld a, [wEnemySubStatus5]
	bit SUBSTATUS_ENCORED, a
	jr z, .player_disable
	lb bc, 11, 11
	call FieldInfoBoxStatus
.player_disable
	ld de, FieldTexts.disabled
	ld a, [wDisabledMove]
	and a
	jr z, .enemy_disable
	lb bc, 1, 14
	call FieldInfoBoxStatus
.enemy_disable
	ld a, [wEnemyDisabledMove]
	and a
	jr z, .player_toxic
	lb bc, 11, 14
	call FieldInfoBoxStatus
.player_toxic
	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_TOXIC, a
	jr z, .enemy_toxic
	lb bc, 1, 12
	ld de, wPlayerToxicCount
	call FieldInfoBoxToxic
.enemy_toxic
	ld a, [wEnemySubStatus5]
	bit SUBSTATUS_TOXIC, a
	ret z
	lb bc, 11, 12
	ld de, wEnemyToxicCount
	call FieldInfoBoxToxic
	ret

FieldInfoBoxReflect: ; input: bc -> coords
	ld hl, wPlayerScreens
	ld de, wPlayerReflectCount
	bit 4, [hl]
	jr z, .enemy
	ld hl, FieldTexts.reflect
	push bc
	call FieldInfoBoxPlaceElement
	pop bc
.enemy
	ld hl, wEnemyScreens
	ld de, wEnemyReflectCount
	bit 4, [hl]
	ret z
	ld a, b
	add 10
	ld b, a
	ld hl, FieldTexts.reflect
	call FieldInfoBoxPlaceElement
	ret
	
FieldInfoBoxLScreen: ; input: bc -> coords
	ld hl, wPlayerScreens
	ld de, wPlayerLightScreenCount
	bit 3, [hl]
	jr z, .enemy
	ld hl, FieldTexts.lightScreen
	push bc
	call FieldInfoBoxPlaceElement
	pop bc
.enemy
	ld hl, wEnemyScreens
	ld de, wEnemyLightScreenCount
	bit 3, [hl]
	ret z
	ld a, b
	add 10
	ld b, a
	ld hl, FieldTexts.lightScreen
	call FieldInfoBoxPlaceElement
	ret

FieldInfoBoxSpikes: ; input: bc -> coords
	ld hl, wPlayerScreens
	bit 0, [hl]
	jr z, .enemy
	push de
	call CoordsBCtoHL
	push bc
	call PlaceString
	pop bc
	pop de
.enemy
	ld hl, wEnemyScreens
	bit 0, [hl]
	ret z
	ld a, b
	add 10
	ld b, a
	call CoordsBCtoHL
	call PlaceString
	ret
	
FieldInfoBoxStatus: ; input: bc -> coords, de -> text
	push de
	call CoordsBCtoHL
	call PlaceString
	pop de
	ret
	
FieldInfoBoxToxic: ; input: bc -> coords , de -> count
	ld hl, FieldTexts.toxic
	push hl
	push bc
	call FieldInfoBoxPlaceElement
	pop bc
	pop hl
	ret
	
FieldInfoBoxPlaceElement: ; input: bc -> coords, hl -> Field text, de -> Count
	push de
	ld d, h
	ld e, l
	call CoordsBCtoHL
	push bc
	call PlaceString
	pop bc
	inc c
	call CoordsBCtoHL
	pop de
	push de
	ld a, [de]
	ld de, wStringBuffer5
	add "0"
	ld [de], a
	ld a, TX_END
	inc de
	ld [de], a
	dec de
	push bc
	call PlaceString
	pop bc
	pop de
	ld a, [de]
	cp 1
	ld de, FieldTexts.turns
	jr nz, .not_1_turn
	ld de, FieldTexts.turn
.not_1_turn
	inc b
	call CoordsBCtoHL
	call PlaceString
	ret

MainText:
.page1:
	db "  PAGE 1/3 ▶@"

.page1_content:
	db "STAT CHANGES@"

.page2:
	db "◀ PAGE 2/3 ▶@"

.page2_content:
	db "ACTUAL STATS@"
	
.page3:
	db "◀ PAGE 3/3  @"

.page3_content:
	db "FIELD/STATUS@"

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

FieldTexts:
.weather:
	db " WEATHER @"
	
.none:
	db "NORMAL@"
	
.sun:
	db "SUNNY@"

.rain:
	db "RAIN@"
	
.sand:
	db "SANDSTORM@"
	
.hail:
	db "HAIL@"
	
.reflect:
	db "REFLECT@"
	
.lightScreen:
	db "L.SCREEN@"
	
.spikes:
	db "SPIKES@"
	
.confused:
	db "CONFUSED@"
	
.encored:
	db "ENCORED@"
	
.toxic:
	db "TOXIC@"
	
.disabled:
	db "DISABLED@"
	
.turnsleft:
	db " turns left@"

.turnleft:
	db " turn left@"
	
.turns:
	db " turns@"

.turn:
	db " turn@"

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
	call PlaceString
	ld de, MainText.page1_content
	jr .done
.page_2
	ld de, MainText.page2
	call PlaceString
	ld de, MainText.page2_content
	jr .done
.page_3
	ld de, MainText.page3
	call PlaceString
	ld de, MainText.page3_content
.done
	hlcoord 4, 16
	call PlaceString
	ret

CoordsBCtoHL::
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
