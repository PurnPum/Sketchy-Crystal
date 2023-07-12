PlaceMoveCategory:	; Input -> b : Move type
	push bc
	call GetBasePower
	ld a, b
	and a
	pop bc
	ld de, StatusIcon
	ld hl, StatusIconPal
	jr z, LoadCategory
	ld a, b
	cp SPECIAL
	ld de, SpecialIcon
	ld hl, SpecialIconPal
	jr nc, LoadCategory
.physical_move
	ld de, PhysicalIcon
	ld hl, PhysicalIconPal
	; Fallthrough
LoadCategory:	; Input -> DE : Icon address, HL : Palette address
	push hl
	ld a, $C7
	call GetCategoryIcon
	
	pop hl
	ld de, wBGPals1 palette 5
	ld bc, 1 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	farcall ApplyPals
	call LoadCategoryIconPals
	
	ld a, $C7
	call PlaceCategoryIcon
	call WaitBGMap
	ret

LoadCategoryIconPals:
	hlbgcoord 17, 1
	xor a
	ldh [hBGMapMode], a
	ldh a, [rVBK]
	push af
	ld a, $1
	ldh [rVBK], a		; Swap VRAM bank to edit the palette
.loop1					; This loop makes sure the palette is properly updated
	call LoadAndCheckCategoryPal
	jr nz, .loop1
	inc hl
.loop2
	call LoadAndCheckCategoryPal
	jr nz, .loop2
	dec hl
	ld bc, $20
	add hl, bc
.loop3
	call LoadAndCheckCategoryPal
	jr nz, .loop3
	inc hl
.loop4
	call LoadAndCheckCategoryPal
	jr nz, .loop4
	pop af
	ldh [rVBK], a
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ldh [hBGMapMode], a
	ret
	
LoadAndCheckCategoryPal:
	ld a, 5
	ld [hl], a
	ld a, [hl]
	cp 5
	ret
	
PlaceCategoryIcon: ; Input -> A : Tile
	hlcoord 17, 1
	ld [hl], a
	inc a
	hlcoord 18, 1
	ld [hl], a
	inc a
	hlcoord 17, 2
	ld [hl], a
	inc a
	hlcoord 18, 2
	ld [hl], a
	inc a
	ret

GetCategoryIcon: ; Input -> DE : Icon Pointer , A : Tile
; Load icon graphics into VRAM starting from tile a (supposedly will always be $C7).
	push de
	ld l, a
	ld h, 0

rept 4
	add hl, hl
endr

	ld de, vTiles0
	add hl, de
	
	pop de
	push hl
	lb bc, BANK(CategoryIcons), 4
	call Request2bpp

	pop hl
	ret
	
CategoryIcons:

PhysicalIcon:		INCBIN "gfx/categories/physical.2bpp"
SpecialIcon:		INCBIN "gfx/categories/special.2bpp"
StatusIcon:			INCBIN "gfx/categories/status.2bpp"

CategoryIconsPals:

PhysicalIconPal:	INCLUDE "gfx/categories/physical.pal"
SpecialIconPal:		INCLUDE "gfx/categories/special.pal"
StatusIconPal:		INCLUDE "gfx/categories/status.pal"
