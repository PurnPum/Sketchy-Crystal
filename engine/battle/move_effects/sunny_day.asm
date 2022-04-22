BattleCommand_StartSun:
; startsun
	ld a, WEATHER_SUN
	ld [wBattleWeather], a
	call GetUserItem
	ld a, b
	cp HELD_EXTEND_SUN
	ld a, 5
	jr nz, .no_extend
	inc a
	inc a
	inc a
.no_extend
	ld [wWeatherCount], a
	call AnimateCurrentMove
	ld hl, SunGotBrightText
	jp StdBattleTextbox
