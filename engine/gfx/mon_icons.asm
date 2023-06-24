LoadOverworldMonIcon:
	ld a, e
	call ReadMonMenuIcon
	ld l, a
	ld h, 0
	add hl, hl
	ld de, IconPointers
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld b, BANK(Icons)
	ld c, 8
	ret

LoadMenuMonIcon:
	push hl
	push de
	push bc
	call .LoadIcon
	pop bc
	pop de
	pop hl
	ret

.LoadIcon:
	ld d, 0
	ld hl, .Jumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable:
; entries correspond to MONICON_* constants
	dw PartyMenu_InitAnimatedMonIcon    ; MONICON_PARTYMENU
	dw NamingScreen_InitAnimatedMonIcon ; MONICON_NAMINGSCREEN
	dw MoveList_InitAnimatedMonIcon     ; MONICON_MOVES
	dw Trade_LoadMonIconGFX             ; MONICON_TRADE
	dw Mobile_InitAnimatedMonIcon       ; MONICON_MOBILE1
	dw Mobile_InitPartyMenuBGPal71      ; MONICON_MOBILE2
	dw Unused_GetPartyMenuMonIcon       ; MONICON_UNUSED

Unused_GetPartyMenuMonIcon:
	call InitPartyMenuIcon
	call .GetPartyMonItemGFX
	call SetPartyMonIconAnimSpeed
	ret

.GetPartyMonItemGFX:
	push bc
	ldh a, [hObjectStructIndex]
	ld hl, wPartyMon1Item
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	pop bc
	ld a, [hl]
	and a
	jr z, .no_item
	push hl
	push bc
	ld d, a
	callfar ItemIsMail
	pop bc
	pop hl
	jr c, .not_mail
	ld a, $06
	jr .got_tile
.not_mail
	ld a, $05
	; fallthrough

.no_item
	ld a, $04
.got_tile
	ld hl, SPRITEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	ld [hl], a
	ret

Mobile_InitAnimatedMonIcon:
	call PartyMenu_InitAnimatedMonIcon
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld a, SPRITE_ANIM_SEQ_NULL
	ld [hl], a
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, 9 * 8
	ld [hl], a
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, 9 * 8
	ld [hl], a
	ret

Mobile_InitPartyMenuBGPal71:
	call InitPartyMenuIcon
	call SetPartyMonIconAnimSpeed
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld a, SPRITE_ANIM_SEQ_NULL
	ld [hl], a
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, 3 * 8
	ld [hl], a
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, 12 * 8
	ld [hl], a
	ld a, c
	ld [wc608], a
	ld a, b
	ld [wc608 + 1], a
	ret

PartyMenu_InitAnimatedMonIcon:
	call InitPartyMenuIcon
	call .SpawnItemIcon
	call SetPartyMonIconAnimSpeed
	ret

.SpawnItemIcon:
	push bc
	ldh a, [hObjectStructIndex]
	ld hl, wPartyMon1Item
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	pop bc
	ld a, [hl]
	and a
	ret z
	push hl
	push bc
	ld d, a
	callfar ItemIsMail
	pop bc
	pop hl
	jr c, .mail
	ld a, SPRITE_ANIM_FRAMESET_PARTY_MON_WITH_ITEM
	jr .okay

.mail
	ld a, SPRITE_ANIM_FRAMESET_PARTY_MON_WITH_MAIL
.okay
	ld hl, SPRITEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	ld [hl], a
	ret

InitPartyMenuIcon:
	ld a, [wCurIconTile]
	push af
	ldh a, [hObjectStructIndex]
	ld hl, wPartySpecies
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	call ReadMonMenuIcon
	ld [wCurIcon], a
	call GetMemIconGFX
	ldh a, [hObjectStructIndex]
; y coord
	add a
	add a
	add a
	add a
	add $1c
	ld d, a
; x coord
	ld e, $10
; type is partymon icon
	ld a, SPRITE_ANIM_INDEX_PARTY_MON
	call _InitSpriteAnimStruct
	pop af
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], a
	ret

SetPartyMonIconAnimSpeed:
	push bc
	ldh a, [hObjectStructIndex]
	ld b, a
	call .getspeed
	ld a, b
	pop bc
	ld hl, SPRITEANIMSTRUCT_DURATIONOFFSET
	add hl, bc
	ld [hl], a
	rlca
	rlca
	ld hl, SPRITEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], a
	ret

.getspeed
	farcall PlacePartymonHPBar
	call GetHPPal
	ld e, d
	ld d, 0
	ld hl, .speeds
	add hl, de
	ld b, [hl]
	ret

.speeds
	db $00 ; HP_GREEN
	db $40 ; HP_YELLOW
	db $80 ; HP_RED

NamingScreen_InitAnimatedMonIcon:
	ld a, [wTempIconSpecies]
	call ReadMonMenuIcon
	ld [wCurIcon], a
	xor a
	call GetIconGFX
	depixel 4, 4, 4, 0
	ld a, SPRITE_ANIM_INDEX_PARTY_MON
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld [hl], SPRITE_ANIM_SEQ_NULL
	ret

MoveList_InitAnimatedMonIcon:
	ld a, [wTempIconSpecies]
	call ReadMonMenuIcon
	ld [wCurIcon], a
	xor a
	call GetIconGFX
	ld d, 3 * 8 + 2 ; depixel 3, 4, 2, 4
	ld e, 4 * 8 + 4
	ld a, SPRITE_ANIM_INDEX_PARTY_MON
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld [hl], SPRITE_ANIM_SEQ_NULL
	ret

Trade_LoadMonIconGFX:
	ld a, [wTempIconSpecies]
	call ReadMonMenuIcon
	ld [wCurIcon], a
	ld a, $62
	ld [wCurIconTile], a
	call GetMemIconGFX
	ret

GetSpeciesIcon:
; Load species icon into VRAM at tile a
	push de
	ld a, [wTempIconSpecies]
	call ReadMonMenuIcon
	ld [wCurIcon], a
	pop de
	ld a, e
	call GetIconGFX
	ret

GetBalloonsIcon:
	ld a , ICON_BALLOONS
	ld [wCurIcon], a
	ld a, $08 ; starting tile in VRAM
	call GetIconGFX
	ret
	
LoadTypeIcon:			; input: b -> Position Index, c -> Type, de -> wBGPals1 palette x
	push bc
	push de
	ld a, c
	ld [wCurIcon], a
	ld hl, TypeIconMatches
	ld de, 5
	call IsInArray
	jr nc, .no_type		; This should never happen
	pop de				; Restore de (wBGPals1 palette x) where X is the palette number
	pop bc				; Restore the Position Index
	push bc				
	push de
	inc hl
	inc hl
	inc hl
	push hl				; Here HL Points to the Pal address in TypeIconMatches
	call SearchPosition
	jr nc, .bad_index	; This should never happen
	inc hl
	ld b, h
	ld c, l				; Now bc points to the coords in TypeIconPositions
	pop hl				; Restore the Pal Address
	pop de				; Restore the wBGPals1
	call LoadTypeIconPals
	pop bc				; Restore the Position Index
	call SearchPosition
	ret nc				; This should never happen
	inc hl
	ld b, [hl]			; X coord
	inc hl
	ld c, [hl]			; Y coord
	inc hl				; Now HL points to the Tile ID in TypeIconPositions
	push bc
	ld b, [hl]
	ld a, b
	push bc
	call GetTypeIcon_a
	pop bc
	ld de, wStringBuffer5
	ld a, b
	ld [de], a
	inc a
	inc de
	ld [de], a
	inc a
	inc de
	pop bc
	push af
	ld a, TX_END
	ld [de], a
	ld de, wStringBuffer5
	push de
	farcall CoordsBCtoHL
	push bc
	call PlaceString
	pop bc
	pop de
	pop af
	ld [de], a
	inc a
	inc de
	ld [de], a
	ld a, TX_END
	inc de
	ld [de], a
	ld de, wStringBuffer5
	inc c
	farcall CoordsBCtoHL
	call PlaceString
	call WaitBGMap
	ret

.no_type:
	pop de
	pop bc
	ret
	
.bad_index:
	pop hl
	pop de
	pop bc
	ret
	
SearchPosition:
	ld hl, TypeIconPositions
	ld de, 4
	ld a, b		; b has the position index (0x80, 0x82, 0x83 or 0x84)
	call IsInArray
	ret
	
LoadTypeIconPals: ; input: hl -> Palette address, de -> wBGPals1 palette x, bc -> coords
	push bc
	push de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, 1 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	farcall ApplyPals
	
	pop de
	ld a, e
	ld c, 8
	call SimpleDivide 	; Do E divided by 8 to calculate the palette number
	ld d, b				; Store the result in D for later
	pop bc
	ld h, b
	ld l, c
	ld b, [hl]	; Coord X
	inc hl
	ld c, [hl]	; Coord Y
	call BGCoordsBCtoHL
	xor a
	ldh [hBGMapMode], a
	ldh a, [rVBK]
	push af
	ld a, $1
	ldh [rVBK], a		; Swap VRAM bank to edit the palettes
.loop1					; These loops are here to make sure the palette is properly updated
	call LoadAndCheck
	jr nz, .loop1
	inc hl
.loop2
	call LoadAndCheck
	jr nz, .loop2
	dec hl
	ld bc, $20
	add hl, bc
.loop3
	call LoadAndCheck
	jr nz, .loop3
	inc hl
.loop4
	call LoadAndCheck
	jr nz, .loop4
	pop af
	ldh [rVBK], a
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ldh [hBGMapMode], a
	ret

LoadAndCheck:
	ld a, d
	ld [hl], a
	ld a, [hl]
	cp d
	ret

BGCoordsBCtoHL:
	ld hl, vBGMap0
	ld a, c
	push bc
	ld c, BG_MAP_WIDTH
	call HLMultiply
	pop bc
	ld a, b
	add l
	ld l, a
	ret nc
	inc h
	ret
	
FlyFunction_GetBalloonsOWIcon:
	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	jr z, .male
	ld a, ICON_BALLOONSOWKRIS
	jr .done
.male
	ld a, ICON_BALLOONSOWCHRIS
.done
	ld [wCurIcon], a
	ld a, e
	call GetIcon_a
	ret

FlyFunction_GetMonIcon:
	push de
	ld a, [wTempIconSpecies]
	call ReadMonMenuIcon
	ld [wCurIcon], a
	pop de
	ld a, e
	call GetIcon_a
	ret

;GetMonIconDE: ; unreferenced
;	push de
;	ld a, [wTempIconSpecies]
;	call ReadMonMenuIcon
;	ld [wCurIcon], a
;	pop de
;	call GetIcon_de
;	ret

GetMemIconGFX:
	ld a, [wCurIconTile]
GetIconGFX:
	call GetIcon_a
	ld de, 8 tiles
	add hl, de
	ld de, HeldItemIcons
	lb bc, BANK(HeldItemIcons), 2
	call GetGFXUnlessMobile
	ld a, [wCurIconTile]
	add 10
	ld [wCurIconTile], a
	ret

HeldItemIcons:
INCBIN "gfx/stats/mail.2bpp"
INCBIN "gfx/stats/item.2bpp"

GetIcon_de:
; Load icon graphics into VRAM starting from tile de.
	ld l, e
	ld h, d
	jr GetIcon

GetIcon_a:
; Load icon graphics into VRAM starting from tile a.
	ld l, a
	ld h, 0

GetIcon:
; Load icon graphics into VRAM starting from tile hl.

; One tile is 16 bytes long.
rept 4
	add hl, hl
endr

	ld de, vTiles0
	add hl, de
	push hl

; The icons are contiguous, in order and of the same
; size, so the pointer table is somewhat redundant.
	ld a, [wCurIcon]
	push hl
	ld l, a
	ld h, 0
	add hl, hl
	ld de, IconPointers
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop hl

	lb bc, BANK(Icons), 8
	call GetGFXUnlessMobile

	pop hl
	ret
	
GetTypeIcon_de:
; Load icon graphics into VRAM starting from tile de.
	ld l, e
	ld h, d
	jr GetTypeIcon

GetTypeIcon_a:
; Load icon graphics into VRAM starting from tile a.
	ld l, a
	ld h, 0

GetTypeIcon:
; Load icon graphics into VRAM starting from tile hl.

; One tile is 16 bytes long.
rept 4
	add hl, hl
endr

	ld de, vTiles0
	add hl, de
	push hl

; The icons are contiguous, in order and of the same
; size, so the pointer table is somewhat redundant.
	ld a, [wCurIcon]
	push hl
	ld l, a
	ld h, 0
	add hl, hl
	ld de, TypeIconPointers
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop hl

	lb bc, BANK(TypeIcons), 4
	call GetGFXUnlessMobile

	pop hl
	ret

GetGFXUnlessMobile:
	ld a, [wLinkMode]
	cp LINK_MOBILE
	jp nz, Request2bpp
	jp Get2bppViaHDMA

FreezeMonIcons:
	ld hl, wSpriteAnimationStructs
	ld e, PARTY_LENGTH
	ld a, [wMenuCursorY]
	ld d, a
.loop
	ld a, [hl]
	and a
	jr z, .next
	cp d
	jr z, .loadwithtwo
	ld a, SPRITE_ANIM_SEQ_NULL
	jr .ok

.loadwithtwo
	ld a, SPRITE_ANIM_SEQ_PARTY_MON_SWITCH

.ok
	push hl
	ld c, l
	ld b, h
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld [hl], a
	pop hl

.next
	ld bc, $10
	add hl, bc
	dec e
	jr nz, .loop
	ret

UnfreezeMonIcons:
	ld hl, wSpriteAnimationStructs
	ld e, PARTY_LENGTH
.loop
	ld a, [hl]
	and a
	jr z, .next
	push hl
	ld c, l
	ld b, h
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld [hl], SPRITE_ANIM_SEQ_PARTY_MON
	pop hl
.next
	ld bc, $10
	add hl, bc
	dec e
	jr nz, .loop
	ret

HoldSwitchmonIcon:
	ld hl, wSpriteAnimationStructs
	ld e, PARTY_LENGTH
	ld a, [wSwitchMon]
	ld d, a
.loop
	ld a, [hl]
	and a
	jr z, .next
	cp d
	jr z, .is_switchmon
	ld a, SPRITE_ANIM_SEQ_PARTY_MON_SELECTED
	jr .join_back

.is_switchmon
	ld a, SPRITE_ANIM_SEQ_PARTY_MON_SWITCH
.join_back
	push hl
	ld c, l
	ld b, h
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld [hl], a
	pop hl
.next
	ld bc, $10
	add hl, bc
	dec e
	jr nz, .loop
	ret

ReadMonMenuIcon:
	cp EGG
	jr z, .egg
	dec a
	ld hl, MonMenuIcons
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	ret
.egg
	ld a, ICON_EGG
	ret

INCLUDE "data/pokemon/menu_icons.asm"

INCLUDE "data/icon_pointers.asm"

INCLUDE "gfx/icons.asm"

INCLUDE "data/type_icon_matches.asm"
