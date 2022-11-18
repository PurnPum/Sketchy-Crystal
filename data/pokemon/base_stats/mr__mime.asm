	db MR__MIME ; 122

	db  60,  45, 125,  90, 100, 65
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC_TYPE, NORMAL ; type
	db 45 ; catch rate
	db 136 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 25 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/mr__mime/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm SKETCH, PROTECT
	; end
