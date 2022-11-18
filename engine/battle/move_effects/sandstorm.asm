BattleCommand_StartSandstorm:
	ld a, [wBattleWeather]
	cp WEATHER_SANDSTORM
	jr z, .failed

	ld a, WEATHER_SANDSTORM
	ld [wBattleWeather], a
	call GetUserItem
	ld a, b
	cp HELD_EXTEND_SANDSTORM
	ld a, 5
	jr nz, .no_extend
	inc a
	inc a
	inc a
.no_extend
	ld [wWeatherCount], a
	call AnimateCurrentMove
	ld hl, SandstormBrewedText
	jp StdBattleTextbox

.failed
	call AnimateFailedMove
	jp PrintButItFailed
