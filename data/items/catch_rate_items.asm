; Pokémon traded from RBY do not have held items, so GSC usually interprets the
; catch rate as an item. However, if the catch rate appears in this table, the
; item associated with the table entry is used instead.

TimeCapsule_CatchRateItems:
	db ITEM_19, BERRY
	db ITEM_2D, BERRY
	db ITEM_32, BERRY
	db ITEM_5A, BERRY
	db ITEM_64, BERRY
	db ITEM_78, BERRY
	db DAMP_ROCK, BERRY
	db ITEM_BE, BERRY
	db ITEM_FA, BERRY
	db -1,      BERRY
	db 0 ; end
