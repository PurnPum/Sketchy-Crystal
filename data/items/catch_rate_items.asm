; Pokémon traded from RBY do not have held items, so GSC usually interprets the
; catch rate as an item. However, if the catch rate appears in this table, the
; item associated with the table entry is used instead.

TimeCapsule_CatchRateItems:
	db THICK_WEB, BERRY
	db STURDY_GLOVE, BERRY
	db VENOM_SPEAR, BERRY
	db ITEM_5A, BERRY
	db GIFT_SACK, BERRY
	db ITEM_78, BERRY
	db DAMP_ROCK, BERRY
	db ITEM_BE, BERRY
	db ITEM_FA, BERRY
	db -1,      BERRY
	db 0 ; end
