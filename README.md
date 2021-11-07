# Pokémon Sketchy Crystal [![Build Status][ci-badge]][ci]

This is a ROM Hack based off of the disassembly of Pokémon Crystal.

It will eventually build the following ROM:

- Pokemon - Sketchy Crystal.gbc `sha1: TBD`

To set up the repository, see [INSTALL.md](INSTALL.md).

## Changes so far:

- Reduced TMs to only 2, Sketch and Rock Smash. Sketch is worth 1250. Rock Smash is worth 10.

- All Mons are now compatible with ALL TMs/HMs

- Mons only learn Struggle at Level 1, egg moves still exist.

- Odd Eggs no longer had a set moveset, its just Struggle.

- HM Moves no longer do anything in-battle (This includes the TM for Rock Smash)

- All Shops sell TMs for Sketch. In GoldenRod and Cerulean you have to go to the actual TM floor. Rock Smash is still avaliable.

- Gift Dratini no longer has moves other than Struggle.

## TODO:

- Make TM price increase with badges
- Change enemy trainer teams so that they all use normal moves.
- Change Potion on the PC to be a Sketch TM
- Try to make Sketch a priority move.
- (Maybe) Add option to randomize encounters and/or trainer mons/attacks

## See also

- [**FAQ**](FAQ.md)
- [**Documentation**][docs]
- [**Wiki**][wiki] (includes [tutorials][tutorials])
- [**Symbols**][symbols]
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
[symbols]: https://github.com/pret/pokecrystal/tree/symbols
[discord]: https://discord.gg/d5dubZ3
[irc]: https://web.libera.chat/?#pret
[ci]: https://github.com/pret/pokecrystal/actions
[ci-badge]: https://github.com/pret/pokecrystal/actions/workflows/main.yml/badge.svg
