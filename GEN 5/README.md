# Gen 5
## BW/B2W2
* RNG Info
* Wild/Static/Gift Info
* Breeding Info
* Roamer Pok�mon Info
* C-Gear Pok�mon & RNG Info
* IDs Info
* Pok�mon Info (Party/Box)

Source repo &amp; scripts by [Real96](https://github.com/Real96/PokeLua/tree/main/Gen%205)

* BWB2W2 LCRNG Advance Bot (named Chatot Chicanery)

Source repo &amp; scripts by [Unknown Warrior](https://github.com/Unknown-Warrior/LUA_Scripts)

* Pok�mon Info and Stats display for Speed-runners (commonly referred to as the 'Rainbow' lua)

Source repo &amp; scripts by [Martmists-GH](https://github.com/Martmists-GH/PokemonOverlay)

The scripts for each game provided in the main emulator folders have various modes you can cycle through, showcasing the most varied information for all kinds of RNG. The modes are titled appropriately depending on the type of RNG they are aimed at
* DeSmuMe Dev+ version required (0.9.11 x32 recommended)
* Bizhawk 2.9 or higher required (earlier versions not supported)
* An alternative (older) Pok�mon Stats view script is also included (launched by opening the non-extension file). This scripts is for DeSmuMe only
* Also provided are alternative layout versions for the RNG scripts. These edited scripts are inside the `SM Edits` folders and were made by SexyMalasada. These pictures show the differences in the layouts for [DeSmuMe](https://github.com/SexyMalasada/PokeRNG-Luas/blob/main/GEN%205/DeSmuMe/SM%20Edits/G5DesmumeLayout.png) &amp; [Bizhawk](https://github.com/SexyMalasada/PokeRNG-Luas/blob/main/GEN%205/BizHawk/SM%20Edits/G5BizhawkLayout.png)

## DPPtHGSS LCRNG Advance Bot (Chatot Chicanery) Instructions
This script consists of a simple Bot that auto-advances a predetermined number of LCRNG (also called PIDRNG) frames.

To use this bot start by opening the script and editing the number of advances you want it to do in ``local maxAdvances =``. It's best to be conservative and select a value a few dozen frames before your target one.

After the above is done load your game and RNG script, as well as the Chatot Chicanery script in a second Lua window. You must have 2 Chatot at the 2 last positions in your party with a Chatter already recorded. The Bot has 2 options: Pressing 9 changes the display text of the script between screens. Pressing 0 starts the Bot

To start the Bot properly, open the Summary view of the Chatot in the LAST slot of your Party. Press 0 to start the Bot. The display cyan text should list the number of advancements done and will say when it has finished! You can cross check this with your RNG script as well

An alternative version for Bizhawk without the screen change function, where the text is fixed to top screen is included, as this function has proved a bit buggy on this emulator

## Notes for DeSmuMe scripts
* Press the button `Restart` in the lua window every time you need to restart the game
* Pause the game every time you need to save or load a state and hold `Shift` + `F(n)`/`F(n)` (ex. `Shift` + `F1` to save a state in slot 1) for some seconds, until you see the message `Saved State (n)`/`Loaded State (n)` appearing on the screen for less than a second
