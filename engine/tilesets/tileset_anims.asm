_AnimateTileset::
; Increment [hTileAnimFrame] and run that frame's function
; from the array pointed to by wTilesetAnim.

; Called in WRAM bank 1, VRAM bank 0, so map tiles
; $80 and above in VRAM bank 1 cannot be animated
; without switching to that bank themselves.

	ld a, [wTilesetAnim]
	ld e, a
	ld a, [wTilesetAnim + 1]
	ld d, a

	ldh a, [hTileAnimFrame]
	ld l, a
	inc a
	ldh [hTileAnimFrame], a

	ld h, 0
	add hl, hl
	add hl, hl
	add hl, de

; 2-byte parameter
; All functions take input de
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl

; Function address
	ld a, [hli]
	ld h, [hl]
	ld l, a

	jp hl

Tileset0Anim:
TilesetJohtoModernAnim:
TilesetKantoAnim:
	dw vTiles2 tile $14, AnimateWaterTile
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  AnimateWaterPalette
	dw NULL,  WaitTileAnimation
	dw NULL,  AnimateFlowerTile
	dw NULL,  AnimateGrassTile
	dw NULL,  AnimateTreeTopLeftTile
	dw NULL,  AnimateTreeTopRightTile
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  StandingTileFrame8
	dw NULL,  DoneTileAnimation

TilesetParkAnim:
	dw vTiles2 tile $14, AnimateWaterTile
	dw NULL,  WaitTileAnimation
	dw vTiles2 tile $5f, AnimateFountainTile
	dw NULL,  WaitTileAnimation
	dw NULL,  AnimateWaterPalette
	dw NULL,  WaitTileAnimation
	dw NULL,  AnimateFlowerTile
	dw NULL,  AnimateGrassTile
	dw NULL,  AnimateTreeTopLeftTile
	dw NULL,  AnimateTreeTopRightTile
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  StandingTileFrame8
	dw NULL,  DoneTileAnimation

TilesetForestAnim:
	dw NULL,  ForestTreeLeftAnimation
	dw NULL,  ForestTreeRightAnimation
	dw NULL,  ForestTreeLeftAnimationNC
	dw NULL,  ForestTreeRightAnimationNC
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  ForestTreeLeftAnimation2
	dw NULL,  ForestTreeRightAnimation2
	dw NULL,  ForestTreeLeftAnimation2NC
	dw NULL,  ForestTreeRightAnimation2NC
	dw NULL,  AnimateFlowerTile
	dw NULL,  AnimateTreeTopLeftTile
	dw NULL,  AnimateTreeTopRightTile
	dw vTiles2 tile $14, AnimateWaterTile
	dw NULL,  AnimateWaterPalette
	dw NULL,  StandingTileFrame8
	dw NULL,  DoneTileAnimation

TilesetJohtoAnim:
	dw vTiles2 tile $14, AnimateWaterTile
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  AnimateWaterPalette
	dw NULL,  WaitTileAnimation
	dw NULL,  AnimateFlowerTile
	dw NULL,  AnimateGrassTile
	dw NULL,  AnimateTreeTopLeftTile
	dw NULL,  AnimateTreeTopRightTile
	dw vTiles2 tile $08,  AnimateRainGrassTile
	dw vTiles2 tile $09,  AnimateRainFloorTile
	dw vTiles2 tile $46,  AnimateRainFloorHardTile
	dw vTiles2 tile $56,  AnimateRainRockBottomLeftTile
	dw vTiles2 tile $57,  AnimateRainRockBottomMiddleTile
	dw vTiles2 tile $47,  AnimateRainRockBottomRightTile
	dw vTiles2 tile $18,  AnimateRainRockMiddleLeftTile
	dw vTiles2 tile $19,  AnimateRainRockMiddleRightTile
	dw vTiles2 tile $39,  AnimateRainRockTopLeftTile
	dw vTiles2 tile $3A,  AnimateRainRockTopMiddleTile
	dw vTiles2 tile $4A,  AnimateRainRockTopRightTile
	dw vTiles2 tile $5E,  AnimateRainSignBottomLeftTile
	dw vTiles2 tile $5F,  AnimateRainSignBottomRightTile
	dw vTiles2 tile $4E,  AnimateRainSignTopLeftTile
	dw vTiles2 tile $4F,  AnimateRainSignTopRightTile
	dw vTiles2 tile $5B,  AnimateRainTGrassTile
	dw vTiles2 tile $29,  AnimateRainTreeLowestLeftTile
	dw vTiles2 tile $2A,  AnimateRainTreeLowestRightTile
	dw vTiles2 tile $27,  AnimateRainTreeMiddleLeftTile
	dw vTiles2 tile $28,  AnimateRainTreeMiddleRightTile
	dw vTiles2 tile $37,  AnimateRainTreeTopLeftTile
	dw vTiles2 tile $38,  AnimateRainTreeTopRightTile
	dw WhirlpoolFrames1, AnimateWhirlpoolTile
	dw WhirlpoolFrames2, AnimateWhirlpoolTile
	dw WhirlpoolFrames3, AnimateWhirlpoolTile
	dw WhirlpoolFrames4, AnimateWhirlpoolTile
	dw NULL,  WaitTileAnimation
	dw NULL,  StandingTileFrame8
	dw NULL,  DoneTileAnimation

UnusedTilesetAnim1: ; unreferenced
; Scrolls tile $03 like cave water, but also has the standard $03 flower tile.
	dw vTiles2 tile $03, ReadTileToAnimBuffer
	dw wTileAnimBuffer, ScrollTileRightLeft
	dw vTiles2 tile $03, WriteTileFromAnimBuffer
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  AnimateFlowerTile
	dw NULL,  AnimateGrassTile
	dw NULL,  AnimateTreeTopLeftTile
	dw NULL,  AnimateTreeTopRightTile
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  DoneTileAnimation

UnusedTilesetAnim2: ; unreferenced
; Scrolls tile $14 like cave water.
	dw vTiles2 tile $14, ReadTileToAnimBuffer
	dw wTileAnimBuffer, ScrollTileRightLeft
	dw vTiles2 tile $14, WriteTileFromAnimBuffer
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  DoneTileAnimation

TilesetPortAnim:
	dw vTiles2 tile $14, AnimateWaterTile
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  AnimateWaterPalette
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  StandingTileFrame8
	dw NULL,  DoneTileAnimation

TilesetEliteFourRoomAnim:
	dw NULL,  AnimateLavaBubbleTile2
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  AnimateLavaBubbleTile1
	dw NULL,  WaitTileAnimation
	dw NULL,  StandingTileFrame8
	dw NULL,  DoneTileAnimation

UnusedTilesetAnim3: ; unreferenced
; Scrolls tile $53 like a waterfall; scrolls tile $03 like cave water.
	dw vTiles2 tile $53, ReadTileToAnimBuffer
	dw wTileAnimBuffer, ScrollTileDown
	dw wTileAnimBuffer, ScrollTileDown
	dw vTiles2 tile $53, WriteTileFromAnimBuffer
	dw vTiles2 tile $03, ReadTileToAnimBuffer
	dw wTileAnimBuffer, ScrollTileRightLeft
	dw vTiles2 tile $03, WriteTileFromAnimBuffer
	dw vTiles2 tile $53, ReadTileToAnimBuffer
	dw wTileAnimBuffer, ScrollTileDown
	dw wTileAnimBuffer, ScrollTileDown
	dw vTiles2 tile $53, WriteTileFromAnimBuffer
	dw NULL,  DoneTileAnimation

UnusedTilesetAnim4: ; unreferenced
; Scrolls tile $54 like a waterfall; scrolls tile $03 like cave water.
	dw vTiles2 tile $54, ReadTileToAnimBuffer
	dw wTileAnimBuffer, ScrollTileDown
	dw wTileAnimBuffer, ScrollTileDown
	dw vTiles2 tile $54, WriteTileFromAnimBuffer
	dw NULL,  WaitTileAnimation
	dw vTiles2 tile $03, ReadTileToAnimBuffer
	dw wTileAnimBuffer, ScrollTileRightLeft
	dw vTiles2 tile $03, WriteTileFromAnimBuffer
	dw NULL,  WaitTileAnimation
	dw vTiles2 tile $54, ReadTileToAnimBuffer
	dw wTileAnimBuffer, ScrollTileDown
	dw wTileAnimBuffer, ScrollTileDown
	dw vTiles2 tile $54, WriteTileFromAnimBuffer
	dw NULL,  DoneTileAnimation

TilesetCaveAnim:
TilesetDarkCaveAnim:
	dw vTiles2 tile $43, AnimateWaveLeftTile
	dw vTiles2 tile $44, AnimateWaveDownTile
	dw vTiles2 tile $45, AnimateWaveRightTile
	dw vTiles2 tile $54, AnimateWaveLeftDeepTile
	dw vTiles2 tile $55, AnimateWaveDownDeepTile
	dw vTiles2 tile $56, AnimateWaveRightDeepTile
	dw vTiles2 tile $50, AnimateWaveLeftDeepDarkTile
	dw vTiles2 tile $51, AnimateWaveDownDeepDarkTile
	dw vTiles2 tile $52, AnimateWaveRightDeepDarkTile
	dw NULL, AnimateWaveRightDeepDarkTile
	dw vTiles2 tile $14, ReadTileToAnimBuffer
	dw NULL,  FlickeringCaveEntrancePalette
	dw wTileAnimBuffer, ScrollTileRightLeft
	dw NULL,  FlickeringCaveEntrancePalette
	dw vTiles2 tile $14, WriteTileFromAnimBuffer
	dw NULL,  FlickeringCaveEntrancePalette
	dw NULL,  AnimateWaterPalette
	dw NULL,  FlickeringCaveEntrancePalette
	dw vTiles2 tile $40, ReadTileToAnimBuffer
	dw NULL,  FlickeringCaveEntrancePalette
	dw wTileAnimBuffer, ScrollTileDown
	dw NULL,  FlickeringCaveEntrancePalette
	dw wTileAnimBuffer, ScrollTileDown
	dw NULL,  FlickeringCaveEntrancePalette
	dw wTileAnimBuffer, ScrollTileDown
	dw NULL,  FlickeringCaveEntrancePalette
	dw vTiles2 tile $40, WriteTileFromAnimBuffer
	dw NULL,  FlickeringCaveEntrancePalette
	dw vTiles2 tile $53, ReadTileToAnimBuffer
	dw NULL,  FlickeringCaveEntrancePalette
	dw wTileAnimBuffer, ScrollTileDown
	dw NULL,  FlickeringCaveEntrancePalette
	dw wTileAnimBuffer, ScrollTileDown
	dw NULL,  FlickeringCaveEntrancePalette
	dw wTileAnimBuffer, ScrollTileDown
	dw NULL,  FlickeringCaveEntrancePalette
	dw vTiles2 tile $53, WriteTileFromAnimBuffer
	dw NULL,  FlickeringCaveEntrancePalette
	dw NULL,  DoneTileAnimation

TilesetIcePathAnim:
	dw vTiles2 tile $35, ReadTileToAnimBuffer
	dw NULL,  FlickeringCaveEntrancePalette
	dw wTileAnimBuffer, ScrollTileRightLeft
	dw NULL,  FlickeringCaveEntrancePalette
	dw vTiles2 tile $35, WriteTileFromAnimBuffer
	dw NULL,  FlickeringCaveEntrancePalette
	dw NULL,  AnimateWaterPalette
	dw NULL,  FlickeringCaveEntrancePalette
	dw vTiles2 tile $31, ReadTileToAnimBuffer
	dw NULL,  FlickeringCaveEntrancePalette
	dw wTileAnimBuffer, ScrollTileDown
	dw NULL,  FlickeringCaveEntrancePalette
	dw wTileAnimBuffer, ScrollTileDown
	dw NULL,  FlickeringCaveEntrancePalette
	dw wTileAnimBuffer, ScrollTileDown
	dw NULL,  FlickeringCaveEntrancePalette
	dw vTiles2 tile $31, WriteTileFromAnimBuffer
	dw NULL,  FlickeringCaveEntrancePalette
	dw NULL,  DoneTileAnimation

TilesetTowerAnim:
	dw TowerPillarTilePointer9, AnimateTowerPillarTile
	dw TowerPillarTilePointer10, AnimateTowerPillarTile
	dw TowerPillarTilePointer7, AnimateTowerPillarTile
	dw TowerPillarTilePointer8, AnimateTowerPillarTile
	dw TowerPillarTilePointer5, AnimateTowerPillarTile
	dw TowerPillarTilePointer6, AnimateTowerPillarTile
	dw TowerPillarTilePointer3, AnimateTowerPillarTile
	dw TowerPillarTilePointer4, AnimateTowerPillarTile
	dw TowerPillarTilePointer1, AnimateTowerPillarTile
	dw TowerPillarTilePointer2, AnimateTowerPillarTile
	dw NULL,  StandingTileFrame
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  DoneTileAnimation

UnusedTilesetAnim5: ; unreferenced
; Scrolls tile $4f like cave water.
	dw vTiles2 tile $4f, ReadTileToAnimBuffer
	dw wTileAnimBuffer, ScrollTileRightLeft
	dw vTiles2 tile $4f, WriteTileFromAnimBuffer
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  DoneTileAnimation

TilesetBattleTowerOutsideAnim:
TilesetHouseAnim:
TilesetPlayersHouseAnim:
TilesetPokecenterAnim:
TilesetGateAnim:
TilesetLabAnim:
TilesetFacilityAnim:
TilesetMartAnim:
TilesetMansionAnim:
TilesetGameCornerAnim:
TilesetTraditionalHouseAnim:
TilesetTrainStationAnim:
TilesetChampionsRoomAnim:
TilesetLighthouseAnim:
TilesetPlayersRoomAnim:
TilesetPokeComCenterAnim:
TilesetBattleTowerInsideAnim:
TilesetRuinsOfAlphAnim:
TilesetRadioTowerAnim:
TilesetUndergroundAnim:
TilesetBetaWordRoomAnim:
TilesetHoOhWordRoomAnim:
TilesetKabutoWordRoomAnim:
TilesetOmanyteWordRoomAnim:
TilesetAerodactylWordRoomAnim:
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  DoneTileAnimation

DoneTileAnimation:
; Reset the animation command loop.
	xor a
	ldh [hTileAnimFrame], a

WaitTileAnimation:
; Do nothing this frame.
	ret

StandingTileFrame8:
; Tick the wTileAnimationTimer, wrapping from 7 to 0.
	ld a, [wTileAnimationTimer]
	inc a
	and %111
	ld [wTileAnimationTimer], a
	ret

ScrollTileRightLeft:
; Scroll right for 4 ticks, then left for 4 ticks.
	ld a, [wTileAnimationTimer]
	inc a
	and %111
	ld [wTileAnimationTimer], a
	and %100
	jr nz, ScrollTileLeft
	jr ScrollTileRight

ScrollTileUpDown: ; unreferenced
; Scroll up for 4 ticks, then down for 4 ticks.
	ld a, [wTileAnimationTimer]
	inc a
	and %111
	ld [wTileAnimationTimer], a
	and %100
	jr nz, ScrollTileDown
	jr ScrollTileUp

ScrollTileLeft:
	ld h, d
	ld l, e
	ld c, LEN_2BPP_TILE / 4
.loop
rept 4
	ld a, [hl]
	rlca
	ld [hli], a
endr
	dec c
	jr nz, .loop
	ret

ScrollTileRight:
	ld h, d
	ld l, e
	ld c, LEN_2BPP_TILE / 4
.loop
rept 4
	ld a, [hl]
	rrca
	ld [hli], a
endr
	dec c
	jr nz, .loop
	ret

ScrollTileUp:
	ld h, d
	ld l, e
	ld d, [hl]
	inc hl
	ld e, [hl]
	ld bc, LEN_2BPP_TILE - 2
	add hl, bc
	ld a, LEN_2BPP_TILE / 4
.loop
	ld c, [hl]
	ld [hl], e
	dec hl
	ld b, [hl]
	ld [hl], d
	dec hl
	ld e, [hl]
	ld [hl], c
	dec hl
	ld d, [hl]
	ld [hl], b
	dec hl
	dec a
	jr nz, .loop
	ret

ScrollTileDown:
	ld h, d
	ld l, e
	ld de, LEN_2BPP_TILE - 2
	push hl
	add hl, de
	ld d, [hl]
	inc hl
	ld e, [hl]
	pop hl
	ld a, LEN_2BPP_TILE / 4
.loop
	ld b, [hl]
	ld [hl], d
	inc hl
	ld c, [hl]
	ld [hl], e
	inc hl
	ld d, [hl]
	ld [hl], b
	inc hl
	ld e, [hl]
	ld [hl], c
	inc hl
	dec a
	jr nz, .loop
	ret

AnimateFountainTile:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

	ld hl, .FountainTileFramePointers

; A cycle of 8 frames, updating every tick
	ld a, [wTileAnimationTimer]
	and %111

; hl = [.FountainTileFramePointers + a * 2]
	add a
	add l
	ld l, a
	jr nc, .okay
	inc h
.okay
	ld a, [hli]
	ld h, [hl]
	ld l, a

; Write the tile graphic from hl (now sp) to de (now hl)
	ld sp, hl
	ld l, e
	ld h, d
	jp WriteTile

.FountainTileFramePointers:
	dw .FountainTile1
	dw .FountainTile2
	dw .FountainTile3
	dw .FountainTile4
	dw .FountainTile3
	dw .FountainTile4
	dw .FountainTile5
	dw .FountainTile1

.FountainTile1: INCBIN "gfx/tilesets/fountain/1.2bpp"
.FountainTile2: INCBIN "gfx/tilesets/fountain/2.2bpp"
.FountainTile3: INCBIN "gfx/tilesets/fountain/3.2bpp"
.FountainTile4: INCBIN "gfx/tilesets/fountain/4.2bpp"
.FountainTile5: INCBIN "gfx/tilesets/fountain/5.2bpp"

AnimateWaterTile:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

; A cycle of 4 frames, updating every other tick
	ld a, [wTileAnimationTimer]
	and %110

; hl = .WaterTileFrames + a * 8
; (a was pre-multiplied by 2 from 'and %110')
	add a
	add a
	add a
	add LOW(.WaterTileFrames)
	ld l, a
	ld a, 0
	adc HIGH(.WaterTileFrames)
	ld h, a

; Write the tile graphic from hl (now sp) to de (now hl)
	ld sp, hl
	ld l, e
	ld h, d
	jp WriteTile

.WaterTileFrames:
	INCBIN "gfx/tilesets/water/water.2bpp"

ForestTreeLeftAnimation:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

; Only animate this during the Celebi event
	ld a, [wCelebiEvent]
	bit CELEBIEVENT_FOREST_IS_RESTLESS_F, a
	jr nz, .do_animation
	ld hl, ForestTreeLeftFrames
	jr .got_frames

.do_animation
; A cycle of 2 frames, updating every tick
	ld a, [wTileAnimationTimer]
	call GetForestTreeFrame

; hl = ForestTreeLeftFrames + a * 8
; (a was pre-multiplied by 2 from GetForestTreeFrame)
	add a
	add a
	add a
	add LOW(ForestTreeLeftFrames)
	ld l, a
	ld a, 0
	adc HIGH(ForestTreeLeftFrames)
	ld h, a

.got_frames
; Write the tile graphic from hl (now sp) to tile $0c (now hl)
	ld sp, hl
	ld hl, vTiles2 tile $0c
	jp WriteTile

ForestTreeLeftFrames:
	INCBIN "gfx/tilesets/forest-tree/1.2bpp"
	INCBIN "gfx/tilesets/forest-tree/2.2bpp"

ForestTreeRightFrames:
	INCBIN "gfx/tilesets/forest-tree/3.2bpp"
	INCBIN "gfx/tilesets/forest-tree/4.2bpp"

ForestTreeRightAnimation:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

; Only animate this during the Celebi event
	ld a, [wCelebiEvent]
	bit CELEBIEVENT_FOREST_IS_RESTLESS_F, a
	jr nz, .do_animation
	ld hl, ForestTreeRightFrames
	jr .got_frames

.do_animation
; A cycle of 2 frames, updating every tick
	ld a, [wTileAnimationTimer]
	call GetForestTreeFrame

; hl = ForestTreeRightFrames + a * 8
; (a was pre-multiplied by 2 from GetForestTreeFrame)
	add a
	add a
	add a
	add LOW(ForestTreeLeftFrames)
	ld l, a
	ld a, 0
	adc HIGH(ForestTreeLeftFrames)
	ld h, a
	push bc
	ld bc, ForestTreeRightFrames - ForestTreeLeftFrames
	add hl, bc
	pop bc

.got_frames
; Write the tile graphic from hl (now sp) to tile $0f (now hl)
	ld sp, hl
	ld hl, vTiles2 tile $0f
	jp WriteTile

ForestTreeLeftAnimation2:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

; Only animate this during the Celebi event
	ld a, [wCelebiEvent]
	bit CELEBIEVENT_FOREST_IS_RESTLESS_F, a
	jr nz, .do_animation
	ld hl, ForestTreeLeftFrames
	jr .got_frames

.do_animation
; A cycle of 2 frames, updating every tick
	ld a, [wTileAnimationTimer]
	call GetForestTreeFrame

; Offset by 1 frame from ForestTreeLeftAnimation
	xor %10

; hl = ForestTreeLeftFrames + a * 8
; (a was pre-multiplied by 2 from GetForestTreeFrame)
	add a
	add a
	add a
	add LOW(ForestTreeLeftFrames)
	ld l, a
	ld a, 0
	adc HIGH(ForestTreeLeftFrames)
	ld h, a

.got_frames
; Write the tile graphic from hl (now sp) to tile $0c (now hl)
	ld sp, hl
	ld hl, vTiles2 tile $0c
	jp WriteTile

ForestTreeRightAnimation2:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

; Only animate this during the Celebi event
	ld a, [wCelebiEvent]
	bit CELEBIEVENT_FOREST_IS_RESTLESS_F, a
	jr nz, .do_animation
	ld hl, ForestTreeRightFrames
	jr .got_frames

.do_animation
; A cycle of 2 frames, updating every tick
	ld a, [wTileAnimationTimer]
	call GetForestTreeFrame

; Offset by 1 frame from ForestTreeRightAnimation
	xor %10

; hl = ForestTreeRightFrames + a * 8
; (a was pre-multiplied by 2 from GetForestTreeFrame)
	add a
	add a
	add a
	add LOW(ForestTreeLeftFrames)
	ld l, a
	ld a, 0
	adc HIGH(ForestTreeLeftFrames)
	ld h, a
	push bc
	ld bc, ForestTreeRightFrames - ForestTreeLeftFrames
	add hl, bc
	pop bc

.got_frames
; Write the tile graphic from hl (now sp) to tile $0f (now hl)
	ld sp, hl
	ld hl, vTiles2 tile $0f
	jp WriteTile

ForestTreeLeftAnimationNC:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

.do_animation
; A cycle of 2 frames, updating every tick
	ld a, [wTileAnimationTimer]
	call GetForestTreeFrame

; hl = ForestTreeLeftFrames + a * 8
; (a was pre-multiplied by 2 from GetForestTreeFrame)
	add a
	add a
	add a
	add LOW(ForestTreeLeftFrames)
	ld l, a
	ld a, 0
	adc HIGH(ForestTreeLeftFrames)
	ld h, a

.got_frames
; Write the tile graphic from hl (now sp) to tile $0c (now hl)
	ld sp, hl
	ld hl, vTiles2 tile $43
	jp WriteTile

ForestTreeRightAnimationNC:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

.do_animation
; A cycle of 2 frames, updating every tick
	ld a, [wTileAnimationTimer]
	call GetForestTreeFrame

; hl = ForestTreeRightFrames + a * 8
; (a was pre-multiplied by 2 from GetForestTreeFrame)
	add a
	add a
	add a
	add LOW(ForestTreeLeftFrames)
	ld l, a
	ld a, 0
	adc HIGH(ForestTreeLeftFrames)
	ld h, a
	push bc
	ld bc, ForestTreeRightFrames - ForestTreeLeftFrames
	add hl, bc
	pop bc

.got_frames
; Write the tile graphic from hl (now sp) to tile $0f (now hl)
	ld sp, hl
	ld hl, vTiles2 tile $44
	jp WriteTile

ForestTreeLeftAnimation2NC:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

.do_animation
; A cycle of 2 frames, updating every tick
	ld a, [wTileAnimationTimer]
	call GetForestTreeFrame

; Offset by 1 frame from ForestTreeLeftAnimation
	xor %10

; hl = ForestTreeLeftFrames + a * 8
; (a was pre-multiplied by 2 from GetForestTreeFrame)
	add a
	add a
	add a
	add LOW(ForestTreeLeftFrames)
	ld l, a
	ld a, 0
	adc HIGH(ForestTreeLeftFrames)
	ld h, a

.got_frames
; Write the tile graphic from hl (now sp) to tile $0c (now hl)
	ld sp, hl
	ld hl, vTiles2 tile $43
	jp WriteTile

ForestTreeRightAnimation2NC:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

.do_animation
; A cycle of 2 frames, updating every tick
	ld a, [wTileAnimationTimer]
	call GetForestTreeFrame

; Offset by 1 frame from ForestTreeRightAnimation
	xor %10

; hl = ForestTreeRightFrames + a * 8
; (a was pre-multiplied by 2 from GetForestTreeFrame)
	add a
	add a
	add a
	add LOW(ForestTreeLeftFrames)
	ld l, a
	ld a, 0
	adc HIGH(ForestTreeLeftFrames)
	ld h, a
	push bc
	ld bc, ForestTreeRightFrames - ForestTreeLeftFrames
	add hl, bc
	pop bc

.got_frames
; Write the tile graphic from hl (now sp) to tile $0f (now hl)
	ld sp, hl
	ld hl, vTiles2 tile $44
	jp WriteTile

GetForestTreeFrame:
; Return 0 if a is even, or 2 if odd.
	and a
	jr z, .even
	cp 1
	jr z, .odd
	cp 2
	jr z, .even
	cp 3
	jr z, .odd
	cp 4
	jr z, .even
	cp 5
	jr z, .odd
	cp 6
	jr z, .even
.odd
	ld a, 2
	scf
	ret
.even
	xor a
	ret

AnimateGrassTile:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

; A cycle of 2 frames, updating every other tick
	ld a, [wTileAnimationTimer]
	and %10

; hl = .GrassTileFrames + a * 8
	add a
	add a
	add a
	ld e, a
	ld d, 0
	ld hl, .GrassTileFrames
	add hl, de

; Write the tile graphic from hl (now sp) to tile $04 (now hl)
	ld sp, hl
	ld hl, vTiles2 tile $04
	jp WriteTile

.GrassTileFrames:
	INCBIN "gfx/tilesets/grass/grass1.2bpp"
	INCBIN "gfx/tilesets/grass/grass2.2bpp"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;WAVES;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

AnimateWaveRightTile:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

	ld hl, .WaveRightTileFramesPointers

; A cycle of 8 frames, updating every tick
	ld a, [wTileAnimationTimer]
	and %111

; hl = [.WaveRightTileFramesPointers + a * 2]
	add a
	add l
	ld l, a
	jr nc, .okay
	inc h
.okay
	ld a, [hli]
	ld h, [hl]
	ld l, a

; Write the tile graphic from hl (now sp) to de (now hl)
	ld sp, hl
	ld l, e
	ld h, d
	jp WriteTile

.WaveRightTileFramesPointers:
	dw .WaveRightTile1
	dw .WaveRightTile2
	dw .WaveRightTile3
	dw .WaveRightTile4
	dw .WaveRightTile1
	dw .WaveRightTile2
	dw .WaveRightTile3
	dw .WaveRightTile4

.WaveRightTile1: INCBIN "gfx/tilesets/waves/waveright1.2bpp"
.WaveRightTile2: INCBIN "gfx/tilesets/waves/waveright2.2bpp"
.WaveRightTile3: INCBIN "gfx/tilesets/waves/waveright3.2bpp"
.WaveRightTile4: INCBIN "gfx/tilesets/waves/waveright4.2bpp"

AnimateWaveDownTile:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

	ld hl, .WaveDownTileFramesPointers

; A cycle of 8 frames, updating every tick
	ld a, [wTileAnimationTimer]
	and %111

; hl = [.WaveDownTileFramesPointers + a * 2]
	add a
	add l
	ld l, a
	jr nc, .okay
	inc h
.okay
	ld a, [hli]
	ld h, [hl]
	ld l, a

; Write the tile graphic from hl (now sp) to de (now hl)
	ld sp, hl
	ld l, e
	ld h, d
	jp WriteTile

.WaveDownTileFramesPointers:
	dw .WaveDownTile1
	dw .WaveDownTile2
	dw .WaveDownTile3
	dw .WaveDownTile4
	dw .WaveDownTile1
	dw .WaveDownTile2
	dw .WaveDownTile3
	dw .WaveDownTile4

.WaveDownTile1: INCBIN "gfx/tilesets/waves/wavedown1.2bpp"
.WaveDownTile2: INCBIN "gfx/tilesets/waves/wavedown2.2bpp"
.WaveDownTile3: INCBIN "gfx/tilesets/waves/wavedown3.2bpp"
.WaveDownTile4: INCBIN "gfx/tilesets/waves/wavedown4.2bpp"

AnimateWaveLeftTile:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

	ld hl, .WaveLeftTileFramesPointers

; A cycle of 8 frames, updating every tick
	ld a, [wTileAnimationTimer]
	and %111

; hl = [.WaveLeftTileFramesPointers + a * 2]
	add a
	add l
	ld l, a
	jr nc, .okay
	inc h
.okay
	ld a, [hli]
	ld h, [hl]
	ld l, a

; Write the tile graphic from hl (now sp) to de (now hl)
	ld sp, hl
	ld l, e
	ld h, d
	jp WriteTile

.WaveLeftTileFramesPointers:
	dw .WaveLeftTile1
	dw .WaveLeftTile2
	dw .WaveLeftTile3
	dw .WaveLeftTile4
	dw .WaveLeftTile1
	dw .WaveLeftTile2
	dw .WaveLeftTile3
	dw .WaveLeftTile4

.WaveLeftTile1: INCBIN "gfx/tilesets/waves/waveleft1.2bpp"
.WaveLeftTile2: INCBIN "gfx/tilesets/waves/waveleft2.2bpp"
.WaveLeftTile3: INCBIN "gfx/tilesets/waves/waveleft3.2bpp"
.WaveLeftTile4: INCBIN "gfx/tilesets/waves/waveleft4.2bpp"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;DEEP WAVES;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

AnimateWaveDownDeepTile:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

	ld hl, .WaveDownDeepTileFramesPointers

; A cycle of 8 frames, updating every tick
	ld a, [wTileAnimationTimer]
	and %111

; hl = [.WaveDownDeepTileFramesPointers + a * 2]
	add a
	add l
	ld l, a
	jr nc, .okay
	inc h
.okay
	ld a, [hli]
	ld h, [hl]
	ld l, a

; Write the tile graphic from hl (now sp) to de (now hl)
	ld sp, hl
	ld l, e
	ld h, d
	jp WriteTile

.WaveDownDeepTileFramesPointers:
	dw .WaveDownDeepTile1
	dw .WaveDownDeepTile2
	dw .WaveDownDeepTile3
	dw .WaveDownDeepTile4
	dw .WaveDownDeepTile1
	dw .WaveDownDeepTile2
	dw .WaveDownDeepTile3
	dw .WaveDownDeepTile4

.WaveDownDeepTile1: INCBIN "gfx/tilesets/waves/wavedowndeep1.2bpp"
.WaveDownDeepTile2: INCBIN "gfx/tilesets/waves/wavedowndeep2.2bpp"
.WaveDownDeepTile3: INCBIN "gfx/tilesets/waves/wavedowndeep3.2bpp"
.WaveDownDeepTile4: INCBIN "gfx/tilesets/waves/wavedowndeep4.2bpp"

AnimateWaveRightDeepTile:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

	ld hl, .WaveRightDeepTileFramesPointers

; A cycle of 8 frames, updating every tick
	ld a, [wTileAnimationTimer]
	and %111

; hl = [.WaveRightDeepTileFramesPointers + a * 2]
	add a
	add l
	ld l, a
	jr nc, .okay
	inc h
.okay
	ld a, [hli]
	ld h, [hl]
	ld l, a

; Write the tile graphic from hl (now sp) to de (now hl)
	ld sp, hl
	ld l, e
	ld h, d
	jp WriteTile

.WaveRightDeepTileFramesPointers:
	dw .WaveRightDeepTile1
	dw .WaveRightDeepTile2
	dw .WaveRightDeepTile3
	dw .WaveRightDeepTile4
	dw .WaveRightDeepTile1
	dw .WaveRightDeepTile2
	dw .WaveRightDeepTile3
	dw .WaveRightDeepTile4

.WaveRightDeepTile1: INCBIN "gfx/tilesets/waves/waverightdeep1.2bpp"
.WaveRightDeepTile2: INCBIN "gfx/tilesets/waves/waverightdeep2.2bpp"
.WaveRightDeepTile3: INCBIN "gfx/tilesets/waves/waverightdeep3.2bpp"
.WaveRightDeepTile4: INCBIN "gfx/tilesets/waves/waverightdeep4.2bpp"

AnimateWaveLeftDeepTile:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

	ld hl, .WaveLeftDeepTileFramesPointers

; A cycle of 8 frames, updating every tick
	ld a, [wTileAnimationTimer]
	and %111

; hl = [.WaveLeftDeepTileFramesPointers + a * 2]
	add a
	add l
	ld l, a
	jr nc, .okay
	inc h
.okay
	ld a, [hli]
	ld h, [hl]
	ld l, a

; Write the tile graphic from hl (now sp) to de (now hl)
	ld sp, hl
	ld l, e
	ld h, d
	jp WriteTile

.WaveLeftDeepTileFramesPointers:
	dw .WaveLeftDeepTile1
	dw .WaveLeftDeepTile2
	dw .WaveLeftDeepTile3
	dw .WaveLeftDeepTile4
	dw .WaveLeftDeepTile1
	dw .WaveLeftDeepTile2
	dw .WaveLeftDeepTile3
	dw .WaveLeftDeepTile4

.WaveLeftDeepTile1: INCBIN "gfx/tilesets/waves/waveleftdeep1.2bpp"
.WaveLeftDeepTile2: INCBIN "gfx/tilesets/waves/waveleftdeep2.2bpp"
.WaveLeftDeepTile3: INCBIN "gfx/tilesets/waves/waveleftdeep3.2bpp"
.WaveLeftDeepTile4: INCBIN "gfx/tilesets/waves/waveleftdeep4.2bpp"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;DEEP DARK WAVES;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

AnimateWaveDownDeepDarkTile:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

	ld hl, .WaveDownDeepDarkTileFramesPointers

; A cycle of 8 frames, updating every tick
	ld a, [wTileAnimationTimer]
	and %111

; hl = [.WaveDownDeepDarkTileFramesPointers + a * 2]
	add a
	add l
	ld l, a
	jr nc, .okay
	inc h
.okay
	ld a, [hli]
	ld h, [hl]
	ld l, a

; Write the tile graphic from hl (now sp) to de (now hl)
	ld sp, hl
	ld l, e
	ld h, d
	jp WriteTile

.WaveDownDeepDarkTileFramesPointers:
	dw .WaveDownDeepDarkTile1
	dw .WaveDownDeepDarkTile2
	dw .WaveDownDeepDarkTile3
	dw .WaveDownDeepDarkTile4
	dw .WaveDownDeepDarkTile1
	dw .WaveDownDeepDarkTile2
	dw .WaveDownDeepDarkTile3
	dw .WaveDownDeepDarkTile4

.WaveDownDeepDarkTile1: INCBIN "gfx/tilesets/waves/wavedowndeepdark1.2bpp"
.WaveDownDeepDarkTile2: INCBIN "gfx/tilesets/waves/wavedowndeepdark2.2bpp"
.WaveDownDeepDarkTile3: INCBIN "gfx/tilesets/waves/wavedowndeepdark3.2bpp"
.WaveDownDeepDarkTile4: INCBIN "gfx/tilesets/waves/wavedowndeepdark4.2bpp"

AnimateWaveRightDeepDarkTile:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

	ld hl, .WaveRightDeepDarkTileFramesPointers

; A cycle of 8 frames, updating every tick
	ld a, [wTileAnimationTimer]
	and %111

; hl = [.WaveRightDeepDarkTileFramesPointers + a * 2]
	add a
	add l
	ld l, a
	jr nc, .okay
	inc h
.okay
	ld a, [hli]
	ld h, [hl]
	ld l, a

; Write the tile graphic from hl (now sp) to de (now hl)
	ld sp, hl
	ld l, e
	ld h, d
	jp WriteTile

.WaveRightDeepDarkTileFramesPointers:
	dw .WaveRightDeepDarkTile1
	dw .WaveRightDeepDarkTile2
	dw .WaveRightDeepDarkTile3
	dw .WaveRightDeepDarkTile4
	dw .WaveRightDeepDarkTile1
	dw .WaveRightDeepDarkTile2
	dw .WaveRightDeepDarkTile3
	dw .WaveRightDeepDarkTile4

.WaveRightDeepDarkTile1: INCBIN "gfx/tilesets/waves/waverightdeepdark1.2bpp"
.WaveRightDeepDarkTile2: INCBIN "gfx/tilesets/waves/waverightdeepdark2.2bpp"
.WaveRightDeepDarkTile3: INCBIN "gfx/tilesets/waves/waverightdeepdark3.2bpp"
.WaveRightDeepDarkTile4: INCBIN "gfx/tilesets/waves/waverightdeepdark4.2bpp"

AnimateWaveLeftDeepDarkTile:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

	ld hl, .WaveLeftDeepDarkTileFramesPointers

; A cycle of 8 frames, updating every tick
	ld a, [wTileAnimationTimer]
	and %111

; hl = [.WaveLeftDeepDarkTileFramesPointers + a * 2]
	add a
	add l
	ld l, a
	jr nc, .okay
	inc h
.okay
	ld a, [hli]
	ld h, [hl]
	ld l, a

; Write the tile graphic from hl (now sp) to de (now hl)
	ld sp, hl
	ld l, e
	ld h, d
	jp WriteTile

.WaveLeftDeepDarkTileFramesPointers:
	dw .WaveLeftDeepDarkTile1
	dw .WaveLeftDeepDarkTile2
	dw .WaveLeftDeepDarkTile3
	dw .WaveLeftDeepDarkTile4
	dw .WaveLeftDeepDarkTile1
	dw .WaveLeftDeepDarkTile2
	dw .WaveLeftDeepDarkTile3
	dw .WaveLeftDeepDarkTile4

.WaveLeftDeepDarkTile1: INCBIN "gfx/tilesets/waves/waveleftdeepdark1.2bpp"
.WaveLeftDeepDarkTile2: INCBIN "gfx/tilesets/waves/waveleftdeepdark2.2bpp"
.WaveLeftDeepDarkTile3: INCBIN "gfx/tilesets/waves/waveleftdeepdark3.2bpp"
.WaveLeftDeepDarkTile4: INCBIN "gfx/tilesets/waves/waveleftdeepdark4.2bpp"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;RAIN;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

AnimateRainGrassTile:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

	ld hl, .RainGrassTileFramesPointers

; A cycle of 8 frames, updating every tick
	ld a, [wTileAnimationTimer]
	and %111

; hl = [.RainGrassTileFramesPointers + a * 2]
	add a
	add l
	ld l, a
	jr nc, .okay
	inc h
.okay
	ld a, [hli]
	ld h, [hl]
	ld l, a

; Write the tile graphic from hl (now sp) to de (now hl)
	ld sp, hl
	ld l, e
	ld h, d
	jp WriteTile

.RainGrassTileFramesPointers:
	dw .RainGrassTile1
	dw .RainGrassTile2
	dw .RainGrassTile3
	dw .RainGrassTile4
	dw .RainGrassTile5
	dw .RainGrassTile6
	dw .RainGrassTile7
	dw .RainGrassTile8

.RainGrassTile1: INCBIN "gfx/tilesets/rain/raingrass1.2bpp"
.RainGrassTile2: INCBIN "gfx/tilesets/rain/raingrass2.2bpp"
.RainGrassTile3: INCBIN "gfx/tilesets/rain/raingrass3.2bpp"
.RainGrassTile4: INCBIN "gfx/tilesets/rain/raingrass4.2bpp"
.RainGrassTile5: INCBIN "gfx/tilesets/rain/raingrass5.2bpp"
.RainGrassTile6: INCBIN "gfx/tilesets/rain/raingrass6.2bpp"
.RainGrassTile7: INCBIN "gfx/tilesets/rain/raingrass7.2bpp"
.RainGrassTile8: INCBIN "gfx/tilesets/rain/raingrass8.2bpp"


AnimateRainFloorTile:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

	ld hl, .RainFloorTileFramesPointers

; A cycle of 8 frames, updating every tick
	ld a, [wTileAnimationTimer]
	and %111

; hl = [.RainFloorTileFramesPointers + a * 2]
	add a
	add l
	ld l, a
	jr nc, .okay
	inc h
.okay
	ld a, [hli]
	ld h, [hl]
	ld l, a

; Write the tile graphic from hl (now sp) to de (now hl)
	ld sp, hl
	ld l, e
	ld h, d
	jp WriteTile

.RainFloorTileFramesPointers:
	dw .RainFloorTile1
	dw .RainFloorTile2
	dw .RainFloorTile3
	dw .RainFloorTile4
	dw .RainFloorTile5
	dw .RainFloorTile6
	dw .RainFloorTile7
	dw .RainFloorTile8

.RainFloorTile1: INCBIN "gfx/tilesets/rain/rainFloor1.2bpp"
.RainFloorTile2: INCBIN "gfx/tilesets/rain/rainFloor2.2bpp"
.RainFloorTile3: INCBIN "gfx/tilesets/rain/rainFloor3.2bpp"
.RainFloorTile4: INCBIN "gfx/tilesets/rain/rainFloor4.2bpp"
.RainFloorTile5: INCBIN "gfx/tilesets/rain/rainFloor5.2bpp"
.RainFloorTile6: INCBIN "gfx/tilesets/rain/rainFloor6.2bpp"
.RainFloorTile7: INCBIN "gfx/tilesets/rain/rainFloor7.2bpp"
.RainFloorTile8: INCBIN "gfx/tilesets/rain/rainFloor8.2bpp"


AnimateRainFloorHardTile:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

	ld hl, .RainFloorHardTileFramesPointers

; A cycle of 8 frames, updating every tick
	ld a, [wTileAnimationTimer]
	and %111

; hl = [.RainFloorHardTileFramesPointers + a * 2]
	add a
	add l
	ld l, a
	jr nc, .okay
	inc h
.okay
	ld a, [hli]
	ld h, [hl]
	ld l, a

; Write the tile graphic from hl (now sp) to de (now hl)
	ld sp, hl
	ld l, e
	ld h, d
	jp WriteTile

.RainFloorHardTileFramesPointers:
	dw .RainFloorHardTile1
	dw .RainFloorHardTile2
	dw .RainFloorHardTile3
	dw .RainFloorHardTile4
	dw .RainFloorHardTile5
	dw .RainFloorHardTile6
	dw .RainFloorHardTile7
	dw .RainFloorHardTile8

.RainFloorHardTile1: INCBIN "gfx/tilesets/rain/rainFloorHard1.2bpp"
.RainFloorHardTile2: INCBIN "gfx/tilesets/rain/rainFloorHard2.2bpp"
.RainFloorHardTile3: INCBIN "gfx/tilesets/rain/rainFloorHard3.2bpp"
.RainFloorHardTile4: INCBIN "gfx/tilesets/rain/rainFloorHard4.2bpp"
.RainFloorHardTile5: INCBIN "gfx/tilesets/rain/rainFloorHard5.2bpp"
.RainFloorHardTile6: INCBIN "gfx/tilesets/rain/rainFloorHard6.2bpp"
.RainFloorHardTile7: INCBIN "gfx/tilesets/rain/rainFloorHard7.2bpp"
.RainFloorHardTile8: INCBIN "gfx/tilesets/rain/rainFloorHard8.2bpp"


AnimateRainRockBottomLeftTile:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

	ld hl, .RainRockBottomLeftTileFramesPointers

; A cycle of 8 frames, updating every tick
	ld a, [wTileAnimationTimer]
	and %111

; hl = [.RainRockBottomLeftTileFramesPointers + a * 2]
	add a
	add l
	ld l, a
	jr nc, .okay
	inc h
.okay
	ld a, [hli]
	ld h, [hl]
	ld l, a

; Write the tile graphic from hl (now sp) to de (now hl)
	ld sp, hl
	ld l, e
	ld h, d
	jp WriteTile

.RainRockBottomLeftTileFramesPointers:
	dw .RainRockBottomLeftTile1
	dw .RainRockBottomLeftTile2
	dw .RainRockBottomLeftTile3
	dw .RainRockBottomLeftTile4
	dw .RainRockBottomLeftTile5
	dw .RainRockBottomLeftTile6
	dw .RainRockBottomLeftTile7
	dw .RainRockBottomLeftTile8

.RainRockBottomLeftTile1: INCBIN "gfx/tilesets/rain/rainRockBottomLeft1.2bpp"
.RainRockBottomLeftTile2: INCBIN "gfx/tilesets/rain/rainRockBottomLeft2.2bpp"
.RainRockBottomLeftTile3: INCBIN "gfx/tilesets/rain/rainRockBottomLeft3.2bpp"
.RainRockBottomLeftTile4: INCBIN "gfx/tilesets/rain/rainRockBottomLeft4.2bpp"
.RainRockBottomLeftTile5: INCBIN "gfx/tilesets/rain/rainRockBottomLeft5.2bpp"
.RainRockBottomLeftTile6: INCBIN "gfx/tilesets/rain/rainRockBottomLeft6.2bpp"
.RainRockBottomLeftTile7: INCBIN "gfx/tilesets/rain/rainRockBottomLeft7.2bpp"
.RainRockBottomLeftTile8: INCBIN "gfx/tilesets/rain/rainRockBottomLeft8.2bpp"


AnimateRainRockBottomMiddleTile:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

	ld hl, .RainRockBottomMiddleTileFramesPointers

; A cycle of 8 frames, updating every tick
	ld a, [wTileAnimationTimer]
	and %111

; hl = [.RainRockBottomMiddleTileFramesPointers + a * 2]
	add a
	add l
	ld l, a
	jr nc, .okay
	inc h
.okay
	ld a, [hli]
	ld h, [hl]
	ld l, a

; Write the tile graphic from hl (now sp) to de (now hl)
	ld sp, hl
	ld l, e
	ld h, d
	jp WriteTile

.RainRockBottomMiddleTileFramesPointers:
	dw .RainRockBottomMiddleTile1
	dw .RainRockBottomMiddleTile2
	dw .RainRockBottomMiddleTile3
	dw .RainRockBottomMiddleTile4
	dw .RainRockBottomMiddleTile5
	dw .RainRockBottomMiddleTile6
	dw .RainRockBottomMiddleTile7
	dw .RainRockBottomMiddleTile8

.RainRockBottomMiddleTile1: INCBIN "gfx/tilesets/rain/rainRockBottomMiddle1.2bpp"
.RainRockBottomMiddleTile2: INCBIN "gfx/tilesets/rain/rainRockBottomMiddle2.2bpp"
.RainRockBottomMiddleTile3: INCBIN "gfx/tilesets/rain/rainRockBottomMiddle3.2bpp"
.RainRockBottomMiddleTile4: INCBIN "gfx/tilesets/rain/rainRockBottomMiddle4.2bpp"
.RainRockBottomMiddleTile5: INCBIN "gfx/tilesets/rain/rainRockBottomMiddle5.2bpp"
.RainRockBottomMiddleTile6: INCBIN "gfx/tilesets/rain/rainRockBottomMiddle6.2bpp"
.RainRockBottomMiddleTile7: INCBIN "gfx/tilesets/rain/rainRockBottomMiddle7.2bpp"
.RainRockBottomMiddleTile8: INCBIN "gfx/tilesets/rain/rainRockBottomMiddle8.2bpp"


AnimateRainRockBottomRightTile:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

	ld hl, .RainRockBottomRightTileFramesPointers

; A cycle of 8 frames, updating every tick
	ld a, [wTileAnimationTimer]
	and %111

; hl = [.RainRockBottomRightTileFramesPointers + a * 2]
	add a
	add l
	ld l, a
	jr nc, .okay
	inc h
.okay
	ld a, [hli]
	ld h, [hl]
	ld l, a

; Write the tile graphic from hl (now sp) to de (now hl)
	ld sp, hl
	ld l, e
	ld h, d
	jp WriteTile

.RainRockBottomRightTileFramesPointers:
	dw .RainRockBottomRightTile1
	dw .RainRockBottomRightTile2
	dw .RainRockBottomRightTile3
	dw .RainRockBottomRightTile4
	dw .RainRockBottomRightTile5
	dw .RainRockBottomRightTile6
	dw .RainRockBottomRightTile7
	dw .RainRockBottomRightTile8

.RainRockBottomRightTile1: INCBIN "gfx/tilesets/rain/rainRockBottomRight1.2bpp"
.RainRockBottomRightTile2: INCBIN "gfx/tilesets/rain/rainRockBottomRight2.2bpp"
.RainRockBottomRightTile3: INCBIN "gfx/tilesets/rain/rainRockBottomRight3.2bpp"
.RainRockBottomRightTile4: INCBIN "gfx/tilesets/rain/rainRockBottomRight4.2bpp"
.RainRockBottomRightTile5: INCBIN "gfx/tilesets/rain/rainRockBottomRight5.2bpp"
.RainRockBottomRightTile6: INCBIN "gfx/tilesets/rain/rainRockBottomRight6.2bpp"
.RainRockBottomRightTile7: INCBIN "gfx/tilesets/rain/rainRockBottomRight7.2bpp"
.RainRockBottomRightTile8: INCBIN "gfx/tilesets/rain/rainRockBottomRight8.2bpp"


AnimateRainRockMiddleRightTile:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

	ld hl, .RainRockMiddleRightTileFramesPointers

; A cycle of 8 frames, updating every tick
	ld a, [wTileAnimationTimer]
	and %111

; hl = [.RainRockMiddleRightTileFramesPointers + a * 2]
	add a
	add l
	ld l, a
	jr nc, .okay
	inc h
.okay
	ld a, [hli]
	ld h, [hl]
	ld l, a

; Write the tile graphic from hl (now sp) to de (now hl)
	ld sp, hl
	ld l, e
	ld h, d
	jp WriteTile

.RainRockMiddleRightTileFramesPointers:
	dw .RainRockMiddleRightTile1
	dw .RainRockMiddleRightTile2
	dw .RainRockMiddleRightTile3
	dw .RainRockMiddleRightTile4
	dw .RainRockMiddleRightTile5
	dw .RainRockMiddleRightTile6
	dw .RainRockMiddleRightTile7
	dw .RainRockMiddleRightTile8

.RainRockMiddleRightTile1: INCBIN "gfx/tilesets/rain/rainRockMiddleRight1.2bpp"
.RainRockMiddleRightTile2: INCBIN "gfx/tilesets/rain/rainRockMiddleRight2.2bpp"
.RainRockMiddleRightTile3: INCBIN "gfx/tilesets/rain/rainRockMiddleRight3.2bpp"
.RainRockMiddleRightTile4: INCBIN "gfx/tilesets/rain/rainRockMiddleRight4.2bpp"
.RainRockMiddleRightTile5: INCBIN "gfx/tilesets/rain/rainRockMiddleRight5.2bpp"
.RainRockMiddleRightTile6: INCBIN "gfx/tilesets/rain/rainRockMiddleRight6.2bpp"
.RainRockMiddleRightTile7: INCBIN "gfx/tilesets/rain/rainRockMiddleRight7.2bpp"
.RainRockMiddleRightTile8: INCBIN "gfx/tilesets/rain/rainRockMiddleRight8.2bpp"

AnimateRainRockTopRightTile:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

	ld hl, .RainRockTopRightTileFramesPointers

; A cycle of 8 frames, updating every tick
	ld a, [wTileAnimationTimer]
	and %111

; hl = [.RainRockTopRightTileFramesPointers + a * 2]
	add a
	add l
	ld l, a
	jr nc, .okay
	inc h
.okay
	ld a, [hli]
	ld h, [hl]
	ld l, a

; Write the tile graphic from hl (now sp) to de (now hl)
	ld sp, hl
	ld l, e
	ld h, d
	jp WriteTile

.RainRockTopRightTileFramesPointers:
	dw .RainRockTopRightTile1
	dw .RainRockTopRightTile2
	dw .RainRockTopRightTile3
	dw .RainRockTopRightTile4
	dw .RainRockTopRightTile5
	dw .RainRockTopRightTile6
	dw .RainRockTopRightTile7
	dw .RainRockTopRightTile8

.RainRockTopRightTile1: INCBIN "gfx/tilesets/rain/rainRockTopRight1.2bpp"
.RainRockTopRightTile2: INCBIN "gfx/tilesets/rain/rainRockTopRight2.2bpp"
.RainRockTopRightTile3: INCBIN "gfx/tilesets/rain/rainRockTopRight3.2bpp"
.RainRockTopRightTile4: INCBIN "gfx/tilesets/rain/rainRockTopRight4.2bpp"
.RainRockTopRightTile5: INCBIN "gfx/tilesets/rain/rainRockTopRight5.2bpp"
.RainRockTopRightTile6: INCBIN "gfx/tilesets/rain/rainRockTopRight6.2bpp"
.RainRockTopRightTile7: INCBIN "gfx/tilesets/rain/rainRockTopRight7.2bpp"
.RainRockTopRightTile8: INCBIN "gfx/tilesets/rain/rainRockTopRight8.2bpp"

AnimateRainRockTopMiddleTile:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

	ld hl, .RainRockTopMiddleTileFramesPointers

; A cycle of 8 frames, updating every tick
	ld a, [wTileAnimationTimer]
	and %111

; hl = [.RainRockTopMiddleTileFramesPointers + a * 2]
	add a
	add l
	ld l, a
	jr nc, .okay
	inc h
.okay
	ld a, [hli]
	ld h, [hl]
	ld l, a

; Write the tile graphic from hl (now sp) to de (now hl)
	ld sp, hl
	ld l, e
	ld h, d
	jp WriteTile

.RainRockTopMiddleTileFramesPointers:
	dw .RainRockTopMiddleTile1
	dw .RainRockTopMiddleTile2
	dw .RainRockTopMiddleTile3
	dw .RainRockTopMiddleTile4
	dw .RainRockTopMiddleTile5
	dw .RainRockTopMiddleTile6
	dw .RainRockTopMiddleTile7
	dw .RainRockTopMiddleTile8

.RainRockTopMiddleTile1: INCBIN "gfx/tilesets/rain/rainRockTopMiddle1.2bpp"
.RainRockTopMiddleTile2: INCBIN "gfx/tilesets/rain/rainRockTopMiddle2.2bpp"
.RainRockTopMiddleTile3: INCBIN "gfx/tilesets/rain/rainRockTopMiddle3.2bpp"
.RainRockTopMiddleTile4: INCBIN "gfx/tilesets/rain/rainRockTopMiddle4.2bpp"
.RainRockTopMiddleTile5: INCBIN "gfx/tilesets/rain/rainRockTopMiddle5.2bpp"
.RainRockTopMiddleTile6: INCBIN "gfx/tilesets/rain/rainRockTopMiddle6.2bpp"
.RainRockTopMiddleTile7: INCBIN "gfx/tilesets/rain/rainRockTopMiddle7.2bpp"
.RainRockTopMiddleTile8: INCBIN "gfx/tilesets/rain/rainRockTopMiddle8.2bpp"

AnimateRainRockTopLeftTile:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

	ld hl, .RainRockTopLeftTileFramesPointers

; A cycle of 8 frames, updating every tick
	ld a, [wTileAnimationTimer]
	and %111

; hl = [.RainRockTopLeftTileFramesPointers + a * 2]
	add a
	add l
	ld l, a
	jr nc, .okay
	inc h
.okay
	ld a, [hli]
	ld h, [hl]
	ld l, a

; Write the tile graphic from hl (now sp) to de (now hl)
	ld sp, hl
	ld l, e
	ld h, d
	jp WriteTile

.RainRockTopLeftTileFramesPointers:
	dw .RainRockTopLeftTile1
	dw .RainRockTopLeftTile2
	dw .RainRockTopLeftTile3
	dw .RainRockTopLeftTile4
	dw .RainRockTopLeftTile5
	dw .RainRockTopLeftTile6
	dw .RainRockTopLeftTile7
	dw .RainRockTopLeftTile8

.RainRockTopLeftTile1: INCBIN "gfx/tilesets/rain/rainRockTopLeft1.2bpp"
.RainRockTopLeftTile2: INCBIN "gfx/tilesets/rain/rainRockTopLeft2.2bpp"
.RainRockTopLeftTile3: INCBIN "gfx/tilesets/rain/rainRockTopLeft3.2bpp"
.RainRockTopLeftTile4: INCBIN "gfx/tilesets/rain/rainRockTopLeft4.2bpp"
.RainRockTopLeftTile5: INCBIN "gfx/tilesets/rain/rainRockTopLeft5.2bpp"
.RainRockTopLeftTile6: INCBIN "gfx/tilesets/rain/rainRockTopLeft6.2bpp"
.RainRockTopLeftTile7: INCBIN "gfx/tilesets/rain/rainRockTopLeft7.2bpp"
.RainRockTopLeftTile8: INCBIN "gfx/tilesets/rain/rainRockTopLeft8.2bpp"

AnimateRainRockMiddleLeftTile:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

	ld hl, .RainRockMiddleLeftTileFramesPointers

; A cycle of 8 frames, updating every tick
	ld a, [wTileAnimationTimer]
	and %111

; hl = [.RainRockMiddleLeftTileFramesPointers + a * 2]
	add a
	add l
	ld l, a
	jr nc, .okay
	inc h
.okay
	ld a, [hli]
	ld h, [hl]
	ld l, a

; Write the tile graphic from hl (now sp) to de (now hl)
	ld sp, hl
	ld l, e
	ld h, d
	jp WriteTile

.RainRockMiddleLeftTileFramesPointers:
	dw .RainRockMiddleLeftTile1
	dw .RainRockMiddleLeftTile2
	dw .RainRockMiddleLeftTile3
	dw .RainRockMiddleLeftTile4
	dw .RainRockMiddleLeftTile5
	dw .RainRockMiddleLeftTile6
	dw .RainRockMiddleLeftTile7
	dw .RainRockMiddleLeftTile8

.RainRockMiddleLeftTile1: INCBIN "gfx/tilesets/rain/rainRockMiddleLeft1.2bpp"
.RainRockMiddleLeftTile2: INCBIN "gfx/tilesets/rain/rainRockMiddleLeft2.2bpp"
.RainRockMiddleLeftTile3: INCBIN "gfx/tilesets/rain/rainRockMiddleLeft3.2bpp"
.RainRockMiddleLeftTile4: INCBIN "gfx/tilesets/rain/rainRockMiddleLeft4.2bpp"
.RainRockMiddleLeftTile5: INCBIN "gfx/tilesets/rain/rainRockMiddleLeft5.2bpp"
.RainRockMiddleLeftTile6: INCBIN "gfx/tilesets/rain/rainRockMiddleLeft6.2bpp"
.RainRockMiddleLeftTile7: INCBIN "gfx/tilesets/rain/rainRockMiddleLeft7.2bpp"
.RainRockMiddleLeftTile8: INCBIN "gfx/tilesets/rain/rainRockMiddleLeft8.2bpp"

AnimateRainSignBottomRightTile:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

	ld hl, .RainSignBottomRightTileFramesPointers

; A cycle of 8 frames, updating every tick
	ld a, [wTileAnimationTimer]
	and %111

; hl = [.RainSignBottomRightTileFramesPointers + a * 2]
	add a
	add l
	ld l, a
	jr nc, .okay
	inc h
.okay
	ld a, [hli]
	ld h, [hl]
	ld l, a

; Write the tile graphic from hl (now sp) to de (now hl)
	ld sp, hl
	ld l, e
	ld h, d
	jp WriteTile

.RainSignBottomRightTileFramesPointers:
	dw .RainSignBottomRightTile1
	dw .RainSignBottomRightTile2
	dw .RainSignBottomRightTile3
	dw .RainSignBottomRightTile4
	dw .RainSignBottomRightTile5
	dw .RainSignBottomRightTile6
	dw .RainSignBottomRightTile7
	dw .RainSignBottomRightTile8

.RainSignBottomRightTile1: INCBIN "gfx/tilesets/rain/rainSignBottomRight1.2bpp"
.RainSignBottomRightTile2: INCBIN "gfx/tilesets/rain/rainSignBottomRight2.2bpp"
.RainSignBottomRightTile3: INCBIN "gfx/tilesets/rain/rainSignBottomRight3.2bpp"
.RainSignBottomRightTile4: INCBIN "gfx/tilesets/rain/rainSignBottomRight4.2bpp"
.RainSignBottomRightTile5: INCBIN "gfx/tilesets/rain/rainSignBottomRight5.2bpp"
.RainSignBottomRightTile6: INCBIN "gfx/tilesets/rain/rainSignBottomRight6.2bpp"
.RainSignBottomRightTile7: INCBIN "gfx/tilesets/rain/rainSignBottomRight7.2bpp"
.RainSignBottomRightTile8: INCBIN "gfx/tilesets/rain/rainSignBottomRight8.2bpp"


AnimateRainSignBottomLeftTile:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

	ld hl, .RainSignBottomLeftTileFramesPointers

; A cycle of 8 frames, updating every tick
	ld a, [wTileAnimationTimer]
	and %111

; hl = [.RainSignBottomLeftTileFramesPointers + a * 2]
	add a
	add l
	ld l, a
	jr nc, .okay
	inc h
.okay
	ld a, [hli]
	ld h, [hl]
	ld l, a

; Write the tile graphic from hl (now sp) to de (now hl)
	ld sp, hl
	ld l, e
	ld h, d
	jp WriteTile

.RainSignBottomLeftTileFramesPointers:
	dw .RainSignBottomLeftTile1
	dw .RainSignBottomLeftTile2
	dw .RainSignBottomLeftTile3
	dw .RainSignBottomLeftTile4
	dw .RainSignBottomLeftTile5
	dw .RainSignBottomLeftTile6
	dw .RainSignBottomLeftTile7
	dw .RainSignBottomLeftTile8

.RainSignBottomLeftTile1: INCBIN "gfx/tilesets/rain/rainSignBottomLeft1.2bpp"
.RainSignBottomLeftTile2: INCBIN "gfx/tilesets/rain/rainSignBottomLeft2.2bpp"
.RainSignBottomLeftTile3: INCBIN "gfx/tilesets/rain/rainSignBottomLeft3.2bpp"
.RainSignBottomLeftTile4: INCBIN "gfx/tilesets/rain/rainSignBottomLeft4.2bpp"
.RainSignBottomLeftTile5: INCBIN "gfx/tilesets/rain/rainSignBottomLeft5.2bpp"
.RainSignBottomLeftTile6: INCBIN "gfx/tilesets/rain/rainSignBottomLeft6.2bpp"
.RainSignBottomLeftTile7: INCBIN "gfx/tilesets/rain/rainSignBottomLeft7.2bpp"
.RainSignBottomLeftTile8: INCBIN "gfx/tilesets/rain/rainSignBottomLeft8.2bpp"


AnimateRainSignTopLeftTile:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

	ld hl, .RainSignTopLeftTileFramesPointers

; A cycle of 8 frames, updating every tick
	ld a, [wTileAnimationTimer]
	and %111

; hl = [.RainSignTopLeftTileFramesPointers + a * 2]
	add a
	add l
	ld l, a
	jr nc, .okay
	inc h
.okay
	ld a, [hli]
	ld h, [hl]
	ld l, a

; Write the tile graphic from hl (now sp) to de (now hl)
	ld sp, hl
	ld l, e
	ld h, d
	jp WriteTile

.RainSignTopLeftTileFramesPointers:
	dw .RainSignTopLeftTile1
	dw .RainSignTopLeftTile2
	dw .RainSignTopLeftTile3
	dw .RainSignTopLeftTile4
	dw .RainSignTopLeftTile5
	dw .RainSignTopLeftTile6
	dw .RainSignTopLeftTile7
	dw .RainSignTopLeftTile8

.RainSignTopLeftTile1: INCBIN "gfx/tilesets/rain/rainSignTopLeft1.2bpp"
.RainSignTopLeftTile2: INCBIN "gfx/tilesets/rain/rainSignTopLeft2.2bpp"
.RainSignTopLeftTile3: INCBIN "gfx/tilesets/rain/rainSignTopLeft3.2bpp"
.RainSignTopLeftTile4: INCBIN "gfx/tilesets/rain/rainSignTopLeft4.2bpp"
.RainSignTopLeftTile5: INCBIN "gfx/tilesets/rain/rainSignTopLeft5.2bpp"
.RainSignTopLeftTile6: INCBIN "gfx/tilesets/rain/rainSignTopLeft6.2bpp"
.RainSignTopLeftTile7: INCBIN "gfx/tilesets/rain/rainSignTopLeft7.2bpp"
.RainSignTopLeftTile8: INCBIN "gfx/tilesets/rain/rainSignTopLeft8.2bpp"


AnimateRainSignTopRightTile:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

	ld hl, .RainSignTopRightTileFramesPointers

; A cycle of 8 frames, updating every tick
	ld a, [wTileAnimationTimer]
	and %111

; hl = [.RainSignTopRightTileFramesPointers + a * 2]
	add a
	add l
	ld l, a
	jr nc, .okay
	inc h
.okay
	ld a, [hli]
	ld h, [hl]
	ld l, a

; Write the tile graphic from hl (now sp) to de (now hl)
	ld sp, hl
	ld l, e
	ld h, d
	jp WriteTile

.RainSignTopRightTileFramesPointers:
	dw .RainSignTopRightTile1
	dw .RainSignTopRightTile2
	dw .RainSignTopRightTile3
	dw .RainSignTopRightTile4
	dw .RainSignTopRightTile5
	dw .RainSignTopRightTile6
	dw .RainSignTopRightTile7
	dw .RainSignTopRightTile8

.RainSignTopRightTile1: INCBIN "gfx/tilesets/rain/rainSignTopRight1.2bpp"
.RainSignTopRightTile2: INCBIN "gfx/tilesets/rain/rainSignTopRight2.2bpp"
.RainSignTopRightTile3: INCBIN "gfx/tilesets/rain/rainSignTopRight3.2bpp"
.RainSignTopRightTile4: INCBIN "gfx/tilesets/rain/rainSignTopRight4.2bpp"
.RainSignTopRightTile5: INCBIN "gfx/tilesets/rain/rainSignTopRight5.2bpp"
.RainSignTopRightTile6: INCBIN "gfx/tilesets/rain/rainSignTopRight6.2bpp"
.RainSignTopRightTile7: INCBIN "gfx/tilesets/rain/rainSignTopRight7.2bpp"
.RainSignTopRightTile8: INCBIN "gfx/tilesets/rain/rainSignTopRight8.2bpp"


AnimateRainTreeTopRightTile:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

	ld hl, .RainTreeTopRightTileFramesPointers

; A cycle of 8 frames, updating every tick
	ld a, [wTileAnimationTimer]
	and %111

; hl = [.RainTreeTopRightTileFramesPointers + a * 2]
	add a
	add l
	ld l, a
	jr nc, .okay
	inc h
.okay
	ld a, [hli]
	ld h, [hl]
	ld l, a

; Write the tile graphic from hl (now sp) to de (now hl)
	ld sp, hl
	ld l, e
	ld h, d
	jp WriteTile

.RainTreeTopRightTileFramesPointers:
	dw .RainTreeTopRightTile1
	dw .RainTreeTopRightTile2
	dw .RainTreeTopRightTile3
	dw .RainTreeTopRightTile4
	dw .RainTreeTopRightTile5
	dw .RainTreeTopRightTile6
	dw .RainTreeTopRightTile7
	dw .RainTreeTopRightTile8

.RainTreeTopRightTile1: INCBIN "gfx/tilesets/rain/rainTreeTopRight1.2bpp"
.RainTreeTopRightTile2: INCBIN "gfx/tilesets/rain/rainTreeTopRight2.2bpp"
.RainTreeTopRightTile3: INCBIN "gfx/tilesets/rain/rainTreeTopRight3.2bpp"
.RainTreeTopRightTile4: INCBIN "gfx/tilesets/rain/rainTreeTopRight4.2bpp"
.RainTreeTopRightTile5: INCBIN "gfx/tilesets/rain/rainTreeTopRight5.2bpp"
.RainTreeTopRightTile6: INCBIN "gfx/tilesets/rain/rainTreeTopRight6.2bpp"
.RainTreeTopRightTile7: INCBIN "gfx/tilesets/rain/rainTreeTopRight7.2bpp"
.RainTreeTopRightTile8: INCBIN "gfx/tilesets/rain/rainTreeTopRight8.2bpp"


AnimateRainTreeTopLeftTile:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

	ld hl, .RainTreeTopLeftTileFramesPointers

; A cycle of 8 frames, updating every tick
	ld a, [wTileAnimationTimer]
	and %111

; hl = [.RainTreeTopLeftTileFramesPointers + a * 2]
	add a
	add l
	ld l, a
	jr nc, .okay
	inc h
.okay
	ld a, [hli]
	ld h, [hl]
	ld l, a

; Write the tile graphic from hl (now sp) to de (now hl)
	ld sp, hl
	ld l, e
	ld h, d
	jp WriteTile

.RainTreeTopLeftTileFramesPointers:
	dw .RainTreeTopLeftTile1
	dw .RainTreeTopLeftTile2
	dw .RainTreeTopLeftTile3
	dw .RainTreeTopLeftTile4
	dw .RainTreeTopLeftTile5
	dw .RainTreeTopLeftTile6
	dw .RainTreeTopLeftTile7
	dw .RainTreeTopLeftTile8

.RainTreeTopLeftTile1: INCBIN "gfx/tilesets/rain/rainTreeTopLeft1.2bpp"
.RainTreeTopLeftTile2: INCBIN "gfx/tilesets/rain/rainTreeTopLeft2.2bpp"
.RainTreeTopLeftTile3: INCBIN "gfx/tilesets/rain/rainTreeTopLeft3.2bpp"
.RainTreeTopLeftTile4: INCBIN "gfx/tilesets/rain/rainTreeTopLeft4.2bpp"
.RainTreeTopLeftTile5: INCBIN "gfx/tilesets/rain/rainTreeTopLeft5.2bpp"
.RainTreeTopLeftTile6: INCBIN "gfx/tilesets/rain/rainTreeTopLeft6.2bpp"
.RainTreeTopLeftTile7: INCBIN "gfx/tilesets/rain/rainTreeTopLeft7.2bpp"
.RainTreeTopLeftTile8: INCBIN "gfx/tilesets/rain/rainTreeTopLeft8.2bpp"


AnimateRainTreeMiddleLeftTile:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

	ld hl, .RainTreeMiddleLeftTileFramesPointers

; A cycle of 8 frames, updating every tick
	ld a, [wTileAnimationTimer]
	and %111

; hl = [.RainTreeMiddleLeftTileFramesPointers + a * 2]
	add a
	add l
	ld l, a
	jr nc, .okay
	inc h
.okay
	ld a, [hli]
	ld h, [hl]
	ld l, a

; Write the tile graphic from hl (now sp) to de (now hl)
	ld sp, hl
	ld l, e
	ld h, d
	jp WriteTile

.RainTreeMiddleLeftTileFramesPointers:
	dw .RainTreeMiddleLeftTile1
	dw .RainTreeMiddleLeftTile2
	dw .RainTreeMiddleLeftTile3
	dw .RainTreeMiddleLeftTile4
	dw .RainTreeMiddleLeftTile5
	dw .RainTreeMiddleLeftTile6
	dw .RainTreeMiddleLeftTile7
	dw .RainTreeMiddleLeftTile8

.RainTreeMiddleLeftTile1: INCBIN "gfx/tilesets/rain/rainTreeMiddleLeft1.2bpp"
.RainTreeMiddleLeftTile2: INCBIN "gfx/tilesets/rain/rainTreeMiddleLeft2.2bpp"
.RainTreeMiddleLeftTile3: INCBIN "gfx/tilesets/rain/rainTreeMiddleLeft3.2bpp"
.RainTreeMiddleLeftTile4: INCBIN "gfx/tilesets/rain/rainTreeMiddleLeft4.2bpp"
.RainTreeMiddleLeftTile5: INCBIN "gfx/tilesets/rain/rainTreeMiddleLeft5.2bpp"
.RainTreeMiddleLeftTile6: INCBIN "gfx/tilesets/rain/rainTreeMiddleLeft6.2bpp"
.RainTreeMiddleLeftTile7: INCBIN "gfx/tilesets/rain/rainTreeMiddleLeft7.2bpp"
.RainTreeMiddleLeftTile8: INCBIN "gfx/tilesets/rain/rainTreeMiddleLeft8.2bpp"


AnimateRainTreeMiddleRightTile:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

	ld hl, .RainTreeMiddleRightTileFramesPointers

; A cycle of 8 frames, updating every tick
	ld a, [wTileAnimationTimer]
	and %111

; hl = [.RainTreeMiddleRightTileFramesPointers + a * 2]
	add a
	add l
	ld l, a
	jr nc, .okay
	inc h
.okay
	ld a, [hli]
	ld h, [hl]
	ld l, a

; Write the tile graphic from hl (now sp) to de (now hl)
	ld sp, hl
	ld l, e
	ld h, d
	jp WriteTile

.RainTreeMiddleRightTileFramesPointers:
	dw .RainTreeMiddleRightTile1
	dw .RainTreeMiddleRightTile2
	dw .RainTreeMiddleRightTile3
	dw .RainTreeMiddleRightTile4
	dw .RainTreeMiddleRightTile5
	dw .RainTreeMiddleRightTile6
	dw .RainTreeMiddleRightTile7
	dw .RainTreeMiddleRightTile8

.RainTreeMiddleRightTile1: INCBIN "gfx/tilesets/rain/rainTreeMiddleRight1.2bpp"
.RainTreeMiddleRightTile2: INCBIN "gfx/tilesets/rain/rainTreeMiddleRight2.2bpp"
.RainTreeMiddleRightTile3: INCBIN "gfx/tilesets/rain/rainTreeMiddleRight3.2bpp"
.RainTreeMiddleRightTile4: INCBIN "gfx/tilesets/rain/rainTreeMiddleRight4.2bpp"
.RainTreeMiddleRightTile5: INCBIN "gfx/tilesets/rain/rainTreeMiddleRight5.2bpp"
.RainTreeMiddleRightTile6: INCBIN "gfx/tilesets/rain/rainTreeMiddleRight6.2bpp"
.RainTreeMiddleRightTile7: INCBIN "gfx/tilesets/rain/rainTreeMiddleRight7.2bpp"
.RainTreeMiddleRightTile8: INCBIN "gfx/tilesets/rain/rainTreeMiddleRight8.2bpp"


AnimateRainTreeLowestLeftTile:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

	ld hl, .RainTreeLowestLeftTileFramesPointers

; A cycle of 8 frames, updating every tick
	ld a, [wTileAnimationTimer]
	and %111

; hl = [.RainTreeLowestLeftTileFramesPointers + a * 2]
	add a
	add l
	ld l, a
	jr nc, .okay
	inc h
.okay
	ld a, [hli]
	ld h, [hl]
	ld l, a

; Write the tile graphic from hl (now sp) to de (now hl)
	ld sp, hl
	ld l, e
	ld h, d
	jp WriteTile

.RainTreeLowestLeftTileFramesPointers:
	dw .RainTreeLowestLeftTile1
	dw .RainTreeLowestLeftTile2
	dw .RainTreeLowestLeftTile3
	dw .RainTreeLowestLeftTile4
	dw .RainTreeLowestLeftTile5
	dw .RainTreeLowestLeftTile6
	dw .RainTreeLowestLeftTile7
	dw .RainTreeLowestLeftTile8

.RainTreeLowestLeftTile1: INCBIN "gfx/tilesets/rain/rainTreeLowestLeft1.2bpp"
.RainTreeLowestLeftTile2: INCBIN "gfx/tilesets/rain/rainTreeLowestLeft2.2bpp"
.RainTreeLowestLeftTile3: INCBIN "gfx/tilesets/rain/rainTreeLowestLeft3.2bpp"
.RainTreeLowestLeftTile4: INCBIN "gfx/tilesets/rain/rainTreeLowestLeft4.2bpp"
.RainTreeLowestLeftTile5: INCBIN "gfx/tilesets/rain/rainTreeLowestLeft5.2bpp"
.RainTreeLowestLeftTile6: INCBIN "gfx/tilesets/rain/rainTreeLowestLeft6.2bpp"
.RainTreeLowestLeftTile7: INCBIN "gfx/tilesets/rain/rainTreeLowestLeft7.2bpp"
.RainTreeLowestLeftTile8: INCBIN "gfx/tilesets/rain/rainTreeLowestLeft8.2bpp"


AnimateRainTreeLowestRightTile:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

	ld hl, .RainTreeLowestRightTileFramesPointers

; A cycle of 8 frames, updating every tick
	ld a, [wTileAnimationTimer]
	and %111

; hl = [.RainTreeLowestRightTileFramesPointers + a * 2]
	add a
	add l
	ld l, a
	jr nc, .okay
	inc h
.okay
	ld a, [hli]
	ld h, [hl]
	ld l, a

; Write the tile graphic from hl (now sp) to de (now hl)
	ld sp, hl
	ld l, e
	ld h, d
	jp WriteTile

.RainTreeLowestRightTileFramesPointers:
	dw .RainTreeLowestRightTile1
	dw .RainTreeLowestRightTile2
	dw .RainTreeLowestRightTile3
	dw .RainTreeLowestRightTile4
	dw .RainTreeLowestRightTile5
	dw .RainTreeLowestRightTile6
	dw .RainTreeLowestRightTile7
	dw .RainTreeLowestRightTile8

.RainTreeLowestRightTile1: INCBIN "gfx/tilesets/rain/rainTreeLowestRight1.2bpp"
.RainTreeLowestRightTile2: INCBIN "gfx/tilesets/rain/rainTreeLowestRight2.2bpp"
.RainTreeLowestRightTile3: INCBIN "gfx/tilesets/rain/rainTreeLowestRight3.2bpp"
.RainTreeLowestRightTile4: INCBIN "gfx/tilesets/rain/rainTreeLowestRight4.2bpp"
.RainTreeLowestRightTile5: INCBIN "gfx/tilesets/rain/rainTreeLowestRight5.2bpp"
.RainTreeLowestRightTile6: INCBIN "gfx/tilesets/rain/rainTreeLowestRight6.2bpp"
.RainTreeLowestRightTile7: INCBIN "gfx/tilesets/rain/rainTreeLowestRight7.2bpp"
.RainTreeLowestRightTile8: INCBIN "gfx/tilesets/rain/rainTreeLowestRight8.2bpp"


AnimateRainTGrassTile:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

	ld hl, .RainTGrassTileFramesPointers

; A cycle of 8 frames, updating every tick
	ld a, [wTileAnimationTimer]
	and %111

; hl = [.RainTGrassTileFramesPointers + a * 2]
	add a
	add l
	ld l, a
	jr nc, .okay
	inc h
.okay
	ld a, [hli]
	ld h, [hl]
	ld l, a

; Write the tile graphic from hl (now sp) to de (now hl)
	ld sp, hl
	ld l, e
	ld h, d
	jp WriteTile

.RainTGrassTileFramesPointers:
	dw .RainTGrassTile1
	dw .RainTGrassTile2
	dw .RainTGrassTile3
	dw .RainTGrassTile4
	dw .RainTGrassTile5
	dw .RainTGrassTile6
	dw .RainTGrassTile7
	dw .RainTGrassTile8

.RainTGrassTile1: INCBIN "gfx/tilesets/rain/rainTGrass1.2bpp"
.RainTGrassTile2: INCBIN "gfx/tilesets/rain/rainTGrass2.2bpp"
.RainTGrassTile3: INCBIN "gfx/tilesets/rain/rainTGrass3.2bpp"
.RainTGrassTile4: INCBIN "gfx/tilesets/rain/rainTGrass4.2bpp"
.RainTGrassTile5: INCBIN "gfx/tilesets/rain/rainTGrass5.2bpp"
.RainTGrassTile6: INCBIN "gfx/tilesets/rain/rainTGrass6.2bpp"
.RainTGrassTile7: INCBIN "gfx/tilesets/rain/rainTGrass7.2bpp"
.RainTGrassTile8: INCBIN "gfx/tilesets/rain/rainTGrass8.2bpp"


AnimateTreeTopLeftTile:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

; A cycle of 2 frames, updating every other tick
	ld a, [wTileAnimationTimer]
	and %10

; hl = .TreeTopLeftTileFrames + a * 8
	add a
	add a
	add a
	ld e, a
	ld d, 0
	ld hl, .TreeTopLeftTileFrames
	add hl, de

; Write the tile graphic from hl (now sp) to tile $1E (now hl)
	ld sp, hl
	ld hl, vTiles2 tile $1E
	jp WriteTile

.TreeTopLeftTileFrames:
	INCBIN "gfx/tilesets/forest-tree/1.2bpp"
	INCBIN "gfx/tilesets/forest-tree/2.2bpp"
	
AnimateTreeTopRightTile:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

; A cycle of 2 frames, updating every other tick
	ld a, [wTileAnimationTimer]
	and %10

; hl = .TreeTopRightTileFrames + a * 8
	add a
	add a
	add a
	ld e, a
	ld d, 0
	ld hl, .TreeTopRightTileFrames
	add hl, de

; Write the tile graphic from hl (now sp) to tile $1F (now hl)
	ld sp, hl
	ld hl, vTiles2 tile $1F
	jp WriteTile

.TreeTopRightTileFrames:
	INCBIN "gfx/tilesets/forest-tree/3.2bpp"
	INCBIN "gfx/tilesets/forest-tree/4.2bpp"

AnimateFlowerTile:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

; A cycle of 2 frames, updating every other tick
	ld a, [wTileAnimationTimer]
	and %10

; CGB has different tile graphics for flowers
	ld e, a
	ldh a, [hCGB]
	and 1
	add e

; hl = .GrassTileFrames + a * 16
	swap a
	ld e, a
	ld d, 0
	ld hl, .FlowerTileFrames
	add hl, de

; Write the tile graphic from hl (now sp) to tile $03 (now hl)
	ld sp, hl
	ld hl, vTiles2 tile $03
	jp WriteTile

.FlowerTileFrames:
	INCBIN "gfx/tilesets/flower/dmg_1.2bpp"
	INCBIN "gfx/tilesets/flower/cgb_1.2bpp"
	INCBIN "gfx/tilesets/flower/dmg_2.2bpp"
	INCBIN "gfx/tilesets/flower/cgb_2.2bpp"

AnimateLavaBubbleTile1:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

; A cycle of 4 frames, updating every other tick
	ld a, [wTileAnimationTimer]
	and %110

; Offset by 2 frames from AnimateLavaBubbleTile2
	srl a
	inc a
	inc a
	and %011

; hl = LavaBubbleTileFrames + a * 16
	swap a
	ld e, a
	ld d, 0
	ld hl, LavaBubbleTileFrames
	add hl, de

; Write the tile graphic from hl (now sp) to tile $5b (now hl)
	ld sp, hl
	ld hl, vTiles2 tile $5b
	jp WriteTile

AnimateLavaBubbleTile2:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

; A cycle of 4 frames, updating every other tick
	ld a, [wTileAnimationTimer]
	and %110

; hl = LavaBubbleTileFrames + a * 8
; (a was pre-multiplied by 2 from 'and %110')
	add a
	add a
	add a
	ld e, a
	ld d, 0
	ld hl, LavaBubbleTileFrames
	add hl, de

; Write the tile graphic from hl (now sp) to tile $38 (now hl)
	ld sp, hl
	ld hl, vTiles2 tile $38
	jp WriteTile

LavaBubbleTileFrames:
	INCBIN "gfx/tilesets/lava/1.2bpp"
	INCBIN "gfx/tilesets/lava/2.2bpp"
	INCBIN "gfx/tilesets/lava/3.2bpp"
	INCBIN "gfx/tilesets/lava/4.2bpp"

AnimateTowerPillarTile:
; Input de points to the destination in VRAM, then the source tile frames

; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

; A cycle of 8 frames, updating every tick
	ld a, [wTileAnimationTimer]
	and %111

; a = [.TowerPillarTileFrameOffsets + a]
	ld hl, .TowerPillarTileFrameOffsets
	add l
	ld l, a
	ld a, 0
	adc h
	ld h, a
	ld a, [hl]

; de = the destination in VRAM
	ld l, e
	ld h, d
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl

; hl = the source tile frames + offset a
	add [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld a, 0
	adc h
	ld h, a

; Write the tile graphic from hl (now sp) to de (now hl)
	ld sp, hl
	ld l, e
	ld h, d
	jr WriteTile

.TowerPillarTileFrameOffsets:
	db 0 tiles
	db 1 tiles
	db 2 tiles
	db 3 tiles
	db 4 tiles
	db 3 tiles
	db 2 tiles
	db 1 tiles

StandingTileFrame:
; Tick the wTileAnimationTimer.
	ld hl, wTileAnimationTimer
	inc [hl]
	ret

AnimateWhirlpoolTile:
; Input de points to the destination in VRAM, then the source tile frames

; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

; de = the destination in VRAM
	ld l, e
	ld h, d
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl

; A cycle of 4 frames, updating every tick
	ld a, [wTileAnimationTimer]
	and %11

; hl = the source tile frames + a * 16
	swap a
	add [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld a, 0
	adc h
	ld h, a

; Write the tile graphic from hl (now sp) to de (now hl)
	ld sp, hl
	ld l, e
	ld h, d
	jr WriteTile

WriteTileFromAnimBuffer:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

; Write the tile graphic from wTileAnimBuffer (now sp) to de (now hl)
	ld hl, wTileAnimBuffer
	ld sp, hl
	ld h, d
	ld l, e
	jr WriteTile

ReadTileToAnimBuffer:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

; Write the tile graphic from de (now sp) to wTileAnimBuffer (now hl)
	ld h, d
	ld l, e
	ld sp, hl
	ld hl, wTileAnimBuffer
	; fallthrough

WriteTile:
; Write one tile from sp to hl.
; The stack pointer has been saved in bc.

; This function cannot be called, only jumped to,
; because it relocates the stack pointer to quickly
; copy data with a "pop slide".

	pop de
	ld [hl], e
	inc hl
	ld [hl], d
rept (LEN_2BPP_TILE - 2) / 2
	pop de
	inc hl
	ld [hl], e
	inc hl
	ld [hl], d
endr

; Restore the stack pointer from bc
	ld h, b
	ld l, c
	ld sp, hl
	ret

AnimateWaterPalette:
; Transition between color values 0-2 for color 0 in palette 3.

; Don't update the palette on DMG
	ldh a, [hCGB]
	and a
	ret z

; Don't update a non-standard palette order
	ldh a, [rBGP]
	cp %11100100
	ret nz

; Only update on even ticks
	ld a, [wTileAnimationTimer]
	ld l, a
	and 1 ; odd
	ret nz

; Ready for BGPD input
	ld a, (1 << rBGPI_AUTO_INCREMENT) palette PAL_BG_WATER color 0
	ldh [rBGPI], a

	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a

; A cycle of 4 colors (0 1 2 1), updating every other tick
	ld a, l
	and %110
	jr z, .color0
	cp %100
	jr z, .color2

; Copy one color from hl to rBGPI via rBGPD

; color1
	ld hl, wBGPals1 palette PAL_BG_WATER color 1
	ld a, [hli]
	ldh [rBGPD], a
	ld a, [hli]
	ldh [rBGPD], a
	jr .end

.color0
	ld hl, wBGPals1 palette PAL_BG_WATER color 0
	ld a, [hli]
	ldh [rBGPD], a
	ld a, [hli]
	ldh [rBGPD], a
	jr .end

.color2
	ld hl, wBGPals1 palette PAL_BG_WATER color 2
	ld a, [hli]
	ldh [rBGPD], a
	ld a, [hli]
	ldh [rBGPD], a

.end
	pop af
	ldh [rSVBK], a
	ret

FlickeringCaveEntrancePalette:
; Don't update the palette on DMG
	ldh a, [hCGB]
	and a
	ret z

; Don't update a non-standard palette order
	ldh a, [rBGP]
	cp %11100100
	ret nz

; We only want to be here if we're in a dark cave.
	ld a, [wTimeOfDayPalset]
	cp DARKNESS_PALSET
	ret nz

	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a

; Ready for BGPD input
	ld a, (1 << rBGPI_AUTO_INCREMENT) palette PAL_BG_YELLOW color 0
	ldh [rBGPI], a

; A cycle of 2 colors (0 2), updating every other vblank
	ldh a, [hVBlankCounter]
	and %10
	jr nz, .color1

; Copy one color from hl to rBGPI via rBGPD

; color0
	ld hl, wBGPals1 palette PAL_BG_YELLOW color 0
	jr .okay

.color1
	ld hl, wBGPals1 palette PAL_BG_YELLOW color 1

.okay
	ld a, [hli]
	ldh [rBGPD], a
	ld a, [hli]
	ldh [rBGPD], a

	pop af
	ldh [rSVBK], a
	ret

TowerPillarTilePointer1:  dw vTiles2 tile $2d, TowerPillarTile1
TowerPillarTilePointer2:  dw vTiles2 tile $2f, TowerPillarTile2
TowerPillarTilePointer3:  dw vTiles2 tile $3d, TowerPillarTile3
TowerPillarTilePointer4:  dw vTiles2 tile $3f, TowerPillarTile4
TowerPillarTilePointer5:  dw vTiles2 tile $3c, TowerPillarTile5
TowerPillarTilePointer6:  dw vTiles2 tile $2c, TowerPillarTile6
TowerPillarTilePointer7:  dw vTiles2 tile $4d, TowerPillarTile7
TowerPillarTilePointer8:  dw vTiles2 tile $4f, TowerPillarTile8
TowerPillarTilePointer9:  dw vTiles2 tile $5d, TowerPillarTile9
TowerPillarTilePointer10: dw vTiles2 tile $5f, TowerPillarTile10

TowerPillarTile1:  INCBIN "gfx/tilesets/tower-pillar/1.2bpp"
TowerPillarTile2:  INCBIN "gfx/tilesets/tower-pillar/2.2bpp"
TowerPillarTile3:  INCBIN "gfx/tilesets/tower-pillar/3.2bpp"
TowerPillarTile4:  INCBIN "gfx/tilesets/tower-pillar/4.2bpp"
TowerPillarTile5:  INCBIN "gfx/tilesets/tower-pillar/5.2bpp"
TowerPillarTile6:  INCBIN "gfx/tilesets/tower-pillar/6.2bpp"
TowerPillarTile7:  INCBIN "gfx/tilesets/tower-pillar/7.2bpp"
TowerPillarTile8:  INCBIN "gfx/tilesets/tower-pillar/8.2bpp"
TowerPillarTile9:  INCBIN "gfx/tilesets/tower-pillar/9.2bpp"
TowerPillarTile10: INCBIN "gfx/tilesets/tower-pillar/10.2bpp"

WhirlpoolFrames1: dw vTiles2 tile $32, WhirlpoolTiles1
WhirlpoolFrames2: dw vTiles2 tile $33, WhirlpoolTiles2
WhirlpoolFrames3: dw vTiles2 tile $42, WhirlpoolTiles3
WhirlpoolFrames4: dw vTiles2 tile $43, WhirlpoolTiles4

WhirlpoolTiles1: INCBIN "gfx/tilesets/whirlpool/1.2bpp"
WhirlpoolTiles2: INCBIN "gfx/tilesets/whirlpool/2.2bpp"
WhirlpoolTiles3: INCBIN "gfx/tilesets/whirlpool/3.2bpp"
WhirlpoolTiles4: INCBIN "gfx/tilesets/whirlpool/4.2bpp"
