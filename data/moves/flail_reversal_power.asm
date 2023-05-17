FlailReversalPower:
	; hp bar pixels, power
	db HP_BAR_LENGTH_PX / 24,   150 ; HP < 6.25%
	db HP_BAR_LENGTH_PX / 8,    120 ; 6.25% < HP < 14.5833%
	db HP_BAR_LENGTH_PX / 4,    100 ; 14.5833% < HP < 27.0833%
	db HP_BAR_LENGTH_PX / 2,     80 ; 27.0833% < HP < 52.0833%
	db HP_BAR_LENGTH_PX * 3 / 4, 40 ; 52.0833% < HP < 77.0833%
	db HP_BAR_LENGTH_PX,         20 ; 77.0833% < HP

; Formula : (HP * 48) / Max HP 

; For the examples Max HP = 100

; MAX 150 BP -> (HP * 48) / Max HP < 3
;	HP*48 < 3 * Max HP
;	HP*48 < 300
;	HP < 300/48
;	HP < 6.25%

; MAX 120 BP -> (HP * 48) / Max HP < 7
;	HP*48 < 7 * Max HP
;	HP*48 < 700
;	HP < 700/48
;	HP < 14.5833%

; MAX 100 BP -> (HP * 48) / Max HP < 13
;	HP*48 < 13 * Max HP
;	HP*48 < 1300
;	HP < 1300/48
;	HP < 27.0833%

; MAX 80 BP -> (HP * 48) / Max HP < 25
;	HP*48 < 25 * Max HP
;	HP*48 < 2500
;	HP < 2500/48
;	HP < 52.0833%

; MAX 40 BP -> (HP * 48) / Max HP < 37
;	HP*48 < 37 * Max HP
;	HP*48 < 3700
;	HP < 3700/48
;	HP < 77.0833%
