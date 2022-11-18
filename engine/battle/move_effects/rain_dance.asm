BattleCommand_StartRain:
	ld a, WEATHER_RAIN
	ld [wBattleWeather], a
	call GetUserItem
	ld a, b
	cp HELD_EXTEND_RAIN
	ld a, 5
	jr nz, .no_extend
	inc a
	inc a
	inc a
.no_extend
	ld [wWeatherCount], a
	call AnimateCurrentMove
	ld hl, DownpourText
	jp StdBattleTextbox
