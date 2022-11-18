BattleCommand_BlizzardAccuracy:
; blizzardaccuracy

	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVarAddr
	inc hl
	ld a, [wBattleWeather]
	cp WEATHER_HAIL
	jr z, .hail
	ld [hl], 70 percent + 1 ;default accuracy
	ret

.hail
	; Redundant with CheckHit guranteeing hit
	ld [hl], 100 percent
	ret
