; GetOptionPointer.Pointers indexes
	const_def
	const OPT_TEXT_SPEED   ; 0
	const OPT_BATTLE_SCENE ; 1
	const OPT_BATTLE_STYLE ; 2
	const OPT_SOUND        ; 3
	const OPT_DIALOGUE     ; 4
	const OPT_MENU_ACCOUNT ; 5
	const OPT_FRAME        ; 6
	const OPT_CANCEL       ; 7
DEF NUM_OPTIONS EQU const_value ; 8

_Option:
; BUG: Options menu fails to clear joypad state on initialization (see docs/bugs_and_glitches.md)
	ld hl, hInMenu
	ld a, [hl]
	push af
	ld [hl], TRUE
	call ClearBGPalettes
	hlcoord 0, 0
	ld b, SCREEN_HEIGHT - 2
	ld c, SCREEN_WIDTH - 2
	call Textbox
	hlcoord 2, 2
	ld de, StringOptions
	call PlaceString
	xor a
	ld [wJumptableIndex], a

; display the settings of each option when the menu is opened
	ld c, NUM_OPTIONS - 2 ; omit frame type, the last option
.print_text_loop
	push bc
	xor a
	ldh [hJoyLast], a
	call GetOptionPointer
	pop bc
	ld hl, wJumptableIndex
	inc [hl]
	dec c
	jr nz, .print_text_loop
	call UpdateFrame ; display the frame type

	xor a
	ld [wJumptableIndex], a
	inc a
	ldh [hBGMapMode], a
	call WaitBGMap
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	call SetPalettes

.joypad_loop
	call JoyTextDelay
	ldh a, [hJoyPressed]
	and START | B_BUTTON
	jr nz, .ExitOptions
	call OptionsControl
	jr c, .dpad
	call GetOptionPointer
	jr c, .ExitOptions

.dpad
	call Options_UpdateCursorPosition
	ld c, 3
	call DelayFrames
	jr .joypad_loop

.ExitOptions:
	ld de, SFX_TRANSACTION
	call PlaySFX
	call WaitSFX
	pop af
	ldh [hInMenu], a
	ret

StringOptions:
	db "TEXT SPEED<LF>"
	db "        :<LF>"
	db "BATTLE SCENE<LF>"
	db "        :<LF>"
	db "BATTLE STYLE<LF>"
	db "        :<LF>"
	db "SOUND<LF>"
	db "        :<LF>"
	db "DIALOGUE<LF>"
	db "        :<LF>"
	db "MENU ACCOUNT<LF>"
	db "        :<LF>"
	db "FRAME<LF>"
	db "        :TYPE<LF>"
	db "CANCEL@"

GetOptionPointer:
	jumptable .Pointers, wJumptableIndex

.Pointers:
; entries correspond to OPT_* constants
	dw Options_TextSpeed
	dw Options_BattleScene
	dw Options_BattleStyle
	dw Options_Sound
	dw Options_Dialogue
	dw Options_MenuAccount
	dw Options_Frame
	dw Options_Cancel

	const_def
	const OPT_TEXT_SPEED_INST ; 0
	const OPT_TEXT_SPEED_FAST ; 1
	const OPT_TEXT_SPEED_MED  ; 2

Options_TextSpeed:
	call GetTextSpeed
	ldh a, [hJoyPressed]
	bit D_LEFT_F, a
	jr nz, .LeftPressed
	bit D_RIGHT_F, a
	jr z, .NonePressed
	ld a, c ; right pressed
	cp OPT_TEXT_SPEED_MED
	jr c, .Increase
	ld c, OPT_TEXT_SPEED_INST - 1

.Increase:
	inc c
	ld a, e
	jr .Save

.LeftPressed:
	ld a, c
	and a
	jr nz, .Decrease
	ld c, OPT_TEXT_SPEED_MED + 1

.Decrease:
	dec c
	ld a, d

.Save:
	ld b, a
	ld a, [wOptions]
	and $f0
	or b
	ld [wOptions], a

.NonePressed:
	ld b, 0
	ld hl, .Strings
	add hl, bc
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	hlcoord 11, 3
	call PlaceString
	and a
	ret

.Strings:
; entries correspond to OPT_TEXT_SPEED_* constants
	dw .Inst
	dw .Fast
	dw .Mid

.Inst:  db "INST@"
.Fast:  db "FAST@"
.Mid:   db "MID @"

GetTextSpeed:
; converts TEXT_DELAY_* value in a to OPT_TEXT_SPEED_* value in c,
; with previous/next TEXT_DELAY_* values in d/e
	ld a, [wOptions]
	and TEXT_DELAY_MASK
	cp TEXT_DELAY_MED
	jr z, .med
	cp TEXT_DELAY_INST
	jr z, .inst
	; none of the above
	ld c, OPT_TEXT_SPEED_FAST
	lb de, TEXT_DELAY_INST, TEXT_DELAY_MED
	ret

.med
	ld c, OPT_TEXT_SPEED_MED
	lb de, TEXT_DELAY_FAST, TEXT_DELAY_INST
	ret

.inst
	ld c, OPT_TEXT_SPEED_INST
	lb de, TEXT_DELAY_MED, TEXT_DELAY_FAST
	ret

Options_BattleScene:
	ld hl, wOptions
	ldh a, [hJoyPressed]
	bit D_LEFT_F, a
	jr nz, .LeftPressed
	bit D_RIGHT_F, a
	jr z, .NonePressed
	bit BATTLE_SCENE, [hl]
	jr nz, .ToggleOn
	jr .ToggleOff

.LeftPressed:
	bit BATTLE_SCENE, [hl]
	jr z, .ToggleOff
	jr .ToggleOn

.NonePressed:
	bit BATTLE_SCENE, [hl]
	jr z, .ToggleOn
	jr .ToggleOff

.ToggleOn:
	res BATTLE_SCENE, [hl]
	ld de, .On
	jr .Display

.ToggleOff:
	set BATTLE_SCENE, [hl]
	ld de, .Off

.Display:
	hlcoord 11, 5
	call PlaceString
	and a
	ret

.On:  db "ON @"
.Off: db "OFF@"

Options_BattleStyle:
	ld hl, wOptions
	ldh a, [hJoyPressed]
	bit D_LEFT_F, a
	jr nz, .LeftPressed
	bit D_RIGHT_F, a
	jr z, .NonePressed
	bit BATTLE_SHIFT, [hl]
	jr nz, .ToggleShift
	jr .ToggleSet

.LeftPressed:
	bit BATTLE_SHIFT, [hl]
	jr z, .ToggleSet
	jr .ToggleShift

.NonePressed:
	bit BATTLE_SHIFT, [hl]
	jr nz, .ToggleSet

.ToggleShift:
	res BATTLE_SHIFT, [hl]
	ld de, .Shift
	jr .Display

.ToggleSet:
	set BATTLE_SHIFT, [hl]
	ld de, .Set

.Display:
	hlcoord 11, 7
	call PlaceString
	and a
	ret

.Shift: db "SHIFT@"
.Set:   db "SET  @"

Options_Sound:
	ld hl, wOptions
	ldh a, [hJoyPressed]
	bit D_LEFT_F, a
	jr nz, .LeftPressed
	bit D_RIGHT_F, a
	jr z, .NonePressed
	bit STEREO, [hl]
	jr nz, .SetMono
	jr .SetStereo

.LeftPressed:
	bit STEREO, [hl]
	jr z, .SetStereo
	jr .SetMono

.NonePressed:
	bit STEREO, [hl]
	jr nz, .ToggleStereo
	jr .ToggleMono

.SetMono:
	res STEREO, [hl]
	call RestartMapMusic

.ToggleMono:
	ld de, .Mono
	jr .Display

.SetStereo:
	set STEREO, [hl]
	call RestartMapMusic

.ToggleStereo:
	ld de, .Stereo

.Display:
	hlcoord 11, 9
	call PlaceString
	and a
	ret

.Mono:   db "MONO  @"
.Stereo: db "STEREO@"

	const_def
	const OPT_DIALOGUE_NORMAL ; 0
	const OPT_DIALOGUE_MINIMUM  ; 1

Options_Dialogue:
	ld hl, wOptions2
	ldh a, [hJoyPressed]
	bit D_LEFT_F, a
	jr nz, .LeftPressed
	bit D_RIGHT_F, a
	jr z, .NonePressed
	bit MENU_DIALOGUE_NORMAL, [hl]
	jr nz, .ToggleMinimum
	jr .ToggleNormal

.LeftPressed:
	bit MENU_DIALOGUE_NORMAL, [hl]
	jr z, .ToggleNormal
	jr .ToggleMinimum

.NonePressed:
	bit MENU_DIALOGUE_NORMAL, [hl]
	jr nz, .ToggleNormal

.ToggleMinimum:
	res MENU_DIALOGUE_NORMAL, [hl]
	ld de, .Minimum
	jr .Display

.ToggleNormal:
	set MENU_DIALOGUE_NORMAL, [hl]
	ld de, .Normal

.Display:
	hlcoord 11, 11
	call PlaceString
	and a
	ret

.Strings:
; entries correspond to OPT_DIALOGUE_* constants
	dw .Normal
	dw .Minimum

.Normal:   db "NORMAL  @"
.Minimum:  db "MINIMUM @"

Options_MenuAccount:
	ld hl, wOptions2
	ldh a, [hJoyPressed]
	bit D_LEFT_F, a
	jr nz, .LeftPressed
	bit D_RIGHT_F, a
	jr z, .NonePressed
	bit MENU_ACCOUNT_ON, [hl]
	jr nz, .ToggleOff
	jr .ToggleOn

.LeftPressed:
	bit MENU_ACCOUNT_ON, [hl]
	jr z, .ToggleOn
	jr .ToggleOff

.NonePressed:
	bit MENU_ACCOUNT_ON, [hl]
	jr nz, .ToggleOn

.ToggleOff:
	res MENU_ACCOUNT_ON, [hl]
	ld de, .Off
	jr .Display

.ToggleOn:
	set MENU_ACCOUNT_ON, [hl]
	ld de, .On

.Display:
	hlcoord 11, 13
	call PlaceString
	and a
	ret

.Off: db "OFF@"
.On:  db "ON @"

Options_Frame:
	ld hl, wTextboxFrame
	ldh a, [hJoyPressed]
	bit D_LEFT_F, a
	jr nz, .LeftPressed
	bit D_RIGHT_F, a
	jr nz, .RightPressed
	and a
	ret

.RightPressed:
	ld a, [hl]
	inc a
	jr .Save

.LeftPressed:
	ld a, [hl]
	dec a

.Save:
	maskbits NUM_FRAMES
	ld [hl], a
UpdateFrame:
	ld a, [wTextboxFrame]
	hlcoord 16, 15 ; where on the screen the number is drawn
	add "1"
	ld [hl], a
	call LoadFontsExtra
	and a
	ret

Options_Cancel:
	ldh a, [hJoyPressed]
	and A_BUTTON
	jr nz, .Exit
	and a
	ret

.Exit:
	scf
	ret

OptionsControl:
	ld hl, wJumptableIndex
	ldh a, [hJoyLast]
	cp D_DOWN
	jr z, .DownPressed
	cp D_UP
	jr z, .UpPressed
	and a
	ret

.DownPressed:
	ld a, [hl]
	cp OPT_CANCEL ; maximum option index
	jr nz, .CheckMenuAccount
	ld [hl], OPT_TEXT_SPEED ; first option
	scf
	ret

.CheckMenuAccount: ; I have no idea why this exists...
	cp OPT_MENU_ACCOUNT
	jr nz, .Increase
	ld [hl], OPT_MENU_ACCOUNT

.Increase:
	inc [hl]
	scf
	ret

.UpPressed:
	ld a, [hl]

; Another thing where I'm not sure why it exists
	cp OPT_FRAME
	jr nz, .NotFrame
	ld [hl], OPT_MENU_ACCOUNT
	scf
	ret

.NotFrame:
	and a ; OPT_TEXT_SPEED, minimum option index
	jr nz, .Decrease
	ld [hl], NUM_OPTIONS ; decrements to OPT_CANCEL, maximum option index

.Decrease:
	dec [hl]
	scf
	ret

Options_UpdateCursorPosition:
	hlcoord 1, 1
	ld de, SCREEN_WIDTH
	ld c, SCREEN_HEIGHT - 2
.loop
	ld [hl], " "
	add hl, de
	dec c
	jr nz, .loop
	hlcoord 1, 2
	ld bc, 2 * SCREEN_WIDTH
	ld a, [wJumptableIndex]
	call AddNTimes
	ld [hl], "▶"
	ret
