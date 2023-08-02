MoveBattleInfo::
	push hl
	push de
	push bc
	call MoveExtraInfoBox
	pop bc
	pop de
	pop hl
	ret
	
MoveExtraInfoBox:
	hlcoord 0, 0
	ld b, 11
	ld c, 18
	call Textbox
	call PrintMoveData
	ret

MoveBattleInfoEnemy::
	push hl
	push de
	push bc
	call MoveExtraInfoBoxEnemy
	pop bc
	pop de
	pop hl
	ret
	
MoveExtraInfoBoxEnemy:
	hlcoord 0, 0
	ld b, 11
	ld c, 18
	call Textbox
	lb bc, 1, 1
	call PlaceMoveName
	call PlaceEnemyPP
	call PrintMoveData.enemy
	hlcoord 1, 0
	ld de, .enemy_move_title
	call PlaceString
	ret

.enemy_move_title:
	db " MOVE USED BY FOE @"

PlaceMoveName:
	push bc
	ld a, [wLastEnemyMove]
	ld [wNamedObjectIndex], a
	call GetMoveName
	inc b
	inc b
	call CoordsBCtoHL
	call PlaceString
	pop bc
	inc c
	ret
	
PrintMoveData:
	call PlaceMoveDisabled
	lb bc, 1, 1
	call PlaceMovePP
.enemy
	call PlaceMoveBasePower
	call PlaceMoveAccuracy
	call PlaceMoveType
	call PlaceMovePriority
	ret
	; fallthrough
PrintExtraTexts:
	push bc
	ld a, [wCurPlayerMove]
	ld hl, MoveTextMatches
	ld bc, 12
.loop1
	dec a
	jr z, .done
	add hl, bc
	jr .loop1
.done
	pop bc
rept 6
	call AuxPrintMoveData
endr
	ret

AuxPrintMoveData:
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	push hl
	push bc
	ld hl, MoveMainTexts.effect_chance
	call PlaceChanceText
	call CoordsBCtoHL
	call PlaceString
	pop bc
	inc c
	pop hl
	ret
	
PlaceChanceText:	 ; Input: HL -> Effect Chance Address, DE -> Current text address.
	ld a, h
	cp d
	ret nz
	ld a, l
	cp e
	ret nz			; Only proceed if hl = de
	push de
	push bc
	ld a, [wCurPlayerMove]
	ld b, a
	farcall GetMoveEffectChance
	ld a, c
	ld d, c
	inc a
	jr nz, .not_100p
	pop bc
	push bc
	ld b, 9
	call CoordsBCtoHL
	ld de, MoveMainTexts.a_hundred_percent
	call PlaceString
	pop bc
	ld b, 1
	pop de
	ret
	
.not_100p
	pop bc
	push bc
	ld b, 9
	call CoordsBCtoHL
	ld b, d
	call AuxPlaceNot100p
	pop bc
	pop de
	ret
	
GetBasePower: ; Move ID is in wCurPlayerMove, Power returned in B
	ld a, [wPlayerMoveStruct + MOVE_POWER]
	ld b, a
	ret
	
GetAccuracy: ; Move ID is in wCurPlayerMove, Accuracy returned in B (0xFF means 100%)
	ld a, [wPlayerMoveStruct + MOVE_ACC]
	ld b, a
	ret
	
GetExtraEffectChance: ; Move ID is in wCurPlayerMove, Effect chance returned in B, same as accuracy
	ld a, [wPlayerMoveStruct + MOVE_CHANCE]
	ld b, a
	ret
	
CalculateChanceNumber: ; Takes a number in B, multiplies it by 100 and then divides it by 255; this returns the % chance from an accuracy/effect chance input
	xor a				; Returns the result in B and the remainder in C
	ldh [hMultiplicand], a
	ldh [hMultiplicand + 1], a
	ld a, b
	ldh [hMultiplicand + 2], a
	ld a, 100
	ldh [hMultiplier], a
	call Multiply
	ldh a, [hProduct + 2]
	ldh [hDividend + 0], a
	ldh a, [hProduct + 3]
	ldh [hDividend + 1], a
	xor a
	dec a ;FF
	ld [hDivisor], a
	ld b, 2
	call Divide
	ld a, [hQuotient+3]
	ld b, a
	ld a, [hRemainder]
	ld c, a
	ret
	
PlaceMoveBasePower:		; Input: bc -> coords to place text
	push bc
	ld a, [wCurPlayerMove]
	ld b, a
	farcall GetMoveBasePower
	ld a, c
	ld d, c
	and a
	jr z, .nope					; If the power is 0, dont print the base power and dont increase bc
	pop bc
	push de
	call CoordsBCtoHL
	ld de, MoveMainTexts.base_power
	push bc
	call PlaceString
	pop bc
	pop de
	push bc
	ld b, 8
	call CoordsBCtoHL
	ld a, d
	cp 1
	jr nz, .not_1	; If base power is 1, print --- instead
	ld [hl], "-"
	inc hl
	ld [hl], "-"
	inc hl
	ld [hl], "-"
	pop bc
	inc c
	ret
.not_1
	ld de, wStringBuffer5
	ld [de], a
	lb bc, 1, 2
	cp 100
	jr c, .less_than_100
	inc c
.less_than_100
	call PrintNum
	pop bc
	inc c	; next row
	ret

.nope
	pop bc
	ret
	
PlaceMoveAccuracy:
	push bc
	ld de, MoveMainTexts.accuracy
	call CoordsBCtoHL
	call PlaceString

	ld a, [wCurPlayerMove]
	ld b, a
	farcall GetMoveAccuracy
	ld a, c
	ld d, c
	inc a
	jr nz, .not_100p
	pop bc
	push bc
	ld b, 11
	call CoordsBCtoHL
	ld de, MoveMainTexts.a_hundred_percent
	call PlaceString
	pop bc
	inc c
	ret

.not_100p
	pop bc
	push bc
	ld b, 11
	call CoordsBCtoHL
	ld b, d
	call AuxPlaceNot100p
	pop bc
	inc c
	ret

AuxPlaceNot100p:	;input -> hl : coords
	call CalculateChanceNumber
	push bc
	ld de, wStringBuffer5
	ld a, b
	ld [de], a
	lb bc, 1, 2
	call PrintNum
	pop bc
	ld a, c
	and a
	jr z, .no_decimals
	ld b, c
	ld [hl], "."
	call CalculateChanceNumber
	ld de, wStringBuffer5
	ld a, b
	ld [de], a
	inc hl
	lb bc, 1, 2
	call PrintNum
.no_decimals
	ld [hl], "<%>"
	ret

PlaceMovePP:
	push bc
	call CoordsBCtoHL
	ld de, MoveMainTexts.pp
	call PlaceString
	
	ld hl, wMenuCursorY
	dec [hl]
	call SetPlayerTurn
	ld hl, wBattleMonMoves
	ld a, [wMenuCursorY]
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	ld [wCurPlayerMove], a

	ld a, [wCurBattleMon]
	ld [wCurPartyMon], a
	ld a, WILDMON
	ld [wMonType], a
	callfar GetMaxPPOfMove

	ld hl, wMenuCursorY
	ld c, [hl]
	inc [hl]
	ld b, 0
	ld hl, wBattleMonPP
	add hl, bc
	ld a, [hl]
	and PP_MASK
	ld [wStringBuffer5], a
	
	pop bc
	push bc
	call CoordsBCtoHL
rept 4
	inc hl
endr
	push hl
	ld de, wStringBuffer5
	lb bc, 1, 2
	call PrintNum
	pop hl
	inc hl
	inc hl
	ld [hl], "/"
	inc hl
	ld de, wNamedObjectIndex
	lb bc, 1, 2
	call PrintNum
	callfar UpdateMoveData
	pop bc
	inc c
	ret

PlaceEnemyPP: ; Move ID : wLastEnemyMove
	push bc
	call CoordsBCtoHL
	ld de, MoveMainTexts.pp
	call PlaceString
	
	ld e, -1
	ld hl, wEnemyMonMoves
.loop
	inc e
	ld b, [hl]
	inc hl
	ld a, [wLastEnemyMove]
	ld [wCurPlayerMove], a
	cp b
	jr nz, .loop
	
	ld d, 0
	ld hl, wEnemyMonPP
	add hl, de
	ld a, [hl]
	and PP_MASK
	ld [wStringBuffer5], a
	pop bc
	push bc
	call CoordsBCtoHL
rept 4
	inc hl
endr
	ld de, wStringBuffer5
	lb bc, 1, 2
	call PrintNum
	ld [hl], "/"
	inc hl
	push hl
	ld a, [wLastEnemyMove]
	ld b, a
	farcall GetMoveMaxPP
	ld de, wStringBuffer5
	ld a, c
	ld [de], a
	lb bc, 1, 2
	pop hl
	call PrintNum
	pop bc
	inc c
	ret
	
PlaceMoveType:
	push bc
	ld de, MoveMainTexts.move_type
	call CoordsBCtoHL
	call PlaceString
	pop bc
	push bc
	ld b, 7
	call CoordsBCtoHL
	ld a, [wCurPlayerMove]
	ld b, a
	push bc
	push hl
	farcall GetMoveType
	push bc
	ld b, c
	call PlaceMoveCategory
	pop bc
	ld b, $84
	ld de, wBGPals1 palette 6
	farcall DisplayTypeIcons.faraux
	pop hl
	pop bc
	predef PrintMoveType
	pop bc
	inc c
	ret
	
INCLUDE "engine/gfx/place_move_category_icon.asm"
	
PlaceMovePriority:
	push bc
	ld a, [wCurPlayerMove]
	ld b, a
	farcall FarGetMovePriority
	ld a, b
	inc b
	inc b
	ld e, "<MINUS>"
	cp 1
	jr c, .minus_1_prio
	jr z, .no_prio
	ld e, "<PLUS>"
	dec b
	dec b
.minus_1_prio
	ld d, b
	pop bc
	push de
	call CoordsBCtoHL
	ld de, MoveMainTexts.priority
	push bc
	call PlaceString
	pop bc
	push bc
	ld b, 11
	call CoordsBCtoHL
	pop bc
	pop de
	ld [hl], e	; <PLUS> or <MINUS>
	ld a, d
	dec a
	add "0"
	inc hl
	ld [hl], a
	inc c
	ret	
	
.no_prio
	pop bc
	ret

PlaceMoveDisabled:
	ld a, [wPlayerDisableCount]
	and a
	ret z
	
	swap a
	and $f
	ld b, a
	ld a, [wMenuCursorY]
	cp b
	ret nz
	
	lb bc, 3, 11
	call CoordsBCtoHL
	ld de, MoveMainTexts.disabled
	call PlaceString
	ret
	
MoveMainTexts:

.base_power:
	db "POWER:@"
	
.accuracy:
	db "ACCURACY:@"
	
.main_effect:
	db " --MAIN EFFECT--@"
	
.effect:
	db "-SECONDARY EFFECT-@"

.effect_chance:
	db "CHANCE:@"
	
.pp:
	db "PP:@"
	
.move_type:
	db "TYPE:@"

.priority:
	db "PRIORITY:@"
	
.disabled:
	db "MOVE IS DISABLED@"

.a_hundred_percent:
	db "100<%>@"

.extra_info:
	db "  --EXTRA INFO--@"

MoveExtraEffectsTexts:

.poison:
	db "POISONS FOE@"
	
.paralysis:
	db "PARALYZES FOE@"
	
.confusion:
	db "CONFUSES FOE@"
	
.burn:
	db "BURNS FOE@"
	
.freeze:
	db "FREEZES FOE@"

.lower_self_attack:
	db "<MINUS>1 ATTACK (SELF)@"
	
.lower_self_spattack:
	db "<MINUS>1 S.ATTACK (SELF)@"
	
.lower_attack:
	db "<MINUS>1 ATTACK (FOE)@"
	
.lower_defense:
	db "<MINUS>1 DEFENSE (FOE)@"
	
.lower_spattack:
	db "<MINUS>1 S.ATTACK (FOE)@"
	
.lower_spdefense:
	db "<MINUS>1 S.DEFENSE (FOE)@"
	
.lower_speed:
	db "<MINUS>1 SPEED (FOE)@"
	
.lower_accuracy:
	db "<MINUS>1 ACCURACY (FOE)@"
	
.lower_evasiveness:
	db "<MINUS>1 EVASIVE. (FOE)@"
	
.omniboost:
	db "OMNIBOOST (SELF)@"
	
.increase_self_defense:
	db "<PLUS>1 DEFENSE (SELF)@"
	
.increase_self_accuracy:
	db "<PLUS>1 ACCURACY (SELF)@"
	
.flinch:
	db "FLINCHES FOE@"
	
.traps:
	db "TRAP FOE 2-5 TURNS@"
	
.poison_gas:
	db "DROPS STATS IF PSN@"

MoveMainEffectsTexts:

.traps:
	db "TRAPS TARGET@"
	
.lower_attack2:
	db "<MINUS>2 ATTACK (FOE)@"
	
.lower_defense2:
	db "<MINUS>2 DEFENSE (FOE)@"
	
.lower_spattack2:
	db "<MINUS>2 S.ATTACK (FOE)@"
	
.lower_spdefense2:
	db "<MINUS>2 S.DEFENSE (FOE)@"
	
.lower_speed2:
	db "<MINUS>2 SPEED (FOE)@"
	
.lower_accuracy2:
	db "<MINUS>2 ACCURACY (FOE)@"
	
.lower_evasiveness2:
	db "<MINUS>2 EVASIVE. (FOE)@"
	
.focus_energy:
	db "<PLUS>2 CRIT HIT RATIO@"

	
.weather1:
	db "TURNS WEATHER TO@"
.sunny_day:
	db "SUNNY FOR 5 TURNS@"
.rain_dance:
	db "RAIN FOR 5 TURNS@"
.sandstorm:
	db "SAND FOR 5 TURNS@"
.hail:
	db "HAIL FOR 5 TURNS@"
	
.normal_heal1:
	db "HEALS 50<%> OF THE@"
.normal_heal2:
	db "USER'S MAX HEALTH@"

.weather_heal_sun1:
	db "SUNNY: HEALS 66<%>@"
.weather_heal_sun2:
	db "NORMAL: HEALS 50<%>@"
.weather_heal_sun3:
	db "OTHER: HEALS 25<%>@"
	
.weather_heal_rain1:
	db "RAIN: HEALS 66<%>@"
.weather_heal_rain2:
	db "NORMAL: HEALS 50<%>@"
.weather_heal_rain3:
	db "OTHER: HEALS 25<%>@"
	
.weather_heal_sandstorm1:
	db "SAND: HEALS 66<%>@"
.weather_heal_sandstorm2:
	db "NORMAL: HEALS 50<%>@"
.weather_heal_sandstorm3:
	db "OTHER: HEALS 25<%>@"
	
.weather_heal_hail1:
	db "HAIL: HEALS 66<%>@"
.weather_heal_hail2:
	db "NORMAL: HEALS 50<%>@"
.weather_heal_hail3:
	db "OTHER: HEALS 25<%>@"
	
.conversion1:
	db "COPIES FOE'S TYPE@"
.conversion2:
	db "ONTO THE USER@"
	
.conversion_21:
	db "CHANGES TYPE TO@"
.conversion_22:
	db "RESIST LAST ATTACK@"

.protect1:
	db "PROTECTS THE USER@"
.protect2
	db "VS MOST ATTACKS.@"
.protect3:
	db "FAILS IF BEHIND A@"
.protect4:
	db "SUBSTITUTE OR IF@"
.protect5:
	db "USED CONSECUTIVELY@"
	
.endure1:
	db "ALLOWS THE USER TO@"
.endure2:
	db "SURVIVE ON 1 HP@"
	
.counter1:
	db "RETURNS PHYSICAL@"
.mirror_coat1:
	db "RETURNS SPECIAL@"
.counter2:
	db "DMG BACK DOUBLED@"

.mirror_move1:
	db "RETURNS THE LAST@"
.mirror_move2:
	db "USED ATTACK BACK@"
	
.force_switch1:
	db "FORCES THE TARGET@"
.force_switch2:
	db "TO SWITCH OUT TO@"
.force_switch3:
	db "A RANDOM TEAMMATE@"

.dbond1:
	db "FOE FAINTS IF USER@"
.dbond2:
	db "FAINTS TOO@"
	
.nightmare1:
	db "TARGET LOSES 1/3RD@"
.nightmare2:
	db "OF THEIR MAX HP@"
.nightmare3:
	db "EVERY TURN ASLEEP@"

.pain_split1:
	db "HP BECOMES THE@"
.pain_split2:
	db "AVERAGE BETWEEN@"
.pain_split3:
	db "USER AND TARGET@"

.perish_song1:
	db "ANYBODY WHO HEARS@"
.perish_song2:
	db "THE SONG WILL@"
.perish_song3:
	db "FAINT IN 3 TURNS@"
	
.spite1:
	db "LOWERS BY 5 THE PP@"
.spite2:
	db "OF THE LAST MOVE@"
.spite3:
	db "USED BY THE TARGET@"
	
.leechseed1:
	db "LEECHES 1/12TH HP@"
.leechseed2:
	db "FROM THE TARGET@"

.spikes1:
	db "SWITCHING FOES@"
.spikes2:
	db "TAKE 12.5<%> DMG@"

.haze:
	db "VOIDS STAT CHANGES@"
	
.mist1:
	db "AVOIDS STAT DROPS@"
.mist2:
	db "UNTIL THE USER@"
.mist3:
	db "SWITCHES OUT@"

.attract1:
	db "50<%> CHANCE TO NOT@"
.attract2:
	db "MOVE IF TARGET IS@"
.attract3:
	db "THE OTHER GENDER@"

.batton_pass1:
	db "SWITCHES AND KEEPS@"
.batton_pass2:
	db "ALL STAT CHANGES@"
.batton_pass3:
	db "AND OTHER EFFECTS@"
	
.sketch1:
	db "PERMANENTLY COPIES@"
.sketch2:
	db "THE LAST MOVE USED@"
.sketch3:
	db "BY THE TARGET@"

.substitute1:
	db "EVADES DRAINING@"
.substitute2:
	db "MOVES, STAT DROPS@"
.substitute3:
	db "AND STATUS COND.@"
.substitute4:
	db "TAKES 25<%> FROM@"
.substitute5:
	db "THE USER'S MAX HP@"

.bide1:
	db "AFTER 2-3 TURNS@"
.bide2:
	db "RETURNS TWICE THE@"
.bide3:
	db "DAMAGE TAKEN@"
	
.metronome:
	db "USES A RANDOM MOVE@"

.super_fang1:
	db "HALVES THE FOE'S@"
.super_fang2:
	db "CURRENT HEALTH@"

.toxic1:
	db "BUILDS UP AS TURNS@"
.toxic2:
	db "GO BY. BECOMES@"
.toxic3:
	db "REGULAR POISON@"
.toxic4:
	db "AFTER SWITCHING@"
	
.heal_bell1:
	db "HEALS ALL STATUS@"
.heal_bell2:
	db "FROM THE PARTY@"
	
.mimic1:
	db "TEMPORARILY COPIES@"
.mimic2:
	db "THE LAST MOVE USED@"
.mimic3:
	db "BY THE TARGET@"

.safeguard1:
	db "SHIELDS THE TEAM@"
.safeguard2:
	db "FOR 5 TURNS FROM@"
.safeguard3:
	db "STATUS CONDITIONS@"

.disable1:
	db "DISABLES A MOVE@"
.disable2:
	db "FROM 2 TO 8 TURNS@"
	
.encore1:
	db "LOCKS THE TARGET@"
.encore2:
	db "INTO THE SAME MOVE@"
.encore3:
	db "FROM 2 TO 6 TURNS@"

.foresight1:
	db "REMOVES IMMUNITIES@"
.foresight2:
	db "FROM A TARGETTED@"
.foresight3:
	db "GHOST-TYPE@"

.reflect1:
	db "DOUBLES DEFENSE@"
.lightscreen1:
	db "DOUBLES S.DEFENSE@"
.screen2:
	db "OF THE WHOLE TEAM@"
.screen3:
	db "FOR 5 TURNS@"
	
.rest1:
	db "GOES ASLEEP BUT@"
.rest2:
	db "HEALS TO FULL HP@"
.rest3:
	db "AND REMOVES STATUS@"

.sleep_talk1:
	db "USES A RANDOM MOVE@"
.sleep_talk2:
	db "KNOWN BY THE USER@"
.sleep_talk3:
	db "IF ITS ASLEEP@"
	
.teleport1:
	db "SWITCHES THE@"
.teleport2:
	db "USER OUT@"

MoveExtraInfoTexts:
	
.high_crit:
	db "12.5<%> CRIT CHANCE@"
	
.multi_hit1:
	db "2 OR 5 HITS: 12.5<%>@"
.multi_hit2:
	db "3 OR 4 HITS: 37.5<%>@"
	
.fury_cutter1:
	db "X2 DMG EACH TURN@"
.fury_cutter2:
	db "UNLESS IT MISSES.@"
.fury_cutter3:
	db "MAX POWER IS 240.@"

.twineedle1:
	db "2 HITS, CAN POISON@"
.twineedle2:
	db "EVEN STEEL-TYPES@"
	
.leech1:
	db "HEALS 50<%> OF DMG@"
.leech2:
	db "DONE. WILL MISS@"
.leech3:
	db "AGAINST SUBSTITUTE@"
	
.uturn1:
	db "SWITCHES THE USER@"
.uturn2:
	db "OUT AFTER THE HIT@"
	
.recoil1:
	db "USER TAKES 1/4TH@"
.recoil2:
	db "OF THE DMG DEALT@"
	
.bypass_protect1:
	db "BYPASSES PROTECT@"
.bypass_sub_protect2:
	db "AND SUBSTITUTE@"
	
.bypass_sub:
	db "IGNORES SUBSTITUTE@"

.beat_up1:
	db "HITS ONCE FOR EACH@"
.beat_up2:
	db "HEALTHY TEAMMATE@"
	
.pursuit1:
	db "X2 DAMAGE AGAINST@"
.pursuit2:
	db "A FOE MANUALLY@"
.pursuit3:
	db "SWITCHING OUT@"
	
.rampage1:
	db "ATTACKS 2-3 TURNS,@"
.rampage2:
	db "THEN GETS CONFUSED@"
	
.twistergust1:
	db "RAIN: X2 DMG, SAME@"
.twistergust2:
	db "IF FOE'S USING FLY@"
.twistergust3:
	db "SUN: 1/2 DAMAGE@"

.reversalflail1:
	db "POWER INCREASES AS@"
.reversalflail2:
	db "HEALTH DECREASES@"
.reversalflail3:
	db "150 MAX, 20 MIN@"

.seismictoss_nightshade1:
	db "DAMAGE EQUALS THE@"
.seismictoss_nightshade2:
	db "USER'S LEVEL@"
	
.triplekick1:
	db "80<%> CHANCE TO HIT@"
.triplekick2:
	db "3 TIMES. 2ND HIT@"
.triplekick3:
	db "DOES 2X DMG, 3RD@"
.triplekick4:
	db "HIT DOES 3X DMG.@"
	
.double_hit:
	db "HITS TWICE@"
	
.karate_chop:
	db "ALWAYS CRITS@"
	
.crash_damage1:
	db "ON MISS USER TAKES@"
.crash_damage2:
	db "1/8TH OF EXPECTED@"
.crash_damage3:
	db "DAMAGE DEALT@"

.defrost:
	db "THAWS USER@"
	
.semi_invul1:
	db "SEMI-INVULNERABLE@"
.semi_invul2:
	db "THE FIRST TURN@"
	
.razor_wind1:
	db "A 2-TURN ATTACK@"
.razor_wind2:
	db "RAIN: 1 TURN MOVE@"
.razor_wind3:
	db "SUN: <MINUS>50<%> DAMAGE@"

.poltergeist1:
	db "ONLY WORKS IF THE@"
.poltergeist2:
	db "TARGET HAS AN ITEM@"
	
.solar_beam1:
	db "A 2-TURN ATTACK@"
.solar_beam2:
	db "SUN: 1 TURN MOVE@"
.solar_beam3:
	db "RAIN: <MINUS>50<%> DAMAGE@"
	
.earthquake1:
	db "X2 DMG VS A TARGET@"
.earthquake2:
	db "USING DIG@"
	
.hidden_power1:
	db "TYPE AND POWER@"
.hidden_power2:
	db "DEPEND ON THE DVs@"
.hidden_power3:
	db "OF THE USER.@"

.rage1:
	db "POWER INCREASES@"
.rage2:
	db "FOR EACH HIT TAKEN@"
.rage3:
	db "IN A ROW WHILE@"
.rage4:
	db "USING THIS MOVE@"
	
.false_swipe1:
	db "LEAVES THE TARGET@"
.false_swipe2:
	db "WITH 1 HP AT LEAST@"
	
.rapid_spin1:
	db "REMOVES HAZARDS,@"
.rapid_spin2:
	db "TRAPS AND BINDS@"
	
.bind1:
	db "POWER DOUBLES IF@"
.bind2:
	db "FOE IS PARALYZED@"
	
.snore1:
	db "ONLY WORKS IF USER@"
.snore2
	db "IS ASLEEP@"

.self_destruct1:
	db "USER LOSES 3/4TH@"
.self_destruct2:
	db "OF THEIR MAX HP.@"
.self_destruct3:
	db "ALWAYS DOES X2 DMG@"

.hyper_beam1:
	db "NO RECHARGE TURN@"
.hyper_beam2:
	db "IF TARGET FAINTS@"
	
.explosion:
	db "USER FAINTS.@"
	
.poison_gas1:
	db "LOWERS S.ATTACK,@"
.poison_gas2:
	db "ATTACK AND SPEED@"

.smog1:
	db "ALWAYS CRITS IF@"
.smog2:
	db "TARGET IS POISONED@"
	
.future_sight1:
	db "ATTACKS 2 TURNS@"
.future_sight2:
	db "LATER@"
	
.dream_eater1:
	db "ONLY WORKS IF THE@"
.dream_eater2:
	db "TARGET IS ASLEEP.@"

.rollout1:
	db "USER GETS LOCKED,@"
.rollout2:
	db "X2 POWER EACH TURN@"

.struggle1:
	db "HAS INFINITE PP,@"
.struggle2:
	db "IGNORES TYPES@"

.typeless1:
	db "IGNORES TYPE CHART@"
.typeless2:
	db "AND GETS NO STAB@"

.tri_attack1:
	db "HITS 3 TIMES, FIRE@"
.tri_attack2:
	db "ICE AND ELECTRIC.@"
.tri_attack3:
	db "INDEPENDENT HITS@"
	
.thunder1:
	db "RAIN: DOESN'T MISS@"
.thunder2:
	db "SUN: 50<%> ACCURACY@"
	
.blizzard:
	db "HAIL: DOESN'T MISS@"
	
.force_switch_fail:
	db "FAILS IF GOING 1ST@"
	
AuxEmptyString:
	db "@"
	
INCLUDE "data/moves/moves_text_matches.asm"
