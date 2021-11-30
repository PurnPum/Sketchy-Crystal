# Pokémon Sketchy Crystal [![Build Status][ci-badge]][ci]

This is a Challenge ROM Hack based off of the disassembly of Pokémon Crystal.

It builds the following ROM:

- Pokemon - sketchycrystal.gbc `sha256: eb23b53849f120ac499d8b44c4f232cb9834b9968247961452dede1007278ce1`

To set up the repository, see [INSTALL.md](INSTALL.md).

## What's the challenge in this ROM?

You have to build your team by stealing moves from enemy trainers, since wild pokemon
only know struggle.

You steal moves by teaching the move Sketch to your pokemon, by using the TMs that you find and buy
as you continue your journey.

HMs wont do anything in-battle, but every mon can learn them.

As you gain badges, the price of the Sketch TM will rise, so plan ahead and manage your money well.

Almost all teams are the same as in the original crystal, the only teams that are changed
are teams that only have 1 pokemon repeated multiple times. Those teams will now have a single
pokemon with a higher level. Rematches are also disabled.

Good Luck!

## Known issues:

~~- Some trainers of the same class may be misplaced with incorrect teams, for example the birdkeeper at the
end of route 32 has a level 34 farfetch'd. That trainer isn't meant to have that team.~~ Fixed in v0.1.0

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

	`All rematches have been deleted`
	`Any team that consisted exclusively of one mon repeated multiple times is now a single pokemon with higher level.`

- Make sure TMs found in the Overworld and given by Gym Leaders work properly and are all Sketch.

- Make Sketch not work in the Battle Tower.

- Add a move that replaces Surf that works in battles.

- Remove 25% chance for the AI to miss.

- Remove Trade requirement for trade evolutions.

	`Kadabra now evolves at level 36`
	`Machoke now evolves at level 42`
	`Graveler now evolves at level 38`
	`Haunter now evolves at level 40`
	`Slowpoke evolves into Slowking when using the King's Rock on it.`
	`Onix evolves when using the Metal Coat on it.`
	`Seadra evolves when using the Dragon Scale on it.`
	`Scyther evolves when using the Metal Coat on it.`
	`Poliwhirl evolves into Politoed when using the King's Rock on it.`
	`Porygon evolves when using the Up-Grade on it.`
	
- Increased the likehood to 25% (from typically 2%) of certain wild pokemon holding trade evolution items:

	`Dratini, Dragonair, Dragonite, Horsea, Seadra and Kingdra holding a Dragon Scale`
	`Magnemite, Magneton and Steelix holding a Metal Coat`
	`Politoed, Poliwhirl, Poliwrath, Slowpoke, Slowbro and Slowking holding a King's Rock`
	
## CURRENTLY DOING:

- Testing the initial release, looking for bugs.

## TODO:

- Remove not being able to forget HM moves.

- Fix as many documented bugs from the original code as possible.

- (Maybe) Add option to randomize encounters and/or trainer mons/attacks.

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
