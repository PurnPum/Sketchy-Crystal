; HM moves can't be forgotten

IsHM::
	ret ;Dont do anything, there are no HMs
	;cp HM01
	jr c, .NotHM
	scf
	ret
.NotHM:
	and a
	ret

IsHMMove::
	ld hl, .HMMoves
	ld de, 1
	jp IsInArray

.HMMoves:
	db -1 ; end
