BattleCommand_StartHail:
; startsandstorm

	ld a, [wBattleWeather]
	cp WEATHER_HAIL
	jr z, .failed

	ld a, WEATHER_HAIL
	ld [wBattleWeather], a
	call GetUserItem
	ld a, b
	cp HELD_EXTEND_HAIL
	ld a, 5
	jr nz, .no_extend
	inc a
	inc a
	inc a
.no_extend
	ld [wWeatherCount], a
	call AnimateCurrentMove
	ld hl, HailStartedText
	jp StdBattleTextbox

.failed
	call AnimateFailedMove
	jp PrintButItFailed
