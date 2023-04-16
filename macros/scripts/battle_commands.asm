MACRO command
	const \1_command
	DEF \1 EQUS "db \1_command"
ENDM

; BattleCommandPointers indexes (see data/battle/effect_command_pointers.asm)
	const_def 1
	command checkturn               ; 01
	command checkobedience          ; 02
	command usedmovetext            ; 03
	command doturn                  ; 04
	command critical                ; 05
	command damagestats             ; 06
	command stab                    ; 07
	command damagevariation         ; 08
	command checkhit                ; 09
	command lowersub                ; 0a
	command moveanimnosub           ; 0b
	command raisesub                ; 0c
	command failuretext             ; 0d
	command applydamage             ; 0e
	command criticaltext            ; 0f
	command supereffectivetext      ; 10
	command checkfaint              ; 11
	command buildopponentrage       ; 12
	command poisontarget            ; 13
	command sleeptarget             ; 14
	command draintarget             ; 15
	command eatdream                ; 16
	command burntarget              ; 17
	command freezetarget            ; 18
	command paralyzetarget          ; 19
	command selfdestruct            ; 1a
	command mirrormove              ; 1b
	command statup                  ; 1c
	command statdown                ; 1d
	;command payday                 
	command conversion              ; 1e
	command resetstats              ; 1f
	command storeenergy             ; 20
	command unleashenergy           ; 21
	command forceswitch             ; 22
	command endloop                 ; 23
	command flinchtarget            ; 24
	;command ohko                   
	command recoil                  ; 25
	command mist                    ; 26
	command focusenergy             ; 27
	command confuse                 ; 28
	command confusetarget           ; 29
	command heal                    ; 2a
	;command transform              
	command screen                  ; 2b
	command poison                  ; 2c
	command paralyze                ; 2d
	command substitute              ; 2e
	command rechargenextturn        ; 2f
	command mimic                   ; 30
	command metronome               ; 31
	command leechseed               ; 32
	;command splash                 
	command disable                 ; 33
	command cleartext               ; 34
	command charge                  ; 35
	command checkcharge             ; 36
	command traptarget              ; 37
	command effect0x3c              ; 38
	command rampage                 ; 39
	command checkrampage            ; 3a
	command constantdamage          ; 3b
	command counter                 ; 3c
	command encore                  ; 3d
	command painsplit               ; 3e
	command snore                   ; 3f
	command conversion2             ; 40
	command lockon                  ; 41
	command sketch                  ; 42
	command defrostopponent         ; 43
	command sleeptalk               ; 44
	command destinybond             ; 45
	command spite                   ; 46
	command falseswipe              ; 47
	command healbell                ; 48
	command kingsrock               ; 49
	command triplekick              ; 4a
	command kickcounter             ; 4b
	;command thief                  
	command arenatrap               ; 4c
	command nightmare               ; 4d
	command defrost                 ; 4e
	command curse                   ; 4f
	command protect                 ; 50
	command spikes                  ; 51
	command foresight               ; 52
	command perishsong              ; 53
	command startsandstorm          ; 54
	command endure                  ; 55
	command checkcurl              
	command rolloutpower            ; 56
	command effect0x5d              ; 57
	command furycutter              ; 58
	command attract                 ; 59
	command poltergeist             ; 5a
	;command present                 
	command healsand                ; 5b
	command damagecalc              ; 5c
	;command frustrationpower       
	command safeguard               ; 5d
	command checksafeguard          ; 5e
	;command getmagnitude           
	command batonpass               ; 5f
	command pursuit                 ; 60
	command clearhazards            ; 61
	command healsun                 ; 62
	command healhail                ; 63
	command healrain				; 64
	command hiddenpower             ; 65
	command startrain               ; 66
	command startsun                ; 67
	command attackup                ; 68
	command defenseup               ; 69
	command speedup                 ; 6a
	command specialattackup         ; 6b
	command specialdefenseup        ; 6c
	command accuracyup              ; 6d
	command evasionup               ; 6e
	command attackup2               ; 6f
	command defenseup2              ; 70
	command speedup2                ; 71
	command specialattackup2        ; 72
	command specialdefenseup2       ; 73
	command accuracyup2             ; 74
	command evasionup2              ; 75
	command attackdown              ; 76
	command defensedown             ; 77
	command speeddown               ; 78
	command specialattackdown       ; 79
	command specialdefensedown      ; 7a
	command accuracydown            ; 7b
	command evasiondown             ; 7c
	command attackdown2             ; 7d
	command defensedown2            ; 7e
	command speeddown2              ; 7f
	command specialattackdown2      ; 80
	command specialdefensedown2     ; 81
	command accuracydown2           ; 82
	command evasiondown2            ; 83
	command statupmessage           ; 84
	command statdownmessage         ; 85
	command statupfailtext          ; 86
	command statdownfailtext        ; 87
	command effectchance            ; 88
	command statdownanim            ; 89
	command statupanim              ; 8a
	command switchturn              ; 8b
	command fakeout                 ; 8c
	;command bellydrum              
	;command psychup                
	command rage                    ; 8d
	command doubleflyingdamage      ; 8e
	command doubleundergrounddamage ; 8f
	command mirrorcoat              ; 90
	command checkfuturesight        ; 91
	command futuresight             ; 92
	command doubleminimizedamage    ; 93
	command skipsuncharge           ; 94
	command skipraincharge			; 95
	command thunderaccuracy         ; 96
	;command teleport               ; 
	command beatup                  ; 97
	command ragedamage              ; 98
	command resettypematchup        ; 99
	command allstatsup              ; 9a
	command bidefailtext            ; 9b
	command raisesubnoanim          ; 9c
	command lowersubnoanim          ; 9d
	command beatupfailtext          ; 9e
	command clearmissdamage         ; 9f
	command movedelay               ; a0
	command moveanim                ; a1 
	command tristatuschance         ; a2
	command supereffectivelooptext  ; a3
	command startloop               ; a4
	;command curl                   
	command uturn					; a5
	command starthail				; a6
	command blizzardaccuracy		; a7
	command bindmultiplier			; a8
	command poisongas				; a9
	command triattack				; aa
	command resistberry				; ab
DEF NUM_EFFECT_COMMANDS EQU const_value - 1

	const_def -1, -1
	command endmove                 ; ff
	command endturn                 ; fe
