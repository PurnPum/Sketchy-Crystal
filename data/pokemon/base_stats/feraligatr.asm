	db FERALIGATR ; 160

	db  85, 79,  100,  78,  105, 87
	;   hp  atk  def  spd  sat  sdf

	db WATER, DARK ; type
	db 45 ; catch rate
	db 210 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/feraligatr/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_WATER_1 ; egg groups

	; tm/hm learnset
	tmhm SKETCH, CUT, FLY, SURF, STRENGTH, FLASH, WHIRLPOOL, WATERFALL, ROCK_SMASH
	; end
