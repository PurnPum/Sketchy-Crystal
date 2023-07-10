MoveTextMatches:
	table_width 12, MoveTextMatches
; POUND
	dw AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; KARATE_CHOP
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.karate_chop,  AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; DOUBLE_SLAP
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.double_hit,  AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; COMET_PUNCH
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.multi_hit1,  MoveExtraInfoTexts.multi_hit2, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; MEGA_PUNCH
	dw AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; LEAF_STORM
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.lower_self_spattack, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; FIRE_PUNCH
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.burn, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; ICE_PUNCH
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.freeze, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; THUNDERPUNCH
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.paralysis, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; SCRATCH
	dw AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; VICE_GRIP
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.flinch, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; BULLDOZE
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.lower_speed, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; RAZOR_WIND
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.razor_wind1, MoveExtraInfoTexts.razor_wind2, MoveExtraInfoTexts.razor_wind3, AuxEmptyString, AuxEmptyString,
; WILD_CHARGE
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.recoil1, MoveExtraInfoTexts.recoil2, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; CUT
	dw AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; GUST
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.twistergust1, MoveExtraInfoTexts.twistergust2, MoveExtraInfoTexts.twistergust3, AuxEmptyString, AuxEmptyString,
; WING_ATTACK
	dw AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; WHIRLWIND
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.force_switch1, MoveMainEffectsTexts.force_switch2, MoveMainEffectsTexts.force_switch3, MoveMainTexts.extra_info, MoveExtraInfoTexts.force_switch_fail,
; FLY
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.semi_invul1, MoveExtraInfoTexts.semi_invul2, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; BIND
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.bind1, MoveExtraInfoTexts.bind2, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; OVERHEAT
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.lower_self_spattack, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; VINE_WHIP
	dw AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; STOMP
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.flinch, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; DOUBLE_KICK
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.double_hit,  AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; MEGA_KICK
	dw AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; JUMP_KICK
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.crash_damage1, MoveExtraInfoTexts.crash_damage2, MoveExtraInfoTexts.crash_damage3, AuxEmptyString, AuxEmptyString,
; ROLLING_KICK
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.flinch, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; LUNGE
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.recoil1, MoveExtraInfoTexts.recoil2, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; HEADBUTT
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.flinch, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; HORN_ATTACK
	dw AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; FURY_ATTACK
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.triplekick1, MoveExtraInfoTexts.triplekick2, MoveExtraInfoTexts.triplekick3, AuxEmptyString, AuxEmptyString,
; UTURN
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.uturn1, MoveExtraInfoTexts.uturn2, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; TACKLE
	dw AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; BODY_SLAM
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.paralysis, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; WRAP
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.traps, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; TAKE_DOWN
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.recoil1, MoveExtraInfoTexts.recoil2, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; THRASH
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.rampage1, MoveExtraInfoTexts.rampage2, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; DOUBLE_EDGE
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.lower_self_attack, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; TAIL_WHIP
	dw MoveMainTexts.main_effect, MoveExtraEffectsTexts.lower_defense, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; POISON_STING
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.poison, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; TWINEEDLE
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.poison, MoveMainTexts.effect_chance, MoveMainTexts.extra_info, MoveExtraInfoTexts.twineedle1, MoveExtraInfoTexts.twineedle2,
; PIN_MISSILE
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.multi_hit1,  MoveExtraInfoTexts.multi_hit2, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; LEER
	dw MoveMainTexts.main_effect, MoveExtraEffectsTexts.lower_defense, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; BITE
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.flinch, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; GROWL
	dw MoveMainTexts.main_effect, MoveExtraEffectsTexts.lower_attack, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; ROAR
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.force_switch1, MoveMainEffectsTexts.force_switch2, MoveMainEffectsTexts.force_switch3, MoveMainTexts.extra_info, MoveExtraInfoTexts.force_switch_fail,
; DRAGON_RUSH
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.recoil1, MoveExtraInfoTexts.recoil2, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; SUPERSONIC
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.confusion, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; HAIL
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.weather1, MoveMainEffectsTexts.hail, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; DISABLE
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.disable1, MoveMainEffectsTexts.disable2, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; ACID
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.lower_defense, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; EMBER
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.burn, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; FLAMETHROWER
	dw AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; MIST
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.mist1, MoveMainEffectsTexts.mist2, MoveMainEffectsTexts.mist3, AuxEmptyString, AuxEmptyString,
; WATER_GUN
	dw AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; HYDRO_PUMP
	dw AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; SURF
	dw AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; ICE_BEAM
	dw AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; BLIZZARD
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.freeze, MoveMainTexts.effect_chance, MoveMainTexts.extra_info, MoveExtraInfoTexts.blizzard, AuxEmptyString,
; PSYBEAM
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.confusion, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; BUBBLEBEAM
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.lower_speed, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; AURORA_BEAM
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.lower_attack, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; HYPER_BEAM
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.hyper_beam1, MoveExtraInfoTexts.hyper_beam2, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; PECK
	dw AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; DRILL_PECK
	dw AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; SUBMISSION
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.recoil1, MoveExtraInfoTexts.recoil2, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; LOW_KICK
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.flinch, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; COUNTER
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.counter1, MoveMainEffectsTexts.counter2, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; SEISMIC_TOSS
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.seismictoss_nightshade1, MoveExtraInfoTexts.seismictoss_nightshade2, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; STRENGTH
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.recoil1, MoveExtraInfoTexts.recoil2, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; ABSORB
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.leech1, MoveExtraInfoTexts.leech2, MoveExtraInfoTexts.leech3, AuxEmptyString, AuxEmptyString,
; MEGA_DRAIN
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.leech1, MoveExtraInfoTexts.leech2, MoveExtraInfoTexts.leech3, AuxEmptyString, AuxEmptyString,
; LEECH_SEED
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.leechseed1, MoveMainEffectsTexts.leechseed2, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; DRAGON_CLAW
	dw AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; RAZOR_LEAF
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.high_crit, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; SOLARBEAM
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.solar_beam1, MoveExtraInfoTexts.solar_beam2, MoveExtraInfoTexts.solar_beam3, AuxEmptyString, AuxEmptyString,
; POISONPOWDER
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.poison, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; STUN_SPORE
	dw MoveMainTexts.main_effect, MoveExtraEffectsTexts.paralysis, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; ENERGY_BALL
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.lower_spdefense, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; PETAL_DANCE
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.rampage1, MoveExtraInfoTexts.rampage2, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; STRING_SHOT
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.lower_speed2, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; WIDE_BREAKER
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.lower_attack, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; FIRE_SPIN
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.traps, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; THUNDERSHOCK
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.paralysis, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; THUNDERBOLT
	dw AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; THUNDER_WAVE
	dw MoveMainTexts.main_effect, MoveExtraEffectsTexts.paralysis, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; THUNDER
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.paralysis, MoveMainTexts.effect_chance, MoveMainTexts.extra_info, MoveExtraInfoTexts.thunder1, MoveExtraInfoTexts.thunder2,
; ROCK_THROW
	dw AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; EARTHQUAKE
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.earthquake1, MoveExtraInfoTexts.earthquake2, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; SHADOW_CLAW
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.high_crit, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; DIG
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.semi_invul1, MoveExtraInfoTexts.semi_invul2, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; TOXIC
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.toxic1, MoveMainEffectsTexts.toxic2, MoveMainEffectsTexts.toxic3, MoveMainEffectsTexts.toxic4, AuxEmptyString,
; CONFUSION
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.confusion, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; PSYCHIC_M
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.lower_spdefense, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; EXTRASENSORY
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.flinch, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; PSYCHO_BOOST
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.lower_self_spattack, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; FLASH_CANNON
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.lower_defense, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; QUICK_ATTACK
	dw AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; RAGE
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.rage1, MoveExtraInfoTexts.rage2, MoveExtraInfoTexts.rage3, AuxEmptyString, AuxEmptyString,
; TELEPORT
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.teleport1, MoveMainEffectsTexts.teleport2, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; NIGHT_SHADE
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.seismictoss_nightshade1, MoveExtraInfoTexts.seismictoss_nightshade2, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; MIMIC
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.mimic1, MoveMainEffectsTexts.mimic2, MoveMainEffectsTexts.mimic3, AuxEmptyString, AuxEmptyString,
; SCREECH
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.lower_defense2, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; ICE_SHARD
	dw AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; RECOVER
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.normal_heal1, MoveMainEffectsTexts.normal_heal2, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; DRILL_RUN
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.high_crit, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; AQUA_JET
	dw AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; POWER_TRIP
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.rampage1, MoveExtraInfoTexts.rampage2, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; CONFUSE_RAY
	dw MoveMainTexts.main_effect, MoveExtraEffectsTexts.confusion, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; MAGNET_BOMB
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.bypass_protect1, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; BULLET_PUNCH
	dw AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; POWER_GEM
	dw AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; LIGHT_SCREEN
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.lightscreen1, MoveMainEffectsTexts.screen2, MoveMainEffectsTexts.screen3, AuxEmptyString, AuxEmptyString,
; HAZE
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.haze, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; REFLECT
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.reflect1, MoveMainEffectsTexts.screen2, MoveMainEffectsTexts.screen3, AuxEmptyString, AuxEmptyString,
; FOCUS_ENERGY
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.focus_energy, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; BIDE
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.bide1, MoveMainEffectsTexts.bide2, MoveMainEffectsTexts.bide3, AuxEmptyString, AuxEmptyString,
; METRONOME
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.metronome, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; MIRROR_MOVE
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.mirror_move1, MoveMainEffectsTexts.mirror_move2, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; SELFDESTRUCT
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.self_destruct1, MoveExtraInfoTexts.self_destruct2, MoveExtraInfoTexts.self_destruct3, AuxEmptyString, AuxEmptyString,
; EGG_BOMB
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.recoil1, MoveExtraInfoTexts.recoil2, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; LICK
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.paralysis, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; SMOG
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.smog1, MoveExtraInfoTexts.smog2, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; SLUDGE
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.poison, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; BONE_CLUB
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.flinch, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; FIRE_BLAST
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.burn, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; WATERFALL
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.flinch, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; CLAMP
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.traps, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; SWIFT
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.bypass_protect1, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; CRYOGENICE
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.weather_heal_hail1, MoveMainEffectsTexts.weather_heal_hail2, MoveMainEffectsTexts.weather_heal_hail3, AuxEmptyString, AuxEmptyString,
; SPIKE_CANNON
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.multi_hit1,  MoveExtraInfoTexts.multi_hit2, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; CONSTRICT
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.lower_speed, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; ROCK_WRECKER
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.lower_self_attack, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; METEOR_MASH
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.recoil1, MoveExtraInfoTexts.recoil2, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; SOFTBOILED
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.normal_heal1, MoveMainEffectsTexts.normal_heal2, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; HI_JUMP_KICK
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.crash_damage1, MoveExtraInfoTexts.crash_damage2, MoveExtraInfoTexts.crash_damage3, AuxEmptyString, AuxEmptyString,
; GLARE
	dw MoveMainTexts.main_effect, MoveExtraEffectsTexts.paralysis, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; DREAM_EATER
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.dream_eater1, MoveExtraInfoTexts.dream_eater2, MoveExtraInfoTexts.leech1, MoveExtraInfoTexts.leech2, MoveExtraInfoTexts.leech3,
; POISON_GAS
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.poison_gas, MoveMainTexts.effect_chance, MoveMainTexts.extra_info, MoveExtraInfoTexts.poison_gas1, MoveExtraInfoTexts.poison_gas2,
; BARRAGE
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.multi_hit1,  MoveExtraInfoTexts.multi_hit2, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; LEECH_LIFE
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.leech1, MoveExtraInfoTexts.leech2, MoveExtraInfoTexts.leech3, AuxEmptyString, AuxEmptyString,
; ACCELEROCK
	dw AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; SKY_ATTACK
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.lower_self_attack, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; MUD_SHOT
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.lower_spattack, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; BUBBLE
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.lower_speed, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; DIZZY_PUNCH
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.confusion, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; BI_WINGBEAT
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.double_hit,  AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; FLASH
	dw MoveMainTexts.main_effect, MoveExtraEffectsTexts.lower_spattack, MoveExtraEffectsTexts.lower_spdefense, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; LIFE_DEW
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.weather_heal_rain1, MoveMainEffectsTexts.weather_heal_rain2, MoveMainEffectsTexts.weather_heal_rain3, AuxEmptyString, AuxEmptyString,
; STEEL_BEAM
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.lower_self_attack, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; POISON_JAB
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.poison, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; HYDRO_CANNON
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.lower_self_spattack, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; EXPLOSION
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.explosion, MoveExtraInfoTexts.self_destruct3, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; FURY_SWIPES
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.multi_hit1,  MoveExtraInfoTexts.multi_hit2, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; BONEMERANG
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.double_hit,  AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; REST
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.rest1, MoveMainEffectsTexts.rest2, MoveMainEffectsTexts.rest3, AuxEmptyString, AuxEmptyString,
; ROCK_SLIDE
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.flinch, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; HYPER_FANG
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.flinch, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; FLARE_BLITZ
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.recoil1, MoveExtraInfoTexts.recoil2, MoveExtraInfoTexts.defrost, AuxEmptyString, AuxEmptyString,
; CONVERSION
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.conversion1, MoveMainEffectsTexts.conversion2, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; TRI_ATTACK
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.tri_attack1, MoveExtraInfoTexts.tri_attack2, MoveExtraInfoTexts.tri_attack3, AuxEmptyString, AuxEmptyString,
; SUPER_FANG
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.super_fang1, MoveMainEffectsTexts.super_fang2, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; SLASH
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.high_crit, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; SUBSTITUTE
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.substitute1, MoveMainEffectsTexts.substitute2, MoveMainEffectsTexts.substitute3, MoveMainEffectsTexts.substitute4, MoveMainEffectsTexts.substitute5,
; STRUGGLE
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.struggle1, MoveExtraInfoTexts.struggle2, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; SKETCH
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.sketch1, MoveMainEffectsTexts.sketch2, MoveMainEffectsTexts.sketch3, AuxEmptyString, AuxEmptyString,
; TRIPLE_KICK
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.triplekick1, MoveExtraInfoTexts.triplekick2, MoveExtraInfoTexts.triplekick3, MoveExtraInfoTexts.triplekick4, AuxEmptyString,
; DARK_PULSE
	dw AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; SPIDER_WEB
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.traps, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; MIND_READER
	dw MoveMainTexts.main_effect, MoveExtraEffectsTexts.increase_self_accuracy, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; NIGHTMARE
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.nightmare1, MoveMainEffectsTexts.nightmare2, MoveMainEffectsTexts.nightmare3, AuxEmptyString, AuxEmptyString,
; FLAME_WHEEL
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.burn, MoveMainTexts.effect_chance, MoveMainTexts.extra_info, MoveExtraInfoTexts.defrost, AuxEmptyString,
; SNORE
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.snore1, MoveExtraInfoTexts.snore2, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; SHADOW_SNEAK
	dw AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; FLAIL
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.reversalflail1, MoveExtraInfoTexts.reversalflail2, MoveExtraInfoTexts.reversalflail3, AuxEmptyString, AuxEmptyString,
; CONVERSION2
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.conversion_21, MoveMainEffectsTexts.conversion_22, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; AEROBLAST
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.high_crit, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; COTTON_SPORE
	dw MoveMainTexts.main_effect, MoveExtraEffectsTexts.lower_speed, MoveExtraEffectsTexts.lower_attack, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; REVERSAL
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.reversalflail1, MoveExtraInfoTexts.reversalflail2, MoveExtraInfoTexts.reversalflail3, AuxEmptyString, AuxEmptyString,
; SPITE
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.spite1, MoveMainEffectsTexts.spite2, MoveMainEffectsTexts.spite3, AuxEmptyString, AuxEmptyString,
; POWDER_SNOW
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.freeze, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; PROTECT
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.protect1, MoveMainEffectsTexts.protect2, MoveMainEffectsTexts.protect3, MoveMainEffectsTexts.protect4, MoveMainEffectsTexts.protect5,
; MACH_PUNCH
	dw AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; SCARY_FACE
	dw MoveMainTexts.main_effect, MoveExtraEffectsTexts.lower_speed, MoveExtraEffectsTexts.lower_spattack, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; FAINT_ATTACK
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.bypass_protect1, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; SWEET_KISS
	dw MoveMainTexts.main_effect, MoveExtraEffectsTexts.confusion, MoveExtraEffectsTexts.lower_attack, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; TRIPLE_AXEL
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.triplekick1, MoveExtraInfoTexts.triplekick2, MoveExtraInfoTexts.triplekick3, AuxEmptyString, AuxEmptyString,
; SLUDGE_BOMB
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.poison, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; MUD_SLAP
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.lower_speed, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; OCTAZOOKA
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.lower_attack, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; SPIKES
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.spikes1, MoveMainEffectsTexts.spikes2, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; ZAP_CANNON
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.paralysis, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; FORESIGHT
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.foresight1, MoveMainEffectsTexts.foresight2, MoveMainEffectsTexts.foresight3, AuxEmptyString, AuxEmptyString,
; DESTINY_BOND
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.dbond1, MoveMainEffectsTexts.dbond2, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; PERISH_SONG
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.perish_song1, MoveMainEffectsTexts.perish_song2, MoveMainEffectsTexts.perish_song3, AuxEmptyString, AuxEmptyString,
; ICY_WIND
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.lower_speed, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; DETECT
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.protect1, MoveMainEffectsTexts.protect2, MoveMainEffectsTexts.protect3, MoveMainEffectsTexts.protect4, MoveMainEffectsTexts.protect5,
; MUD_BOMB
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.lower_spattack, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; LOCK_ON
	dw MoveMainTexts.main_effect, MoveExtraEffectsTexts.increase_self_accuracy, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; OUTRAGE
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.rampage1, MoveExtraInfoTexts.rampage2, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; SANDSTORM
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.weather1, MoveMainEffectsTexts.sandstorm, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; GIGA_DRAIN
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.leech1, MoveExtraInfoTexts.leech2, MoveExtraInfoTexts.leech3, AuxEmptyString, AuxEmptyString,
; DETECT
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.endure1, MoveMainEffectsTexts.endure2, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; CHARM
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.lower_attack2, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; ROLLOUT
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.rollout1, MoveExtraInfoTexts.rollout2, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; FALSE_SWIPE
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.false_swipe1, MoveExtraInfoTexts.false_swipe2, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; X_SCISSOR
	dw AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; MILK_DRINK
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.normal_heal1, MoveMainEffectsTexts.normal_heal2, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; SPARK
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.paralysis, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; FURY_CUTTER
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.fury_cutter1, MoveExtraInfoTexts.fury_cutter2, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; STEEL_WING
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.increase_self_defense, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; MEAN_LOOK
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.traps, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; ATTRACT
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.attract1, MoveMainEffectsTexts.attract2, MoveMainEffectsTexts.attract3, AuxEmptyString, AuxEmptyString,
; SLEEP_TALK
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.sleep_talk1, MoveMainEffectsTexts.sleep_talk2, MoveMainEffectsTexts.sleep_talk3, AuxEmptyString, AuxEmptyString,
; HEAL_BELL
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.heal_bell1, MoveMainEffectsTexts.heal_bell2, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; POLTERGEIST
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.poltergeist1, MoveExtraInfoTexts.poltergeist2, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; SHORE_UP
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.weather_heal_sandstorm1, MoveMainEffectsTexts.weather_heal_sandstorm2, MoveMainEffectsTexts.weather_heal_sandstorm3, AuxEmptyString, AuxEmptyString,
; CROSS_POISON
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.recoil1, MoveExtraInfoTexts.recoil2, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; SAFEGUARD
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.safeguard1, MoveMainEffectsTexts.safeguard2, MoveMainEffectsTexts.safeguard3, AuxEmptyString, AuxEmptyString,
; PAIN_SPLIT
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.pain_split1, MoveMainEffectsTexts.pain_split2, MoveMainEffectsTexts.pain_split3, AuxEmptyString, AuxEmptyString,
; SACRED_FIRE
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.burn, MoveMainTexts.effect_chance, MoveMainTexts.extra_info, MoveExtraInfoTexts.defrost, AuxEmptyString,
; DISCHARGE
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.paralysis, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; DYNAMIC_PUNCH
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.confusion, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; MEGAHORN
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.lower_self_attack, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; DRAGONBREATH
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.paralysis, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; BATON_PASS
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.batton_pass1, MoveMainEffectsTexts.batton_pass2, MoveMainEffectsTexts.batton_pass3, AuxEmptyString, AuxEmptyString,
; ENCORE
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.encore1, MoveMainEffectsTexts.encore2, MoveMainEffectsTexts.encore3, AuxEmptyString, AuxEmptyString,
; PURSUIT
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.pursuit1, MoveExtraInfoTexts.pursuit2, MoveExtraInfoTexts.pursuit3, AuxEmptyString, AuxEmptyString,
; RAPID_SPIN
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.rapid_spin1, MoveExtraInfoTexts.rapid_spin2, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; SWEET_SCENT
	dw MoveMainTexts.main_effect, MoveExtraEffectsTexts.lower_speed, MoveExtraEffectsTexts.lower_evasiveness, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; IRON_TAIL
	dw AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; METAL_CLAW
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.high_crit, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; VITAL_THROW
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.bypass_protect1, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; MORNING_SUN
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.weather_heal_sun1, MoveMainEffectsTexts.weather_heal_sun2, MoveMainEffectsTexts.weather_heal_sun3, AuxEmptyString, AuxEmptyString,
; SYNTHESIS
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.weather_heal_sun1, MoveMainEffectsTexts.weather_heal_sun2, MoveMainEffectsTexts.weather_heal_sun3, AuxEmptyString, AuxEmptyString,
; MOONLIGHT
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.weather_heal_sun1, MoveMainEffectsTexts.weather_heal_sun2, MoveMainEffectsTexts.weather_heal_sun3, AuxEmptyString, AuxEmptyString,
; HIDDEN_POWER
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.hidden_power1, MoveExtraInfoTexts.hidden_power2, MoveExtraInfoTexts.hidden_power3, AuxEmptyString, AuxEmptyString,
; CROSS_CHOP
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.high_crit, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; TWISTER
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.twistergust1, MoveExtraInfoTexts.twistergust2, MoveExtraInfoTexts.twistergust3, AuxEmptyString, AuxEmptyString,
; RAIN_DANCE
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.weather1, MoveMainEffectsTexts.rain_dance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; SUNNY_DAY
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.weather1, MoveMainEffectsTexts.sunny_day, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; CRUNCH
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.lower_spdefense, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; MIRROR_COAT
	dw MoveMainTexts.main_effect, MoveMainEffectsTexts.mirror_coat1, MoveMainEffectsTexts.counter2, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; GUNK_SHOT
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.lower_self_attack, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; EXTREMESPEED
	dw AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; ANCIENTPOWER
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.omniboost, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; SHADOW_BALL
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.lower_defense, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; FUTURE_SIGHT
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.future_sight1, MoveExtraInfoTexts.future_sight2, MoveExtraInfoTexts.typeless1, MoveExtraInfoTexts.typeless2, AuxEmptyString,
; ROCK_SMASH
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.lower_defense, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; WHIRLPOOL
	dw MoveMainTexts.effect, MoveExtraEffectsTexts.traps, MoveMainTexts.effect_chance, AuxEmptyString, AuxEmptyString, AuxEmptyString,
; BEAT_UP
	dw MoveMainTexts.extra_info, MoveExtraInfoTexts.beat_up1, MoveExtraInfoTexts.beat_up2, MoveExtraInfoTexts.typeless1, MoveExtraInfoTexts.typeless2, AuxEmptyString,
	assert_table_length NUM_ATTACKS
	