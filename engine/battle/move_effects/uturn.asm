BattleCommand_UTurn:
; batonpass

	ldh a, [hBattleTurn]
	and a
	jp nz, .Enemy

; Need something to switch to
	call CheckAnyOtherAlivePartyMons
	jp z, UTurnCantSwitch

	call UpdateBattleMonInParty

	ld c, 50
	call DelayFrames

; Transition into switchmon menu
	call LoadStandardMenuHeader
	farcall SetUpBattlePartyMenu

	farcall ForcePickSwitchMonInBattle

; Return to battle scene
	call ClearPalettes
	farcall _LoadBattleFontsHPBar
	call CloseWindow
	call ClearSprites
	;call SwitchPlayerMon
	hlcoord 1, 0
	lb bc, 4, 10
	call ClearBox
	ld b, SCGB_BATTLE_COLORS
	call GetSGBLayout
	call SetPalettes
	call BatonPass_LinkPlayerSwitch
	callfar ResetPlayerStatLevels
	callfar NewBattleMonStatus

; Mobile link battles handle entrances differently
	farcall CheckMobileBattleError
	jp c, EndMoveEffect

	ld hl, PassedBattleMonEntrance
	call CallBattleCore

	call ResetBatonPassStatus
	ret

.Enemy:
; Wildmons don't have anything to switch to
	ld a, [wBattleMode]
	dec a ; WILDMON
	jp z, UTurnCantSwitch

	call CheckAnyOtherAliveEnemyMons
	jp z, UTurnCantSwitch

	callfar ResetEnemyStatLevels
	callfar NewEnemyMonStatus
	call UpdateEnemyMonInParty
	call BatonPass_LinkEnemySwitch

; Mobile link battles handle entrances differently
	farcall CheckMobileBattleError
	jp c, EndMoveEffect

; Passed enemy PartyMon entrance
	xor a
	ld [wEnemySwitchMonIndex], a
	ld hl, EnemySwitch_SetMode
	call CallBattleCore
	ld hl, ResetBattleParticipants
	call CallBattleCore
	ld a, TRUE
	ld [wApplyStatLevelMultipliersToEnemy], a
	ld hl, ApplyStatLevelMultiplierOnAllStats
	call CallBattleCore

	ld hl, SpikesDamage
	call CallBattleCore

	jp ResetBatonPassStatus
	
UTurnCantSwitch:
	call AppearUserRaiseSub
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	cp TELEPORT ;If we're using teleport then print the failed text if we're here
	ret nz
	call AnimateFailedMove
	jp PrintButItFailed