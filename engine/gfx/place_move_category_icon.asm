PlaceMoveCategory:	; Input -> b : Move type
	push bc
	ld a, [wCurPlayerMove]
	ld b, a
	farcall GetMoveBasePower
	ld a, c
	and a
	pop bc
	ld de, StatusIcon
	ld hl, StatusIconPal
	jr z, LoadCategoryStatus
	ld a, b
	cp SPECIAL
	ld de, SpecialIcon
	ld hl, SpecialIconPal
	jr nc, LoadCategorySpecial
.physical_move
	ld de, PhysicalIcon
	ld hl, PhysicalIconPal
	;Fallthrough

; These functions prevent the loading of the Category Icon and Palettes if they are already loaded.
; Instead they jump directly to the part of the main function that places the icon on the screen, saving time.
; It uses the bits 1 through 3 to store which icon is loaded.

LoadCategoryPhysical:	
	ld bc, wMoveInfoState
	ld a, [bc]
	bit 1, a
	jr nz, LoadCategory.optimization_point
	set 1, a
	res 2, a
	res 3, a
	ld [bc], a
	jr LoadCategory
	
LoadCategorySpecial:
	ld bc, wMoveInfoState
	ld a, [bc]
	bit 2, a
	jr nz, LoadCategory.optimization_point
	res 1, a
	set 2, a
	res 3, a
	ld [bc], a
	jr LoadCategory
	
LoadCategoryStatus:
	ld bc, wMoveInfoState
	ld a, [bc]
	bit 3, a
	jr nz, LoadCategory.optimization_point
	res 1, a
	res 2, a
	set 3, a
	ld [bc], a
	;Fallthrough
LoadCategory:	; Input -> DE : Icon address, HL : Palette address
	push hl
	ld a, $C7
	call GetCategoryIcon
	pop hl
	
.optimization_point
	ld de, wBGPals1 palette 5
	ld bc, 1 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	farcall ApplyPals
	ld d, 5
	call LoadCategoryIconPals
	
	ld a, $C7
	call PlaceCategoryIcon
	call WaitBGMap
	ret

LoadCategoryMoveIconPals:	; Input -> d : Palette number
	hlbgcoord 17, 3
	jr LoadCategoryIconPals.got_coord
	
LoadCategoryIconPals:	; Input -> d : Palette number
	hlbgcoord 17, 1
.got_coord
	xor a
	ldh [hBGMapMode], a
	ldh a, [rVBK]
	push af
	ld a, $1
	ldh [rVBK], a		; Swap VRAM bank to edit the palette
.loop1					; This loop makes sure the palette is properly updated
	ld a, d
	call LoadAndCheckCategoryPal
	jr nz, .loop1
	inc hl
.loop2
	ld a, d
	call LoadAndCheckCategoryPal
	jr nz, .loop2
	dec hl
	ld bc, $20
	add hl, bc
.loop3
	ld a, d
	call LoadAndCheckCategoryPal
	jr nz, .loop3
	inc hl
.loop4
	ld a, d
	call LoadAndCheckCategoryPal
	jr nz, .loop4
	pop af
	ldh [rVBK], a
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ldh [hBGMapMode], a
	ret
	
LoadAndCheckCategoryPal: ; Input: -> a : palette number
	ld e, a
	ld [hl], a
	ld a, [hl]
	cp e
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
