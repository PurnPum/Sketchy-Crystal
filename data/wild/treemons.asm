TreeMons:
; entries correspond to TREEMON_SET_* constants
	table_width 2, TreeMons
	dw TreeMonSet_City1
	dw TreeMonSet_City2
	dw TreeMonSet_City3
	dw TreeMonSet_City4
	dw TreeMonSet_Blank
	dw TreeMonSet_Canyon
	dw TreeMonSet_Route1
	dw TreeMonSet_Route2
	dw TreeMonSet_Route3
	dw TreeMonSet_Kanto
	dw TreeMonSet_Lake
	dw TreeMonSet_Forest
	dw TreeMonSet_Rock
	assert_table_length NUM_TREEMON_SETS
	;dw TreeMonSet_City ; unused

; Two tables each (common, rare).
; Structure:
;	db  %, species, level

TreeMonSet_City1:
; common
	db 40, SPEAROW,    8
	db 25, PIDGEY,     8
	db 20, NATU,       8
	db 15, MURKROW,    8
	db -1
; rare
	db 30, NATU,       8
	db 30, MURKROW,    8
	db 20, SPEAROW,    8
	db 20, PIDGEY,     8
	db -1
	
TreeMonSet_City2:
; common
	db 40, LEDYBA,     13
	db 25, SPINARAK,   13
	db 20, YANMA,      13
	db 15, VENONAT,    13
	db -1
; rare
	db 30, YANMA,      13
	db 30, VENONAT,    13
	db 20, LEDYBA,     13
	db 20, SPINARAK,   13
	db -1
	
TreeMonSet_City3:
; common
	db 100, UNOWN, 2
	db -1
; rare
	db 100, UNOWN, 2
	db -1
	
TreeMonSet_City4:
; common
	db 100, UNOWN, 2
	db -1
; rare
	db 100, UNOWN, 2
	db -1
	
TreeMonSet_Blank:
; common
	db -1
; rare
	db -1

TreeMonSet_Canyon:
; common
	db 100, UNOWN, 2
	db -1
; rare
	db 100, UNOWN, 2
	db -1

TreeMonSet_Route1:
; common
	db 40, SUNKERN,    8
	db 25, PARAS,      8
	db 20, AIPOM,      8
	db 15, FARFETCH_D, 8
	db -1
; rare
	db 30, AIPOM,      8
	db 30, FARFETCH_D, 8
	db 20, SUNKERN,    8
	db 20, PARAS,      8
	db -1
	
TreeMonSet_Route2:
; common
	db 40, BELLSPROUT, 13
	db 25, ODDISH,     13
	db 20, SKIPLOOM,   13
	db 15, EKANS,      13
	db -1
; rare
	db 30, SKIPLOOM,   13
	db 30, EKANS,      13
	db 20, BELLSPROUT, 13
	db 20, ODDISH,     13
	db -1
	
TreeMonSet_Route3:
; common
	db 100, UNOWN, 2
	db -1
; rare
	db 100, UNOWN, 2
	db -1

TreeMonSet_Kanto:
; common
	db 100, UNOWN, 2
	db -1
; rare
	db 100, UNOWN, 2
	db -1

TreeMonSet_Lake:
; common
	db 100, UNOWN, 2
	db -1
; rare
	db 100, UNOWN, 2
	db -1

TreeMonSet_Forest:
; common
	db 40, BEEDRILL,   16
	db 25, BUTTERFREE, 16
	db 20, LEDIAN,     16
	db 15, SCYTHER,    16
	db -1
; rare
	db 30, LEDIAN,     16
	db 30, SCYTHER,    16
	db 20, BEEDRILL,   16
	db 20, BUTTERFREE, 16
	db -1

TreeMonSet_Rock:
	db 100, UNOWN, 2
	db -1
