MACRO momitem
; money to trigger, cost, kind, item
	dt \1
	dt \2
	db \3, \4
ENDM

MomItems_1:
	momitem      0,   200, MOM_ITEM, SUPER_POTION
	momitem      0,    90, MOM_ITEM, RAGECANDYBAR
	momitem      0,   180, MOM_ITEM, POKE_BALL
	momitem      0,    20, MOM_ITEM, ESCAPE_ROPE
	momitem      0,   500, MOM_ITEM, GREAT_BALL
.End

MomItems_2:
	momitem    200,    20, MOM_ITEM, REPEL
	momitem    500,    50, MOM_ITEM, SUPER_REPEL
	momitem   1000,   200, MOM_ITEM, SUPER_POTION
	momitem   2000,   250, MOM_ITEM, SODA_POP
	momitem   3000,   450, MOM_ITEM, MOOMOO_MILK
	momitem   4000,   520, MOM_ITEM, LEMONADE
	momitem   5000,  1500, MOM_ITEM, FIRE_STONE
	momitem   6000,  1500, MOM_ITEM, WATER_STONE
	momitem   7000,  1500, MOM_ITEM, LEAF_STONE
	momitem   8000,  1500, MOM_ITEM, THUNDERSTONE
.End

	dt 0 ; unused
