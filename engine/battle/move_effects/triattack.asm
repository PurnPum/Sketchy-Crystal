BattleCommand_TriAttack:
; triattack
	ld a, [wBattleAnimParam]
	and a
	jr z, .first_attack
	cp 1
	jr z, .second_attack
	jr .third_attack
.first_attack
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVarAddr
	ld a, FIRE
	jr .done
.second_attack
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVarAddr
	ld a, ICE
	jr .done
.third_attack
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVarAddr
	ld a, ELECTRIC
.done
	ld [hl], a
	ret
