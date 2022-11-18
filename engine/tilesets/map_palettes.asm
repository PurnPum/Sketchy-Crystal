_SwapTextboxPalettes:: ; 4c000
    hlcoord 0, 0
    decoord 0, 0, wAttrmap
    ld b, SCREEN_HEIGHT
.loop
    push bc
    ld c, SCREEN_WIDTH
    call GetBGMapTilePalettes
    pop bc
    dec b
    jr nz, .loop
    ret

_ScrollBGMapPalettes:: ; 4c03f
    ld hl, wBGMapBuffer
    ld de, wBGMapPalBuffer
    ; don't call GetBGMapTilePalettes and ret, just fallthrough

GetBGMapTilePalettes:
.loop
    ld a, [hl]
    push hl
    ld hl, wTilesetPalettes
    add [hl]
    ld l, a
    ld a, [wTilesetPalettes + 1]
    adc $0
    ld h, a
    ld a, [hl]
    pop hl
    ld [de], a
    res 7, [hl]
    inc hl
    inc de
    dec c
    jr nz, .loop
    ret
