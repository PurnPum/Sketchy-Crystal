	db CLEFAIRY ; 035

	db  75,  45,  48,  35,  60,  65
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 150 ; catch rate
	db 68 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F75 ; gender ratio
	db 100 ; unknown 1
	db 10 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/clefairy/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_FAST ; growth rate
	dn EGG_FAIRY, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm SKETCH, CUT, FLY, SURF, STRENGTH, FLASH, WHIRLPOOL, WATERFALL, ROCK_SMASH
	; end
