; Multiplier ratios for accuracy from modifier -6 to +6
; (for other stats, see data/battle/stat_multipliers.asm).

AccuracyLevelMultipliers:
	db  33, 100 ; -6 =  33%
	db  36, 100 ; -5 =  36%
	db  43, 100 ; -4 =  43%
	db  50, 100 ; -3 =  50%
	db  60, 100 ; -2 =  60%
	db  75, 100 ; -1 =  75%
	db   1,   1 ;  0 = 100%
	db 125, 100 ; +1 = 125%
	db 150, 100 ; +2 = 150%
	db 175, 100 ; +3 = 175%
	db   2,   1 ; +4 = 200%
	db 225, 100 ; +5 = 225%
	db 150,  50 ; +6 = 250%

