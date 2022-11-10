CalculateBattleMoneyMultipliers:
	ld hl, wBattleReward + 1
	ld a, [hli]									; 2nd byte of BattleReward (1st byte can't ever be anything other than 00)
	ld b, a
	ld a, [hl]									; 3rd byte of BattleReward
	ld c, a
	srl b
	rr c
	ld h, b
	ld l, c										; hl = BattleReward / 2
	srl b
	rr c										; bc = BattleReward / 4
	add hl, bc									; hl = hl + bc = 3 * Battle Reward / 4
	ld d, h
	ld e, l										; Load hl in de to overwrite BattleReward
	ld hl, wBattleReward + 1
	ld a, d
	ld [hli], a
	ld a, e
	ld [hl], a									; After this BattleReward is 3/4ths of what it was
	push bc										; Save bc which has the 1/4th prize value
	call CalculateBattleMoneyTurnMultiplier		; After calling this, bc has the first multiplier which is times 20
	push bc										; Save that multiplier
	ld hl, TurnMoneyBonusMultiplierText
	call PrintMultiplier
	call CalculateBattleMoneyLevelMultiplier	; After calling this, bc has the second multiplier which is times 40
	ld d, c
	srl c										; Divide c by 2 for the printing function
	ld hl, LevelMoneyBonusMultiplierText
	push de
	call PrintMultiplier
	pop de
	pop bc										; Restore bc to the first calculated multiplier
	ld e, c										; Both mutipliers are in de now, we do this to check if they are above 10 together
	ld a, d
	ldh [hMultiplicand + 2], a
	ld a, e
	ldh [hMultiplier], a
	call Multiply								; Multiply both multipliers together, if the result is larger than 8000 (10*800) then jump to the simplified version.
	ldh a, [hProduct + 2]
	cp $1F										; We're looking for the number 8000 which is 1F40 (10*800)
	jr c, .leave								; Value is smaller so we leave this check
	jr z, .next									; Value is the same so we continue the check
	jr .tenx									; Value is larger so we jump to the simplified 10x
.next
	ldh a, [hProduct + 3]
	cp $40										; We're looking for the number 8000 which is 1F40 (10*800)
	jr nc, .tenx								; Value is either larger or the same so we jump to 10x, fallthrough if smaller
.leave
	ldh a, [hProduct + 2]
	ld b, a
	ldh a, [hProduct + 3]						
	ld c, a										; Now bc holds the Final multipler times 800
	ld hl, FinalMoneyBonusMultiplierText
	push de
	call PrintMultiplier						; Print the final Multiplier
	pop de
	pop bc										; Restore bc's value, which is 1/4th of the money prize
	ld a, b
	ldh [hMultiplicand + 1], a					; Store a 4th of the original BattleReward in hMultiplicand
	ld a, c
	ldh [hMultiplicand + 2], a
	ld a, d										; Get the Level multiplier
	and a										; If 'a' is 0 it means the multiplier is 0 which should just stop the procedure.
	ret z										; The bonus part of the prize money has already been taken away.
	ldh [hMultiplier], a
	call Multiply								; Multiply the 4th of the Prize Money by the Turn multiplier
	ld a, e										; Get the Turn multiplier
	and a										; If 'a' is 0 it means the multiplier is 0 which should just stop the procedure.
	ret z										; The bonus part of the prize money has already been taken away.
	ldh [hMultiplier], a
	call Multiply								; Multiply the acumulated value by the Level multiplier
	ld b, 4										; Length byte-wise for the Divison operation
	ld a, 200									; Lastly we need to divide by 800 to de-escalate the values, to fit an 8-bit value in hDivisor
	ld [hDivisor], a							; we will divide by 200 and then divide by 4 (200*4=800)
	call Divide
	ld b, 4
	ld a, b
	ldh [hDivisor], a
	call Divide									; We finally have the end result, should be 2 bytes long at most
	ld hl, wBattleReward + 1
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a										; bc now holds the 3/4ths of the original BattleReward
	ldh a, [hQuotient + 2]
	ld h, a
	ldh a, [hQuotient + 3]
	ld l, a
	jr .finally									; Jump with hl holding the final bonus value
	
.tenx											; If we're here the total multipler is 10 or higher
	ld b, $1F
	ld c, $40									; bc = $1F40 = 8000d = 10.00x multipler
	ld hl, FinalMoneyBonusMultiplierText
	call PrintMultiplier						; Print the final Multiplier (which will always be 10 here)
	pop bc										; Restore bc's value, which is 1/4th of the money prize
	ld a, b
	ldh [hMultiplicand + 1], a
	ld a, c
	ldh [hMultiplicand + 2], a
	ld a, 10
	ldh [hMultiplier], a
	call Multiply								; Now hProduct will have the prize money we have to add to the 3/4ths we already have
	ldh a, [hProduct + 2]						; The value should never be larger than 65536 (max should be 2400*10=24000)
	ld h, a
	ldh a, [hProduct + 3]						; The value is in hl
	ld l, a
	push hl
	ld hl, wBattleReward + 1					; Now load the 3/4ths previously calculated and stored
	ld b, [hl]
	inc hl
	ld c, [hl]
	pop hl										; Restore hl's value which was the final bonus
.finally
	add hl, bc									; Lastly do bonus + 3/4th prize to get the final sum, stored in hl. This value will at most be 62400 with an amulet coin (7200+2400*10)*2.
	ld b, h
	ld c, l										; Copy hl to bc
	ld hl, wBattleReward + 1
	ld [hl], b
	inc hl
	ld [hl], c									; And finally store the result in wBattleReward
	ret
	
CalculateBattleMoneyTurnMultiplier:
	ld a, [wPlayerTurnsTaken]
	ld c, a								; Load the amount of turns taken by the player in 'c'
	cp 37								; If more than 37 turns have passed, the multiplier will be 0
	jr nc, .zero						; if c = 0 then the value is higher or equal to 37
	ld a, [wOTPartyCount]
	ld b, a								; Load the party size of the enemy trainer in 'b'
	ld hl, BattleMoneyTurnMultipliers	; Load the table with the multipliers
.loop
	dec a								; 'a' is now the enemy party size - 1
	and a								; if 'a' is 0...
	jr z, .proceed						; exit the loop
	inc hl
	inc hl								; increase hl by 2 to advance to the next row in the table
	jr .loop
.proceed								; Now hl points to the correct row in the multipliers table
	ld a, [hli]							
	ld d, a								; d = Multiplier
	ld a, [hl]							; a = Decrement value
	dec c								; Decrement c by 1
	call SimpleMultiply					; Returns a=a*c, 'a' is the decrement value and 'c' is the amount of turns (144 max result, 0 min result)
	cp d								; Compare 'a' which we just calculated to 'd' which is the current base multiplier times 20
	jr nc, .zero						; If 'a' is larger or equal to 'd' then the multiplier will be zero
	ld e, a
	ld a, d
	ld d, e								; Switch 'd' and 'a'
	sub d								; a = a-d , it's guaranteed that this will never underflow
	ld c, a								; Load 'a' in 'c'
	ld b, 0								; Load 0 in 'b' ; thus 'bc' holds the Turn Multiplier (still multiplied by 20)
	ret
.zero									; Mutiplier is 0
	xor a
	ld b, a
	ld c, a
	ret

CalculateBattleMoneyLevelMultiplier:
	ld a, [wOTPartyCount]
	ld bc, wOTPartyMon1Species
	call ReturnHighestLevelFromParty	; First get the highest level of the enemy trainer's party, stored in 'd'
	ld hl, BattleMoneyLevelMultipliers	; Load the multipliers table, and start the loop
.loop
	ld a, [hli]							; 'a' is now a max enemy level from the table, starting at 10. Increase hl by 1
	cp d								; 'd' holds the highest level found on the enemy team, compare it to 'a'
	jr nc, .done						; if c=0 then 'a' was higher or equal to 'd', which means we're in the correct row of the table. This finishes the loop if we reach 100.
	inc hl
	inc hl								; increase hl by 2 more to advance to the next row in the table
	jr .loop
.done									; Now hl points to the correct row in the multipliers table
	push hl								; Save hl for now
	ld a, [wPartyCount]
	ld bc, wPartyMon1Species
	push de
	call ReturnHighestLevelFromParty	; Now get the highest level of our party, stored in 'd'.
	ld b, d								; Copy d's value in b since we need to reset 'd' with a pop
	pop de								; Now 'b' has the highest level from the player, while 'd' has the highest level from the enemy
	ld a, b								; 'a' = 'b'
	cp d								; If 'b' is larger than 'd' then the increments become decrements
	jr nc, .overleveled
	ld a, d								; If we're here 'b' is smaller or the same as 'd'
	ld d, b								; Swap 'a' and 'd' to do the substraction
	sub d								; 'a' = 'a' - 'd'
	ld d, a								; Save the final value in 'd' (level difference)
	pop hl								; Restore hl to the correct level multiplier table row, do it before the cp so its always popped
	cp 20								; If the level diff is 20 or more the final multiplier will always be the max (4x)
	jr nc, .fourx
	ld a, [hli]							; 'a' is now the increment times 40
	ld c, a								; Save that in 'c'
	ld a, [hl]							; 'a' is now the multiplier times 40
	ld b, a								; Save that in 'b'
	cp 14								; Compare the loaded increment with 14, this is done to prevent a very specific overflow
	jr nc, .halve
	ld a, d								; Load the level diff in 'a'
	call SimpleMultiply					; Do a*c , which is the level diff times the increment
	add b								; a = a + b, which is the base multiplier plus the number calculated earlier
	jr c, .fourx						; If the carry is 1 then we overflowed thus we're at the max multiplier (4x)
	ld c, a
	ld b, 0
	ret									; bc has the multiplier times 40
	
.halve
	srl b
	srl c								; Divide 'b' and 'c' by 2 independently
	ld a, d								; Load the level diff in 'a'
	call SimpleMultiply					; Do a*c , which is the level diff times the increment
	add b								; a = a + b, which is the base multiplier plus the number calculated earlier. Here we can't overflow (max value would be 19*7+26)
	sla a								; a = a * 2. Do this to restore the halving operation we did earlier and keep the multiplier consistent (always times 40)
	jr c, .fourx						; If the carry is 1 then we overflowed thus we're at the max multiplier (4x)
	ld c, a
	ld b, 0
	ret									; bc has the multiplier times 40

.fourx
	ld b, 0
	ld c, 160							; 160 = 4*40
	ret									; bc has the multiplier times 40
	
.overleveled							; If the player's level is higher then we have to substract from the multiplier	
	sub d								; 'a' = 'a' - 'd'
	and a								; If the result is zero, jump to a simple solution
	jr z, .zero
	ld d, a								; Save the final value in 'd' (level difference)
	pop hl								; Restore hl to the correct level multiplier table row
	cp 7								; If the level diff is 7 or more the final multiplier will always be the min (0x)
	jr nc, .zerox
	ld a, [hli]							; 'a' is now the multiplier times 40
	ld c, a								; Save that in 'c'
	ld a, [hl]							; 'a' is now the increment times 40
	ld b, a								; Save that in 'b'
	ld a, d								; Load the level diff in 'a'
	call SimpleMultiply					; Do a*c , which is the level diff times the increment
	cp b								; Compare 'a' to 'b', if 'a' is equal or larger than 'b' then the multiplier is always 0
	jr nc, .zerox
	ld d, a
	ld a, b
	ld b, d								; This swaps 'a' and 'b' so that we can properly substract
	sub b								; a = a - b, which is the base multiplier minus the number calculated earlier
	ld c, a
	ld b, 0
	ret									; bc has the multiplier times 40

.zero									; We're here if we are at the same level as the opponent
	pop hl								; Restore hl to the correct level multiplier table row
	inc hl								; Go to 2nd row
	ld a, [hl]							; 'a' is now the multiplier times 40
	ld c, a
	ld b, 0
	ret									; Return the multipler raw since the increment is 0
	
.zerox
	ld b, 0
	ld c, 0
	ret									; Return a zero

ReturnHighestLevelFromParty:			; Inputs : a -> wOTPartyCount and bc -> wOTPartyMon1Species or a -> wPartyCount and bc -> wPartyMon1Species
	ld e, a								; Load the enemy party size in 'e'
	ld d, 0								; Set 'd' to 0. We will store the level here
.loop
	push bc								; Save bc's value so that we can use it to set hl to its value every loop
	ld h, b
	ld l, c			 					; This basically equals to ld hl, bc
	ld a, MON_LEVEL						; Load the Level Offset in 'a' and then in 'c'
	ld c, a
	ld b, 0
	add hl, bc							; This will position hl at the level of the 1st mon
	ld a, e
	dec a								; Load the party size and lower it by 1
	call GetPartyLocation				; Use that to position at the level of the 'e'th mon
	ld a, [hl]							; Load that level in 'a'
	cp d								; Compare the level to the one saved in 'd'
	jr c, .next							; if c=1 then 'a' was smaller than 'd', so we skip to the next
	ld d, a								; Save a copy of 'a' in 'd'
.next
	pop bc								; Now bc is wOTPartyMon1Species or wPartyMon1Species again
	dec e
	ret z								; The Highest level will be returned in 'd'
	jr .loop
	
PrintMultiplier:						; Input -> bc : Multiplier | hl -> Text Pointer
	ld a, b
	and a								; If b is 0 then we're handling small the Turn/Level multiplier, or the Total one but its smaller than 256 (0.32)
	jr z, .turnlevel					; If b isn't 0 then handle the Total multipler for printing
	srl b
	rr c								; 400
	srl b
	rr c								; 200	
	srl b
	rr c								; 100
	srl b
	rr c								; 50
	srl b
	rr c								; 25 There will be some error introduced with all these divisions
	ld a, c								; Once here 'b' will be 0, the highest value possible would be 00FA (250) when multiplier is 10x
	ld c, 25
	call SimpleDivide					; After this, 'b' has the quotient and 'a' the remainder, same as with turn/level 
	sla a
	sla a								; Multiply the remainder by 4 so that it makes sense when represented as decimals
	jr .finish
.turnlevel
	ld a, c
	ld c, 20
	call SimpleDivide					; This will divide the multiplier by 20, 'b' has the quotient and 'a' the remainder
	ld c, 5
	call SimpleMultiply					; Multiply the remainder by 5 so it makes sense when represented as decimals
.finish
	push hl
	ld hl, wStringBuffer3 + 1
	ld [hld], a
	ld [hl], b
	pop hl
	call StdBattleTextbox
	ret
	
INCLUDE "data/battle/battle_money_level_bonus_multipliers.asm"
INCLUDE "data/battle/battle_money_turn_bonus_multipliers.asm"