BattleMoneyLevelMultipliers: ;List of multipliers for level money bonuses after a battle
	table_width 3, BattleMoneyLevelMultipliers
	;The multiplier gets separated into 3 numbers, first max enemy level, then the increment (multiplied by 40) and lastly the multiplier (multiplied by 40)
	db	 10,	24,	60	;   Levels 2-10, 0.600 increment per level, 1.50 base multiplier
	db   20,	20,	56	;  Levels 11-20, 0.500 increment per level, 1.40 base multiplier
	db   30,	16,	54	;  Levels 21-30, 0.400 increment per level, 1.35 base multiplier
	db   40,	14,	52	;  Levels 31-40, 0.350 increment per level, 1.30 base multiplier
	db   50,	12,	50	;  Levels 41-50, 0.300 increment per level, 1.25 base multiplier
	db   60,	10,	48	;  Levels 51-60, 0.250 increment per level, 1.20 base multiplier
	db	 70,	 9,	46 	;  Levels 61-70, 0.225 increment per level, 1.15 base multiplier
	db	 80,	 8,	44	;  Levels 71-80, 0.200 increment per level, 1.10 base multiplier
	db	 90,	 7,	42	;  Levels 81-90, 0.175 increment per level, 1.05 base multiplier
	db	100,	 6,	40	; Levels 91-100, 0.150 increment per level, 1.00 base multiplier
