# Gen 1
## RBG/Y
* Gift Bot
* Static Bot
* Fishing Bot
* In-Game Trade Bot
* TID Bot
* Party Pokémon Info checking

Source repo &amp; unified script by [Real96](https://github.com/Real96/PokeLua/tree/main/Gen%201). Original code &amp; scripts by [zep715](https://github.com/zep715/rbylua)

This script is an all-in-one version of zep715's original ones, created by Real96
* VBA 23.6 RR version required (LRC4 works too)
* Bizhawk 2.8 required (2.9 not supported yet)

These Bots simply hunt for any combo of DVs that makes the Pokémon shiny. They work by making a save state that they then restore to if no match is found; you'll see this happening in your emulator's screen. Once a match is found the emulator is paused.

To start any of the Bots simply place yourself at the required final screen (as referred below) and press SELECT

## Gift
Pokémon is generated after the nickname prompt (Y/N)

The final screen is: Put the cursor over "no" (nicknames not yet supported) and run the Bot (Press Select)

Valid for: Starters, Fossils, Gifts and Game Corner prizes

## Static
Pokémon is generated as soon as the battle starts

The final screen is: Interact with the Pokémon and stop at their cry text (before the last A press to initiate the battle) and run the Bot (Press Select)

Valid for: Snorlax, Zapdos, Articuno, Moltres, Mewtwo, Electrode/Voltorb in Power Plant.

## Fishing
The Species is generated first, and the IVs right after

Edit the script for the desired species index number at ``local botTargetFishingSpecies =``. Index numbers can be found here: https://bulbapedia.bulbagarden.net/wiki/List_of_Pok%C3%A9mon_by_index_number_(Generation_I)

The final screen is: Select your rod, put cursor over "Use" and run the Bot (Press Select)

## In-Game Trade

Pokemon is generated as soon as the trade starts

The final screen is: Stop at the last A press before the trade starts; This is before the 'Connecting Link Cable' text box. Run the Bot (Press Select)

## TID
The TID is generated immediately after pressing 'New Game'

Edit the script for the desired TIDs at ``local botTargetTIDs =`` in decimal.

The final screen is: Place the cursor over 'New Game' at the main screen and run the Bot (Press Select)

## Party Pokémon Info
This script (not a bot) will show on-screen what nature your party Pokémon will have (and shininess) when transferred through PokéTransporter

Nature is based on experience points, so gaining experience points will change nature. You can find a detailed table of what experience values translate to each natures [here](https://www.pokemonrng.com/misc-3ds-transporter-nature-tables)