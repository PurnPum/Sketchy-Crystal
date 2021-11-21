# Pokémon Sketchy Crystal [![Build Status][ci-badge]][ci]

This is a ROM Hack based off of the disassembly of Pokémon Crystal.

It builds the following ROM:

- Pokemon - sketchycrystal.gbc `sha256: a2eef0c0f2a992fb85f0adb03a276b3958da044bcd78aeab101561ea467f27f5`

To set up the repository, see [INSTALL.md](INSTALL.md).

## Changes so far:

- Reduced TMs to only 2, Sketch and Rock Smash. Sketch is worth 1250. Rock Smash is worth 10.

- All Mons are now compatible with ALL TMs/HMs

- Mons only learn Struggle at Level 1, egg moves still exist.

- Odd Eggs no longer had a set moveset, its just Struggle.

- HM Moves no longer do anything in-battle (This includes the TM for Rock Smash)

- All Shops sell TMs for Sketch. In GoldenRod and Cerulean you have to go to the actual TM floor. Rock Smash is still avaliable.

- Gift Dratini no longer has moves other than Struggle.

- Sketch should have the highest priority in the game, higher than protect. Also it has 2 PP now.

- Changed Move Tutor so it only teaches Teleport

- Make TM price increase with badges. Every badge increases its price by 1250, so to calculate
	the price at certain point just do 1250 + 1250*AmountOfBadges

- Change enemy trainer teams so that they all use their usual moves.

	NOTE : 	- All rematches have been deleted
			- Any team that consisted exclusively of one mon repeated multiple times is now a single pokemon with higher level.

- Make sure TMs found in the Overworld and given by Gym Leaders work properly and are all Sketch.

## CURRENTLY DOING:

- Testing the initial release, looking for bugs.

## TODO:

- (Maybe) Add option to randomize encounters and/or trainer mons/attacks

## See also

- [**FAQ**](FAQ.md)
- [**Documentation**][docs]
- [**Wiki**][wiki] (includes [tutorials][tutorials])
- **Discord:** [pret][discord]
- **IRC:** [libera#pret][irc]

Other disassembly projects:

- [**Pokémon Red/Blue**][pokered]
- [**Pokémon Yellow**][pokeyellow]
- [**Pokémon Gold/Silver**][pokegold]
- [**Pokémon Pinball**][pokepinball]
- [**Pokémon TCG**][poketcg]
- [**Pokémon Ruby**][pokeruby]
- [**Pokémon FireRed**][pokefirered]
- [**Pokémon Emerald**][pokeemerald]

[pokered]: https://github.com/pret/pokered
[pokeyellow]: https://github.com/pret/pokeyellow
[pokegold]: https://github.com/pret/pokegold
[pokepinball]: https://github.com/pret/pokepinball
[poketcg]: https://github.com/pret/poketcg
[pokeruby]: https://github.com/pret/pokeruby
[pokefirered]: https://github.com/pret/pokefirered
[pokeemerald]: https://github.com/pret/pokeemerald
[docs]: https://pret.github.io/pokecrystal/
[wiki]: https://github.com/pret/pokecrystal/wiki
[tutorials]: https://github.com/pret/pokecrystal/wiki/Tutorials
[discord]: https://discord.gg/d5dubZ3
[irc]: https://web.libera.chat/?#pret
[ci]: https://github.com/pret/pokecrystal/actions
[ci-badge]: https://github.com/pret/pokecrystal/actions/workflows/main.yml/badge.svg
