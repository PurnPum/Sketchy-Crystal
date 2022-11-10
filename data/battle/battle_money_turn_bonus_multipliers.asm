BattleMoneyTurnMultipliers: ;List of multipliers for turn money bonuses after a battle
	table_width 2, BattleMoneyTurnMultipliers
	;The multiplier gets separated into 2 numbers, the first being the multiplier multiplied by 20, and the 3rd being the decrement also mutiplied by 20
	db	32,	4	; 1  Foe 	1,6 multiplier		0,20 decrement
	db  48,	4	; 2 Foes 	2,4 multiplier		0,20 decrement
	db  54,	3	; 3 Foes 	2,7 multiplier		0,15 decrement
	db  70,	3	; 4 Foes 	3,5 multiplier		0,15 decrement
	db  62,	2	; 5 Foes 	3,1 multiplier		0,10 decrement
	db  72,	2	; 6 Foes 	3,6 multiplier		0,10 decrement
