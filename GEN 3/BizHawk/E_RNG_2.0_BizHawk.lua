read32Bit = memory.read_u32_le
read16Bit = memory.read_u16_le
read8Bit = memory.readbyte
memoryWriteCheck = event.onmemorywrite
rshift = bit.rshift
lshift = bit.lshift
bxor = bit.bxor
band = bit.band
floor = math.floor
sqrt = math.sqrt

local natureNamesList = {
  "Hardy", "Lonely", "Brave", "Adamant", "Naughty",
  "Bold", "Docile", "Relaxed", "Impish", "Lax",
  "Timid", "Hasty", "Serious", "Jolly", "Naive",
  "Modest", "Mild", "Quiet", "Bashful", "Rash",
  "Calm", "Gentle", "Sassy", "Careful", "Quirky" }

local HPTypeNamesList = {
  "Fighting", "Flying", "Poison", "Ground",
  "Rock", "Bug", "Ghost", "Steel",
  "Fire", "Water", "Grass", "Electric",
  "Psychic", "Ice", "Dragon", "Dark" }

local speciesNamesList = {
  -- Gen 1
  "Bulbasaur", "Ivysaur", "Venusaur", "Charmander", "Charmeleon", "Charizard", "Squirtle", "Wartortle", "Blastoise",
  "Caterpie", "Metapod", "Butterfree", "Weedle", "Kakuna", "Beedrill", "Pidgey", "Pidgeotto", "Pidgeot", "Rattata",
  "Raticate", "Spearow", "Fearow", "Ekans", "Arbok", "Pikachu", "Raichu", "Sandshrew", "Sandslash", "Nidoran♀",
  "Nidorina", "Nidoqueen", "Nidoran♂", "Nidorino", "Nidoking", "Clefairy", "Clefable", "Vulpix", "Ninetales",
  "Jigglypuff", "Wigglytuff", "Zubat", "Golbat", "Oddish", "Gloom", "Vileplume", "Paras", "Parasect", "Venonat",
  "Venomoth", "Diglett", "Dugtrio", "Meowth", "Persian", "Psyduck", "Golduck", "Mankey", "Primeape", "Growlithe",
  "Arcanine", "Poliwag", "Poliwhirl", "Poliwrath", "Abra", "Kadabra", "Alakazam", "Machop", "Machoke", "Machamp",
  "Bellsprout", "Weepinbell", "Victreebel", "Tentacool", "Tentacruel", "Geodude", "Graveler", "Golem", "Ponyta",
  "Rapidash", "Slowpoke", "Slowbro", "Magnemite", "Magneton", "Farfetch'd", "Doduo", "Dodrio", "Seel", "Dewgong",
  "Grimer", "Muk", "Shellder", "Cloyster", "Gastly", "Haunter", "Gengar", "Onix", "Drowzee", "Hypno", "Krabby",
  "Kingler", "Voltorb", "Electrode", "Exeggcute", "Exeggutor", "Cubone", "Marowak", "Hitmonlee", "Hitmonchan",
  "Lickitung", "Koffing", "Weezing", "Rhyhorn", "Rhydon", "Chansey", "Tangela", "Kangaskhan", "Horsea", "Seadra",
  "Goldeen", "Seaking", "Staryu", "Starmie", "Mr. Mime", "Scyther", "Jynx", "Electabuzz", "Magmar", "Pinsir", "Tauros",
  "Magikarp", "Gyarados", "Lapras", "Ditto", "Eevee", "Vaporeon", "Jolteon", "Flareon", "Porygon", "Omanyte", "Omastar",
  "Kabuto", "Kabutops", "Aerodactyl", "Snorlax", "Articuno", "Zapdos", "Moltres", "Dratini", "Dragonair", "Dragonite",
  "Mewtwo", "Mew",
  -- Gen 2
  "Chikorita", "Bayleef", "Meganium", "Cyndaquil", "Quilava", "Typhlosion", "Totodile", "Croconaw", "Feraligatr",
  "Sentret", "Furret", "Hoothoot", "Noctowl", "Ledyba", "Ledian", "Spinarak", "Ariados", "Crobat", "Chinchou", "Lanturn",
  "Pichu", "Cleffa", "Igglybuff", "Togepi", "Togetic", "Natu", "Xatu", "Mareep", "Flaaffy", "Ampharos", "Bellossom",
  "Marill", "Azumarill", "Sudowoodo", "Politoed", "Hoppip", "Skiploom", "Jumpluff", "Aipom", "Sunkern", "Sunflora",
  "Yanma", "Wooper", "Quagsire", "Espeon", "Umbreon", "Murkrow", "Slowking", "Misdreavus", "Unown", "Wobbuffet",
  "Girafarig", "Pineco", "Forretress", "Dunsparce", "Gligar", "Steelix", "Snubbull", "Granbull", "Qwilfish", "Scizor",
  "Shuckle", "Heracross", "Sneasel", "Teddiursa", "Ursaring", "Slugma", "Magcargo", "Swinub", "Piloswine", "Corsola",
  "Remoraid", "Octillery", "Delibird", "Mantine", "Skarmory", "Houndour", "Houndoom", "Kingdra", "Phanpy", "Donphan",
  "Porygon2", "Stantler", "Smeargle", "Tyrogue", "Hitmontop", "Smoochum", "Elekid", "Magby", "Miltank", "Blissey",
  "Raikou", "Entei", "Suicune", "Larvitar", "Pupitar", "Tyranitar", "Lugia", "Ho-Oh", "Celebi",
  -- Gen 3
  "Treecko", "Grovyle", "Sceptile", "Torchic", "Combusken", "Blaziken", "Mudkip", "Marshtomp", "Swampert", "Poochyena",
  "Mightyena", "Zigzagoon", "Linoone", "Wurmple", "Silcoon", "Beautifly", "Cascoon", "Dustox", "Lotad", "Lombre",
  "Ludicolo",
  "Seedot", "Nuzleaf", "Shiftry", "Taillow", "Swellow", "Wingull", "Pelipper", "Ralts", "Kirlia", "Gardevoir", "Surskit",
  "Masquerain", "Shroomish", "Breloom", "Slakoth", "Vigoroth", "Slaking", "Nincada", "Ninjask", "Shedinja", "Whismur",
  "Loudred", "Exploud", "Makuhita", "Hariyama", "Azurill", "Nosepass", "Skitty", "Delcatty", "Sableye", "Mawile", "Aron",
  "Lairon", "Aggron", "Meditite", "Medicham", "Electrike", "Manectric", "Plusle", "Minun", "Volbeat", "Illumise",
  "Roselia",
  "Gulpin", "Swalot", "Carvanha", "Sharpedo", "Wailmer", "Wailord", "Numel", "Camerupt", "Torkoal", "Spoink", "Grumpig",
  "Spinda", "Trapinch", "Vibrava", "Flygon", "Cacnea", "Cacturne", "Swablu", "Altaria", "Zangoose", "Seviper",
  "Lunatone",
  "Solrock", "Barboach", "Whiscash", "Corphish", "Crawdaunt", "Baltoy", "Claydol", "Lileep", "Cradily", "Anorith",
  "Armaldo",
  "Feebas", "Milotic", "Castform", "Kecleon", "Shuppet", "Banette", "Duskull", "Dusclops", "Tropius", "Chimecho",
  "Absol",
  "Wynaut", "Snorunt", "Glalie", "Spheal", "Sealeo", "Walrein", "Clamperl", "Huntail", "Gorebyss", "Relicanth",
  "Luvdisc",
  "Bagon", "Shelgon", "Salamence", "Beldum", "Metang", "Metagross", "Regirock", "Regice", "Registeel", "Latias",
  "Latios",
  "Kyogre", "Groudon", "Rayquaza", "Jirachi", "Deoxys" }

local abilityNamesList = {
  "Stench", "Drizzle", "Speed Boost", "Battle Armor", "Sturdy", "Damp", "Limber",
  "Sand Veil", "Static", "Volt Absorb", "Water Absorb", "Oblivious", "Cloud Nine",
  "Compound Eyes", "Insomnia", "Color Change", "Immunity", "Flash Fire",
  "Shield Dust", "Own Tempo", "Suction Cups", "Intimidate", "Shadow Tag",
  "Rough Skin", "Wonder Guard", "Levitate", "Effect Spore", "Synchronize",
  "Clear Body", "Natural Cure", "Lightning Rod", "Serene Grace", "Swift Swim",
  "Chlorophyll", "Illuminate", "Trace", "Huge Power", "Poison Point", "Inner Focus",
  "Magma Armor", "Water Veil", "Magnet Pull", "Soundproof", "Rain Dish", "Sand Stream",
  "Pressure", "Thick Fat", "Early Bird", "Flame Body", "Run Away", "Keen Eye",
  "Hyper Cutter", "Pickup", "Truant", "Hustle", "Cute Charm", "Plus", "Minus", "Forecast",
  "Sticky Hold", "Shed Skin", "Guts", "Marvel Scale", "Liquid Ooze", "Overgrow", "Blaze",
  "Torrent", "Swarm", "Rock Head", "Drought", "Arena Trap", "Vital Spirit", "White Smoke",
  "Pure Power", "Shell Armor", "Cacophony", "Air Lock" }

local moveNamesList = {
  "--", "Pound", "Karate Chop", "Double Slap", "Comet Punch", "Mega Punch", "Pay Day", "Fire Punch", "Ice Punch",
  "Thunder Punch",
  "Scratch", "Vice Grip", "Guillotine", "Razor Wind", "Swords Dance", "Cut", "Gust", "Wing Attack", "Whirlwind", "Fly",
  "Bind", "Slam", "Vine Whip", "Stomp", "Double Kick", "Mega Kick", "Jump Kick", "Rolling Kick", "Sand Attack",
  "Headbutt",
  "Horn Attack", "Fury Attack", "Horn Drill", "Tackle", "Body Slam", "Wrap", "Take Down", "Thrash", "Double-Edge",
  "Tail Whip", "Poison Sting", "Twineedle", "Pin Missile", "Leer", "Bite", "Growl", "Roar", "Sing", "Supersonic",
  "Sonic Boom",
  "Disable", "Acid", "Ember", "Flamethrower", "Mist", "Water Gun", "Hydro Pump", "Surf", "Ice Beam", "Blizzard",
  "Psybeam",
  "Bubble Beam", "Aurora Beam", "Hyper Beam", "Peck", "Drill Peck", "Submission", "Low Kick", "Counter", "Seismic Toss",
  "Strength", "Absorb", "Mega Drain", "Leech Seed", "Growth", "Razor Leaf", "Solar Beam", "Poison Powder", "Stun Spore",
  "Sleep Powder", "Petal Dance", "String Shot", "Dragon Rage", "Fire Spin", "Thunder Shock", "Thunderbolt",
  "Thunder Wave",
  "Thunder", "Rock Throw", "Earthquake", "Fissure", "Dig", "Toxic", "Confusion", "Psychic", "Hypnosis", "Meditate",
  "Agility", "Quick Attack", "Rage", "Teleport", "Night Shade", "Mimic", "Screech", "Double Team", "Recover", "Harden",
  "Minimize", "Smokescreen", "Confuse Ray", "Withdraw", "Defense Curl", "Barrier", "Light Screen", "Haze", "Reflect",
  "Focus Energy", "Bide", "Metronome", "Mirror Move", "Self-Destruct", "Egg Bomb", "Lick", "Smog", "Sludge", "Bone Club",
  "Fire Blast", "Waterfall", "Clamp", "Swift", "Skull Bash", "Spike Cannon", "Constrict", "Amnesia", "Kinesis",
  "Soft-Boiled",
  "High Jump Kick", "Glare", "Dream Eater", "Poison Gas", "Barrage", "Leech Life", "Lovely Kiss", "Sky Attack",
  "Transform",
  "Bubble", "Dizzy Punch", "Spore", "Flash", "Psywave", "Splash", "Acid Armor", "Crabhammer", "Explosion", "Fury Swipes",
  "Bonemerang", "Rest", "Rock Slide", "Hyper Fang", "Sharpen", "Conversion", "Tri Attack", "Super Fang", "Slash",
  "Substitute", "Struggle", "Sketch", "Triple Kick", "Thief", "Spider Web", "Mind Reader", "Nightmare", "Flame Wheel",
  "Snore", "Curse", "Flail", "Conversion 2", "Aeroblast", "Cotton Spore", "Reversal", "Spite", "Powder Snow", "Protect",
  "Mach Punch", "Scary Face", "Feint Attack", "Sweet Kiss", "Belly Drum", "Sludge Bomb", "Mud-Slap", "Octazooka",
  "Spikes",
  "Zap Cannon", "Foresight", "Destiny Bond", "Perish Song", "Icy Wind", "Detect", "Bone Rush", "Lock-On", "Outrage",
  "Sandstorm", "Giga Drain", "Endure", "Charm", "Rollout", "False Swipe", "Swagger", "Milk Drink", "Spark",
  "Fury Cutter",
  "Steel Wing", "Mean Look", "Attract", "Sleep Talk", "Heal Bell", "Return", "Present", "Frustration", "Safeguard",
  "Pain Split", "Sacred Fire", "Magnitude", "Dynamic Punch", "Megahorn", "Dragon Breath", "Baton Pass", "Encore",
  "Pursuit",
  "Rapid Spin", "Sweet Scent", "Iron Tail", "Metal Claw", "Vital Throw", "Morning Sun", "Synthesis", "Moonlight",
  "Hidden Power",
  "Cross Chop", "Twister", "Rain Dance", "Sunny Day", "Crunch", "Mirror Coat", "Psych Up", "Extreme Speed",
  "Ancient Power",
  "Shadow Ball", "Future Sight", "Rock Smash", "Whirlpool", "Beat Up", "Fake Out", "Uproar", "Stockpile", "Spit Up",
  "Swallow", "Heat Wave", "Hail", "Torment", "Flatter", "Will-O-Wisp", "Memento", "Facade", "Focus Punch",
  "Smelling Salts",
  "Follow Me", "Nature Power", "Charge", "Taunt", "Helping Hand", "Trick", "Role Play", "Wish", "Assist", "Ingrain",
  "Superpower", "Magic Coat", "Recycle", "Revenge", "Brick Break", "Yawn", "Knock Off", "Endeavor", "Eruption",
  "Skill Swap",
  "Imprison", "Refresh", "Grudge", "Snatch", "Secret Power", "Dive", "Arm Thrust", "Camouflage", "Tail Glow",
  "Luster Purge",
  "Mist Ball", "Feather Dance", "Teeter Dance", "Blaze Kick", "Mud Sport", "Ice Ball", "Needle Arm", "Slack Off",
  "Hyper Voice", "Poison Fang", "Crush Claw", "Blast Burn", "Hydro Cannon", "Meteor Mash", "Astonish", "Weather Ball",
  "Aromatherapy", "Fake Tears", "Air Cutter", "Overheat", "Odor Sleuth", "Rock Tomb", "Silver Wind", "Metal Sound",
  "Grass Whistle", "Tickle", "Cosmic Power", "Water Spout", "Signal Beam", "Shadow Punch", "Extrasensory",
  "Sky Uppercut",
  "Sand Tomb", "Sheer Cold", "Muddy Water", "Bullet Seed", "Aerial Ace", "Icicle Spear", "Iron Defense", "Block", "Howl",
  "Dragon Claw", "Frenzy Plant", "Bulk Up", "Bounce", "Mud Shot", "Poison Tail", "Covet", "Volt Tackle", "Magical Leaf",
  "Water Sport", "Calm Mind", "Leaf Blade", "Dragon Dance", "Rock Blast", "Shock Wave", "Water Pulse", "Doom Desire",
  "Psycho Boost" }

local nationalDexList = {
  1, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26,
  27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50,
  51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74,
  75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99,
  100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119,
  120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139,
  140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159,
  160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179,
  180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199,
  200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219,
  220, 221, 222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239,
  240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 387, 388, 389, 390, 391, 392, 393, 394,
  395, 396, 397, 398, 399, 400, 401, 402, 403, 404, 405, 406, 407, 408, 409, 410, 411, 252, 253, 254,
  255, 256, 257, 258, 259, 260, 261, 262, 263, 264, 265, 266, 267, 268, 269, 270, 271, 272, 273, 274,
  275, 290, 291, 292, 276, 277, 285, 286, 327, 278, 279, 283, 284, 320, 321, 300, 301, 352, 343, 344,
  299, 324, 302, 339, 340, 370, 341, 342, 349, 350, 318, 319, 328, 329, 330, 296, 297, 309, 310, 322,
  323, 363, 364, 365, 331, 332, 361, 362, 337, 338, 298, 325, 326, 311, 312, 303, 307, 308, 333, 334,
  360, 355, 356, 315, 287, 288, 289, 316, 317, 357, 293, 294, 295, 366, 367, 368, 359, 353, 354, 336,
  335, 369, 304, 305, 306, 351, 313, 314, 345, 346, 347, 348, 280, 281, 282, 371, 372, 373, 374, 375,
  376, 377, 378, 379, 382, 383, 384, 380, 381, 385, 386, 358 }

local pokemonAbilities = {
  [001] = { 65, 34 },
  [002] = { 65, 34 },
  [003] = { 65, 34 },
  [004] = { 66 },
  [005] = { 66 },
  [006] = { 66 },
  [007] = { 67, 44 },
  [008] = { 67, 44 },
  [009] = { 67, 44 },
  [010] = { 19, 50 },
  [011] = { 61 },
  [012] = { 14 },
  [013] = { 19, 50 },
  [014] = { 61 },
  [015] = { 68 },
  [016] = { 51 },
  [017] = { 51 },
  [018] = { 51 },
  [019] = { 50, 62, 55 },
  [020] = { 50, 62, 55 },
  [021] = { 51 },
  [022] = { 51 },
  [023] = { 22, 61 },
  [024] = { 22, 61 },
  [025] = { 9, 31 },
  [026] = { 9, 31 },
  [027] = { 8 },
  [028] = { 8 },
  [029] = { 38, 55 },
  [030] = { 38, 55 },
  [031] = { 38 },
  [032] = { 38, 55 },
  [033] = { 38, 55 },
  [034] = { 38 },
  [035] = { 56 },
  [036] = { 56 },
  [037] = { 18, 70 },
  [038] = { 18, 70 },
  [039] = { 56 },
  [040] = { 56 },
  [041] = { 39 },
  [042] = { 39 },
  [043] = { 34, 50 },
  [044] = { 34, 1 },
  [045] = { 34, 27 },
  [046] = { 27, 6 },
  [047] = { 27, 6 },
  [048] = { 14, 50 },
  [049] = { 19 },
  [050] = { 8, 71 },
  [051] = { 8, 71 },
  [052] = { 53 },
  [053] = { 7 },
  [054] = { 6, 13, 33 },
  [055] = { 6, 13, 33 },
  [056] = { 72 },
  [057] = { 72 },
  [058] = { 22, 18 },
  [059] = { 22, 18 },
  [060] = { 11, 6, 33 },
  [061] = { 11, 6, 33 },
  [062] = { 11, 6, 33 },
  [063] = { 28, 39 },
  [064] = { 28, 39 },
  [065] = { 28, 39 },
  [066] = { 62 },
  [067] = { 62 },
  [068] = { 62 },
  [069] = { 34 },
  [070] = { 34 },
  [071] = { 34 },
  [072] = { 29, 64, 44 },
  [073] = { 29, 64, 44 },
  [074] = { 69, 5, 8 },
  [075] = { 69, 5, 8 },
  [076] = { 69, 5, 8 },
  [077] = { 50, 18, 49 },
  [078] = { 50, 18, 49 },
  [079] = { 12, 20 },
  [080] = { 12, 20 },
  [081] = { 42, 5 },
  [082] = { 42, 5 },
  [083] = { 51, 39 },
  [084] = { 50, 48 },
  [085] = { 50, 48 },
  [086] = { 47 },
  [087] = { 47 },
  [088] = { 1, 60 },
  [089] = { 1, 60 },
  [090] = { 75 },
  [091] = { 75 },
  [092] = { 26 },
  [093] = { 26 },
  [094] = { 26 },
  [095] = { 69, 5 },
  [096] = { 15, 39 },
  [097] = { 15, 39 },
  [098] = { 52, 75 },
  [099] = { 52, 75 },
  [100] = { 43, 9 },
  [101] = { 43, 9 },
  [102] = { 34 },
  [103] = { 34 },
  [104] = { 69, 31, 4 },
  [105] = { 69, 31, 4 },
  [106] = { 7 },
  [107] = { 51, 39 },
  [108] = { 20, 12, 13 },
  [109] = { 26, 1 },
  [110] = { 26, 1 },
  [111] = { 31, 69 },
  [112] = { 31, 69 },
  [113] = { 30, 32 },
  [114] = { 34 },
  [115] = { 48, 39 },
  [116] = { 33, 6 },
  [117] = { 38, 6 },
  [230] = { 33, 6 },
  [118] = { 33, 41, 31 },
  [119] = { 33, 41, 31 },
  [120] = { 35, 30 },
  [121] = { 35, 30 },
  [122] = { 43 },
  [123] = { 68 },
  [212] = { 68 },
  [238] = { 12 },
  [124] = { 12 },
  [239] = { 9, 72 },
  [125] = { 9, 72 },
  [240] = { 49, 72 },
  [126] = { 49, 72 },
  [127] = { 52 },
  [128] = { 22 },
  [129] = { 33 },
  [130] = { 22 },
  [131] = { 11, 75 },
  [132] = { 7 },
  [133] = { 50 },
  [134] = { 11 },
  [135] = { 10 },
  [136] = { 18, 62 },
  [196] = { 28 },
  [197] = { 28, 39 },
  [137] = { 36 },
  [233] = { 36 },
  [138] = { 33, 75 },
  [139] = { 33, 75 },
  [140] = { 33, 4 },
  [141] = { 33, 4 },
  [142] = { 69, 46 },
  [143] = { 17, 47 },
  [144] = { 46 },
  [145] = { 46, 9 },
  [146] = { 46, 49 },
  [147] = { 61, 63 },
  [148] = { 61, 63 },
  [149] = { 39 },
  [150] = { 46 },
  [151] = { 28 },
  [152] = { 65 },
  [153] = { 65 },
  [154] = { 65 },
  [155] = { 66, 18 },
  [156] = { 66, 18 },
  [157] = { 66, 18 },
  [158] = { 67 },
  [159] = { 67 },
  [160] = { 67 },
  [161] = { 50, 51 },
  [162] = { 50, 51 },
  [163] = { 15, 51 },
  [164] = { 15, 51 },
  [165] = { 68, 48 },
  [166] = { 68, 48 },
  [167] = { 68, 15 },
  [168] = { 68, 15 },
  [169] = { 39 },
  [170] = { 10, 35, 11 },
  [171] = { 10, 35, 11 },
  [172] = { 9, 31 },
  [173] = { 56 },
  [174] = { 56 },
  [175] = { 55, 32 },
  [176] = { 55, 32 },
  [177] = { 28, 48 },
  [178] = { 28, 48 },
  [179] = { 9, 57 },
  [180] = { 9, 57 },
  [181] = { 9, 57 },
  [182] = { 34 },
  [183] = { 47, 37 },
  [184] = { 47, 37 },
  [185] = { 5, 69 },
  [186] = { 11, 6, 2 },
  [187] = { 34 },
  [188] = { 34 },
  [189] = { 34 },
  [190] = { 50, 53 },
  [191] = { 34, 48 },
  [192] = { 34, 48 },
  [193] = { 3, 14 },
  [194] = { 6, 11 },
  [195] = { 6, 11 },
  [198] = { 15 },
  [199] = { 12, 20 },
  [200] = { 26 },
  [201] = { 26 },
  [202] = { 23 },
  [203] = { 39, 48 },
  [204] = { 5 },
  [205] = { 5 },
  [206] = { 32, 50 },
  [207] = { 52, 8, 17 },
  [208] = { 69, 5 },
  [209] = { 22, 50 },
  [210] = { 22 },
  [211] = { 38, 33, 22 },
  [213] = { 5 },
  [214] = { 68, 62 },
  [215] = { 39, 51 },
  [216] = { 53 },
  [217] = { 62 },
  [218] = { 40, 49 },
  [219] = { 40, 49 },
  [220] = { 12, 47 },
  [221] = { 12, 47 },
  [222] = { 55, 30 },
  [223] = { 55 },
  [224] = { 21 },
  [225] = { 72, 55, 15 },
  [226] = { 33, 11, 41 },
  [227] = { 51, 5 },
  [228] = { 48, 18 },
  [229] = { 48, 18 },
  [231] = { 53, 8 },
  [232] = { 5, 8 },
  [234] = { 22 },
  [235] = { 20 },
  [236] = { 62, 72 },
  [237] = { 22 },
  [241] = { 47 },
  [242] = { 30, 32 },
  [243] = { 46, 39 },
  [244] = { 46, 39 },
  [245] = { 46, 39 },
  [246] = { 62, 8 },
  [247] = { 61 },
  [248] = { 45 },
  [249] = { 46 },
  [250] = { 46 },
  [251] = { 30 },
  [252] = { 65 },
  [253] = { 65 },
  [254] = { 65 },
  [255] = { 66, 3 },
  [256] = { 66, 3 },
  [257] = { 66, 3 },
  [258] = { 67, 6 },
  [259] = { 67, 6 },
  [260] = { 67, 6 },
  [261] = { 50 },
  [262] = { 22 },
  [263] = { 53 },
  [264] = { 53 },
  [265] = { 19, 50 },
  [266] = { 61 },
  [267] = { 68 },
  [268] = { 61 },
  [269] = { 19, 14 },
  [270] = { 33, 44, 20 },
  [271] = { 33, 44, 20 },
  [272] = { 33, 44, 20 },
  [273] = { 34, 48 },
  [274] = { 34, 48 },
  [275] = { 34, 48 },
  [276] = { 62 },
  [277] = { 62 },
  [278] = { 51, 44 },
  [279] = { 51, 2, 44 },
  [280] = { 28, 36 },
  [281] = { 28, 36 },
  [282] = { 28, 36 },
  [283] = { 33, 44 },
  [284] = { 22 },
  [285] = { 27 },
  [286] = { 27 },
  [287] = { 54 },
  [288] = { 72 },
  [289] = { 54 },
  [290] = { 14, 50 },
  [291] = { 3 },
  [292] = { 25 },
  [293] = { 43 },
  [294] = { 43 },
  [295] = { 43 },
  [296] = { 47, 62 },
  [297] = { 47, 62 },
  [298] = { 47, 37 },
  [299] = { 5, 42 },
  [300] = { 56 },
  [301] = { 56 },
  [302] = { 51 },
  [303] = { 52, 22 },
  [304] = { 5, 69 },
  [305] = { 5, 69 },
  [306] = { 5, 69 },
  [307] = { 74 },
  [308] = { 74 },
  [309] = { 9, 31, 58 },
  [310] = { 9, 31, 58 },
  [311] = { 57, 31 },
  [312] = { 58, 10 },
  [313] = { 35, 68 },
  [314] = { 12 },
  [315] = { 30, 38 },
  [316] = { 64, 60 },
  [317] = { 64, 60 },
  [318] = { 24, 3 },
  [319] = { 24, 3 },
  [320] = { 41, 12, 46 },
  [321] = { 41, 12, 46 },
  [322] = { 12, 20 },
  [323] = { 40 },
  [324] = { 73, 70, 75 },
  [325] = { 47, 20 },
  [326] = { 47, 20 },
  [327] = { 20 },
  [328] = { 52, 71 },
  [329] = { 26 },
  [330] = { 26 },
  [331] = { 8, 11 },
  [332] = { 8, 11 },
  [333] = { 30, 13 },
  [334] = { 30, 13 },
  [335] = { 17 },
  [336] = { 61 },
  [337] = { 26 },
  [338] = { 26 },
  [339] = { 12 },
  [340] = { 12 },
  [341] = { 52, 75 },
  [342] = { 52, 75 },
  [343] = { 26 },
  [344] = { 26 },
  [345] = { 21 },
  [346] = { 21 },
  [347] = { 4, 33 },
  [348] = { 4, 33 },
  [349] = { 33, 12 },
  [350] = { 63, 56 },
  [351] = { 59 },
  [352] = { 16 },
  [353] = { 15 },
  [354] = { 15 },
  [355] = { 26 },
  [356] = { 46 },
  [357] = { 34 },
  [358] = { 26 },
  [359] = { 46 },
  [360] = { 23 },
  [361] = { 39 },
  [362] = { 39 },
  [363] = { 47, 12 },
  [364] = { 47, 12 },
  [365] = { 47, 12 },
  [366] = { 75 },
  [367] = { 33, 41 },
  [368] = { 33 },
  [369] = { 33, 69, 5 },
  [370] = { 33 },
  [371] = { 69 },
  [372] = { 69 },
  [373] = { 22 },
  [374] = { 29 },
  [375] = { 29 },
  [376] = { 29 },
  [377] = { 29, 5 },
  [378] = { 29 },
  [379] = { 29 },
  [380] = { 26 },
  [381] = { 26 },
  [382] = { 2 },
  [383] = { 70 },
  [384] = { 77 },
  [385] = { 32 },
  [386] = { 46 }
}

local itemNamesList = {
  "None", "Master Ball", "Ultra Ball", "Great Ball", "Poke Ball", "Safari Ball", "Net Ball", "Dive Ball", "Nest Ball",
  "Repeat Ball",
  "Timer Ball", "Luxury Ball", "Premier Ball", "Potion", "Antidote", "Burn Heal", "Ice Heal", "Awakening", "Parlyz Heal",
  "Full Restore",
  "Max Potion", "Hyper Potion", "Super Potion", "Full Heal", "Revive", "Max Revive", "Fresh Water", "Soda Pop",
  "Lemonade", "Moomoo Milk",
  "EnergyPowder", "Energy Root", "Heal Powder", "Revival Herb", "Ether", "Max Ether", "Elixir", "Max Elixir",
  "Lava Cookie", "Blue Flute",
  "Yellow Flute", "Red Flute", "Black Flute", "White Flute", "Berry Juice", "Sacred Ash", "Shoal Salt", "Shoal Shell",
  "Red Shard",
  "Blue Shard", "Yellow Shard", "Green Shard", "unknown", "unknown", "unknown", "unknown", "unknown", "unknown",
  "unknown", "unknown",
  "unknown", "unknown", "unknown", "HP Up", "Protein", "Iron", "Carbos", "Calcium", "Rare Candy", "PP Up", "Zinc",
  "PP Max", "unknown",
  "Guard Spec.", "Dire Hit", "X Attack", "X Defend", "X Speed", "X Accuracy", "X Special", "Poke Doll", "Fluffy Tail",
  "unknown",
  "Super Repel", "Max Repel", "Escape Rope", "Repel", "unknown", "unknown", "unknown", "unknown", "unknown", "unknown",
  "Sun Stone",
  "Moon Stone", "Fire Stone", "Thunderstone", "Water Stone", "Leaf Stone", "unknown", "unknown", "unknown", "unknown",
  "TinyMushroom",
  "Big Mushroom", "unknown", "Pearl", "Big Pearl", "Stardust", "Star Piece", "Nugget", "Heart Scale", "unknown",
  "unknown", "unknown",
  "unknown", "unknown", "unknown", "unknown", "unknown", "unknown", "Orange Mail", "Harbor Mail", "Glitter Mail",
  "Mech Mail", "Wood Mail",
  "Wave Mail", "Bead Mail", "Shadow Mail", "Tropic Mail", "Dream Mail", "Fab Mail", "Retro Mail", "Cheri Berry",
  "Chesto Berry",
  "Pecha Berry", "Rawst Berry", "Aspear Berry", "Leppa Berry", "Oran Berry", "Persim Berry", "Lum Berry", "Sitrus Berry",
  "Figy Berry",
  "Wiki Berry", "Mago Berry", "Aguav Berry", "Iapapa Berry", "Razz Berry", "Bluk Berry", "Nanab Berry", "Wepear Berry",
  "Pinap Berry",
  "Pomeg Berry", "Kelpsy Berry", "Qualot Berry", "Hondew Berry", "Grepa Berry", "Tamato Berry", "Cornn Berry",
  "Magost Berry", "Rabuta Berry",
  "Nomel Berry", "Spelon Berry", "Pamtre Berry", "Watmel Berry", "Durin Berry", "Belue Berry", "Liechi Berry",
  "Ganlon Berry", "Salac Berry",
  "Petaya Berry", "Apicot Berry", "Lansat Berry", "Starf Berry", "Enigma Berry", "unknown", "unknown", "unknown",
  "BrightPowder", "White Herb",
  "Macho Brace", "Exp. Share", "Quick Claw", "Soothe Bell", "Mental Herb", "Choice Band", "King's Rock", "SilverPowder",
  "Amulet Coin",
  "Cleanse Tag", "Soul Dew", "DeepSeaTooth", "DeepSeaScale", "Smoke Ball", "Everstone", "Focus Band", "Lucky Egg",
  "Scope Lens", "Metal Coat",
  "Leftovers", "Dragon Scale", "Light Ball", "Soft Sand", "Hard Stone", "Miracle Seed", "BlackGlasses", "Black Belt",
  "Magnet", "Mystic Water",
  "Sharp Beak", "Poison Barb", "NeverMeltIce", "Spell Tag", "TwistedSpoon", "Charcoal", "Dragon Fang", "Silk Scarf",
  "Up-Grade", "Shell Bell",
  "Sea Incense", "Lax Incense", "Lucky Punch", "Metal Powder", "Thick Club", "Stick", "unknown", "unknown", "unknown",
  "unknown", "unknown",
  "unknown", "unknown", "unknown", "unknown", "unknown", "unknown", "unknown", "unknown", "unknown", "unknown",
  "unknown", "unknown", "unknown",
  "unknown", "unknown", "unknown", "unknown", "unknown", "unknown", "unknown", "unknown", "unknown", "unknown",
  "Red Scarf", "Blue Scarf",
  "Pink Scarf", "Green Scarf", "Yellow Scarf", "Mach Bike", "Coin Case", "Itemfinder", "Old Rod", "Good Rod",
  "Super Rod", "S.S. Ticket",
  "Contest Pass", "unknown", "Wailmer Pail", "Devon Goods", "Soot Sack", "Basement Key", "Acro Bike", "Pokeblock Case",
  "Letter", "Eon Ticket",
  "Red Orb", "Blue Orb", "Scanner", "Go-Goggles", "Meteorite", "Rm. 1 Key", "Rm. 2 Key", "Rm. 4 Key", "Rm. 6 Key",
  "Storage Key", "Root Fossil",
  "Claw Fossil", "Devon Scope", "TM 01", "TM 02", "TM 03", "TM 04", "TM 05", "TM 06", "TM 07", "TM 08", "TM 09", "TM 10",
  "TM 11", "TM 12",
  "TM 13", "TM 14", "TM 15", "TM 16", "TM 17", "TM 18", "TM 19", "TM 20", "TM 21", "TM 22", "TM 23", "TM 24", "TM 25",
  "TM 26", "TM 27", "TM 28",
  "TM 29", "TM 30", "TM 31", "TM 32", "TM 33", "TM 34", "TM 35", "TM 36", "TM 37", "TM 38", "TM 39", "TM 40", "TM 41",
  "TM 42", "TM 43", "TM 44",
  "TM 45", "TM 46", "TM 47", "TM 48", "TM 49", "TM 50", "HM 01", "HM 02", "HM 03", "HM 04", "HM 05", "HM 06", "HM 07",
  "HM 08", "unknown",
  "unknown", "Oak's Parcel", "Poke Flute", "Secret Key", "Bike Voucher", "Gold Teeth", "Old Amber", "Card Key",
  "Lift Key", "Helix Fossil",
  "Dome Fossil", "Silph Scope", "Bicycle", "Town Map", "VS Seeker", "Fame Checker", "TM Case", "Berry Pouch",
  "Teachy TV", "Tri-Pass",
  "Rainbow Pass", "Tea", "MysticTicket", "AuroraTicket", "Powder Jar", "Ruby", "Sapphire", "Magma Emblem", "Old Sea Map" }

local catchRatesList = {
  -- Gen 1
  45, 45, 45, 45, 45, 45, 45, 45, 45, 255, 120, 45, 255, 120, 45, 255, 120,
  45, 255, 127, 255, 90, 255, 90, 190, 75, 255, 90, 235, 120, 45, 235, 120,
  45, 150, 25, 190, 75, 170, 50, 255, 90, 255, 120, 45, 190, 75, 190, 75,
  255, 50, 255, 90, 190, 75, 190, 75, 190, 75, 255, 120, 45, 200, 100, 50,
  180, 90, 45, 255, 120, 45, 190, 60, 255, 120, 45, 190, 60, 190, 75, 190,
  60, 45, 190, 45, 190, 75, 190, 75, 190, 60, 190, 90, 45, 45, 190, 75,
  225, 60, 190, 60, 90, 45, 190, 75, 45, 45, 45, 190, 60, 120, 60, 30,
  45, 45, 225, 75, 225, 60, 225, 60, 45, 45, 45, 45, 45, 45, 45, 255, 45,
  45, 35, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 25, 3, 3, 3, 45, 45, 45,
  3, 45,
  -- Gen 2
  45, 45, 45, 45, 45, 45, 45, 45, 45, 255, 90, 255, 90, 255, 90, 255, 90,
  90, 190, 75, 190, 150, 170, 190, 75, 190, 75, 235, 120, 45, 45, 190, 75,
  65, 45, 255, 120, 45, 45, 235, 120, 75, 255, 90, 45, 45, 30, 70, 45, 225,
  45, 60, 190, 75, 190, 60, 25, 190, 75, 45, 25, 190, 45, 60, 120, 60, 190,
  75, 225, 75, 60, 190, 75, 45, 25, 25, 120, 45, 45, 120, 60, 45, 45, 45, 75,
  45, 45, 45, 45, 45, 30, 3, 3, 3, 45, 45, 45, 3, 3, 45,
  -- Gen 3
  45, 45, 45, 45, 45, 45, 45, 45, 45, 255, 127, 255, 90, 255, 120, 45, 120,
  45, 255, 120, 45, 255, 120, 45, 200, 45, 190, 45, 235, 120, 45, 200, 75,
  255, 90, 255, 120, 45, 255, 120, 45, 190, 120, 45, 180, 200, 150, 255, 255,
  60, 45, 45, 180, 90, 45, 180, 90, 120, 45, 200, 200, 150, 150, 150, 225, 75,
  225, 60, 125, 60, 255, 150, 90, 255, 60, 255, 255, 120, 45, 190, 60, 255,
  45, 90, 90, 45, 45, 190, 75, 205, 155, 255, 90, 45, 45, 45, 45, 255, 60, 45,
  200, 225, 45, 190, 90, 200, 45, 30, 125, 190, 75, 255, 120, 45, 255, 60,
  60, 25, 225, 45, 45, 45, 3, 3, 3, 3, 3, 3, 3, 3, 5, 5, 3, 3, 3 }

local locationNamesList = {
  "Petalburg City", "Slateport City", "Mauville City", "Rustboro City", "Fortree City", "Lilycove City",
  "Mossdeep City", "Sootopolis City", "Ever Grande City", "Littleroot Town", "Oldale Town", "Dewford Town",
  "Lavaridge Town", "Fallarbor Town", "Verdanturf Town", "Pacifidlog Town", "Route 101", "Route 102",
  "Route 103", "Route 104", "Route 105", "Route 106", "Route 107", "Route 108", "Route 109", "Route 110",
  "Route 111", "Route 112", "Route 113", "Route 114", "Route 115", "Route 116", "Route 117", "Route 118",
  "Route 119", "Route 120", "Route 121", "Route 122", "Route 123", "Route 124", "Route 125", "Route 126",
  "Route 127", "Route 128", "Route 129", "Route 130", "Route 131", "Route 132", "Route 133", "Route 134",
  "Underwater Route124", "Underwater Route126", "Underwater Route 127", "Underwater Route 128",
  "Underwater Route 129", "Underwater Route 105", "Underwater Route 125" }

local statusConditionNamesList = {
  "None", "SLP", "PSN", "BRN", "FRZ", "PAR", "PSN" }

local gameVersion = read8Bit(0x080000AE)
local game
local gameLang = read8Bit(0x080000AF)
local language = ""
local warning

local emuWindow = {}
local mode = { "None", "Capture", "100% Catch", "Breeding", "Pandora", "TID Bot", "Pokemon Info" }
local index = 1
local prevKey = {}
local showInstructionsText = false
local leftArrowColor
local rightArrowColor
local leftInfoArrowColor
local rightInfoArrowColor
local prevKeyInfo = {}
local showRoamerInfoText = false
local showRngInfoText = true

local initSeed
local initSeedAddr = 0x02020000
local currSeedAddr
local tempInit = 0
local advances = 0
local advancesAddr
local adjustAdvances = 0
local battleVideoSeed1Addr
local battleVideoSeed2Addr

local wildAddr
local saveBlock1Addr
local saveBlock2Addr
local roamerMapGroupNumAddr
local prevPID = 0
local tempEncounterSeed = 0
local hitEncounterSeed = 0
local advancesHit = 0
local encounterMethod = 0

local speciesDexIndexAddr
local selectedItemAddr
local wildTypeAddr
local isUnderWaterAddr
local safariZoneStepsCounterAddr
local safariCatchFactorPointerAddr
local battleTurnsCounterAddr
local ballRate = { "1", "255", "2", "1.5", "1", "1.5", "1", "1", "1", "1", "1", "1", "1" }
local catchCheckFlagAddr = 0x0200558C
local startingCatchAdvances
local catchDelayCounter = 0
local catchDelay = 0
local catchRngStop = true
local skips
local oneTimeCatchRng = true
local currSeed2

local eggCurrSeedAddr
local timerAddr
local base = 0
local iter = 0
local partyAddr
local partySlotsCounterAddr
local eggPIDPointerAddr

local initSeedWritten = false
local TIDFound = false
local botTargetTIDs = { 0, 1, 1337, 8453, 8411, 11233, 11111, 22222, 33333 } -- Input here the bot target TIDs

local infoMode = { "Gift", "Party", "Party Stats", "Battle Party Stats", "Box", "1st Floor Box Stats",
  "2nd Floor Box Stats", "DayCare Box Stats" }
local infoIndex = 1
local partySelectedSlotNumberAddr
local pokemonStatsScreenAddr
local pokemonStatsScreen2Addr = 0x0200001C
local pokemonBattleStatsScreenAddr = 0x0200E808
local currBoxNumberPointerAddr
local boxSelectedSlotNumberAddr

if gameVersion == 0x45 then -- Check game version
  game = "Emerald"
elseif gameVersion == 0x47 then
  game = "LeafGreen"
elseif gameVersion == 0x50 then
  game = "Sapphire"
elseif gameVersion == 0x52 then
  game = "FireRed"
elseif gameVersion == 0x56 then
  game = "Ruby"
end

if gameLang == 0x4A then -- Check game language
  language = "JPN"
  currSeedAddr = 0x03005AE0
  advancesAddr = 0x02024664
  battleVideoSeed1Addr = 0x0203B9F8
  battleVideoSeed2Addr = 0x0203AD74
  wildAddr = 0x020243E8 -- capture
  saveBlock1Addr = 0x03005AEC
  saveBlock2Addr = 0x03005AF0
  roamerMapGroupNumAddr = 0x0203B952
  speciesDexIndexAddr = 0x0202370C -- 100% catch
  selectedItemAddr = 0x0203CB48
  wildTypeAddr = 0x02023DA1
  isUnderWaterAddr = 0x02036FCF
  safariZoneStepsCounterAddr = 0x02039D1A
  safariCatchFactorPointerAddr = 0x02024140
  battleTurnsCounterAddr = 0x03005A83
  eggCurrSeedAddr = 0x03005AE4 -- breeding
  timerAddr = 0x03002384
  partyAddr = 0x02024190
  partySlotsCounterAddr = 0x0202418D
  eggPIDPointerAddr = 0x0203B944
  partySelectedSlotNumberAddr = 0x0203CB9D -- info
  pokemonStatsScreenAddr = 0x02002FE0
  currBoxNumberPointerAddr = 0x03005AF4
  boxSelectedSlotNumberAddr = 0x02039A19
else
  language = "EUR/USA"
  currSeedAddr = 0x03005D80
  advancesAddr = 0x020249C0
  battleVideoSeed1Addr = 0x0203BD2C
  battleVideoSeed2Addr = 0x0203B0A8
  wildAddr = 0x02024744 -- capture
  saveBlock1Addr = 0x03005D8C
  saveBlock2Addr = 0x03005D90
  roamerMapGroupNumAddr = 0x0203BC86
  speciesDexIndexAddr = 0x02023A68 -- 100% catch
  selectedItemAddr = 0x0203CE7C
  wildTypeAddr = 0x020240FD
  isUnderWaterAddr = 0x0203732F
  safariZoneStepsCounterAddr = 0x0203A04E
  safariCatchFactorPointerAddr = 0x0202449C
  battleTurnsCounterAddr = 0x03005D23
  eggCurrSeedAddr = 0x03005D84 -- breeding
  timerAddr = 0x030022E4
  partyAddr = 0x020244EC
  partySlotsCounterAddr = 0x020244E9
  eggPIDPointerAddr = 0x0203BC78
  partySelectedSlotNumberAddr = 0x0203CED1 -- info
  pokemonStatsScreenAddr = 0x020032A8
  currBoxNumberPointerAddr = 0x03005D94
  boxSelectedSlotNumberAddr = 0x02039D79
end

if game ~= "Emerald" then
  warning = " - Wrong game version! Use Emerald instead"
else
  warning = ""
end

console.clear()
print("Devon Studios x Real.96")
print("")
print("Game Version: " .. game .. warning)
print("Language: " .. language)

client.reboot_core()

function getScreenDimensions()
  emuWindow.height = client.screenheight()
  emuWindow.width = client.screenwidth()
  emuWindow.topPadding = client.borderheight()
  emuWindow.leftPadding = client.borderwidth()
  emuWindow.bottomPadding = emuWindow.height - emuWindow.topPadding - 18
  emuWindow.rightPadding = emuWindow.width - emuWindow.leftPadding - 18
end

function getInput()
  leftArrowColor = "gray"
  rightArrowColor = "gray"

  local key = input.get()

  if (key["Number1"] or key["Keypad1"]) and (not prevKey["Number1"] and not prevKey["Keypad1"]) then
    leftArrowColor = "orange"
    index = index - 1

    if index < 1 then
      index = 7
    end
  elseif (key["Number2"] or key["Keypad2"]) and (not prevKey["Number2"] and not prevKey["Keypad2"]) then
    rightArrowColor = "orange"
    index = index + 1

    if index > 7 then
      index = 1
    end
  end

  prevKey = key
end

function drawArrowLeft(a, b, c)
  gui.drawLine(a, b + 3, a + 2, b + 5, c)
  gui.drawLine(a, b + 3, a + 2, b + 1, c)
  gui.drawLine(a, b + 3, a + 6, b + 3, c)
end

function drawArrowRight(a, b, c)
  gui.drawLine(a, b + 3, a - 2, b + 5, c)
  gui.drawLine(a, b + 3, a - 2, b + 1, c)
  gui.drawLine(a, b + 3, a - 6, b + 3, c)
end

function getInstructionsInput()
  local key = input.get()

  if mode[index] == "100% Catch" or mode[index] == "TID Bot" then
    if key["Number3"] or key["Keypad3"] then
      showInstructionsText = true
    elseif key["Number4"] or key["Keypad4"] then
      showInstructionsText = false
    end
  end

  if mode[index] == "100% Catch" and showInstructionsText then
    gui.text(emuWindow.rightPadding - 200, emuWindow.topPadding, "4 - Hide instructions")
    gui.text(emuWindow.leftPadding + 1, emuWindow.topPadding + 18, "1) During battle, go to BAG > POKE BALLS")
    gui.text(emuWindow.leftPadding + 1, emuWindow.topPadding + 36, "2) Press A on the ball you want to use")
    gui.text(emuWindow.leftPadding + 1, emuWindow.topPadding + 54,
      "3) Move the arrow on 'USE', pause the game and save a state")
    gui.text(emuWindow.leftPadding + 1, emuWindow.topPadding + 72,
      "4) Advance a single frame (CTRL+N) while holding SELECT")
    gui.text(emuWindow.leftPadding + 30, emuWindow.topPadding + 90, "and then unpause the game while holding A.")
    gui.text(emuWindow.leftPadding + 1, emuWindow.topPadding + 108, "5) Wait until delay is calculated")
    gui.text(emuWindow.leftPadding + 1, emuWindow.topPadding + 126,
      "6) Load the state you made, advance frames until counter")
    gui.text(emuWindow.leftPadding + 30, emuWindow.topPadding + 144, "become 0")
    gui.text(emuWindow.leftPadding + 1, emuWindow.topPadding + 162, "7) Unpase the game while holding A")
    gui.text(emuWindow.leftPadding + 1, emuWindow.topPadding + 180, "Note: the delay can be not stable, be sure to check")
    gui.text(emuWindow.leftPadding + 1, emuWindow.topPadding + 198, "counter -1 or +1")
  elseif mode[index] == "TID Bot" and showInstructionsText then
    gui.text(emuWindow.rightPadding - 200, emuWindow.topPadding, "4 - Hide instructions")
    gui.text(emuWindow.leftPadding + 1, emuWindow.topPadding + 18, "1) Go to name insertion screen")
    gui.text(emuWindow.leftPadding + 1, emuWindow.topPadding + 36, "2) Insert the name you like")
    gui.text(emuWindow.leftPadding + 1, emuWindow.topPadding + 54, "3) Pause the game")
    gui.text(emuWindow.leftPadding + 1, emuWindow.topPadding + 72,
      "4) Advance a single frame (CTRL+N) while holding START")
    gui.text(emuWindow.leftPadding + 1, emuWindow.topPadding + 90, "5) Unpause the game")
  elseif mode[index] == "100% Catch" or mode[index] == "TID Bot" then
    gui.text(emuWindow.rightPadding - 200, emuWindow.topPadding, "3 - Show instructions")
  else
    showInstructionsText = false
    catchRngStop = true
    catchDelayCounter = 999
    catchDelay = 0
  end
end

function getRoamerInput()
  local key = input.get()

  if mode[index] == "Capture" then
    if key["Number3"] or key["Keypad3"] then
      showRoamerInfoText = true
    elseif key["Number4"] or key["Keypad4"] then
      showRoamerInfoText = false
    end
  end

  if mode[index] == "Capture" and showRoamerInfoText then
    gui.text(emuWindow.rightPadding - 200, emuWindow.topPadding, "4 - Hide roamer info")
  elseif mode[index] == "Capture" and not showRoamerInfoText then
    gui.text(emuWindow.rightPadding - 200, emuWindow.topPadding, "3 - Show roamer info")
  else
    showRoamerInfoText = false
  end
end

function getRngInfoInput()
  local key = input.get()

  if mode[index] == "Capture" or mode[index] == "Breeding" or mode[index] == "Pandora" or mode[index] == "Pokemon Info" then
    if key["Number5"] or key["Keypad5"] then
      showRngInfoText = true
    elseif key["Number6"] or key["Keypad6"] then
      showRngInfoText = false
    end
  end

  if (mode[index] == "Capture" or mode[index] == "Breeding" or mode[index] == "Pandora" or mode[index] == "Pokemon Info") and showRngInfoText then
    gui.text((emuWindow.width / 2) - 63, emuWindow.bottomPadding, "6 - Hide RNG info")
  elseif (mode[index] == "Capture" or mode[index] == "Breeding" or mode[index] == "Pandora" or mode[index] == "Pokemon Info") and not showRngInfoText then
    gui.text((emuWindow.width / 2) - 63, emuWindow.bottomPadding, "5 - Show RNG info")
  else
    showRngInfoText = true
  end
end

function LCRNG(s, mul1, mul2, sum)
  local a = mul1 * (s % 0x10000) + rshift(s, 16) * mul2
  local b = mul2 * (s % 0x10000) + (a % 0x10000) * 0x10000 + sum
  local c = b % 4294967296

  return c
end

function calcAdvancesJump(seed)
  local calibrationAdvances = 0
  local current = read32Bit(currSeedAddr)
  local tempCurr = seed
  local tempCurr2

  if tempCurr ~= current then
    tempCurr2 = tempCurr

    while tempCurr ~= current and tempCurr2 ~= current do
      tempCurr = LCRNG(tempCurr, 0x41C6, 0x4E6D, 0x6073)
      tempCurr2 = LCRNG(tempCurr2, 0xEEB9, 0xEB65, 0x0A3561A1)
      calibrationAdvances = calibrationAdvances + 1
    end

    if tempCurr2 == current then
      calibrationAdvances = (-1) * calibrationAdvances
      tempCurr = tempCurr2
    end
  end

  return calibrationAdvances
end

function checkInitialSeedGeneration(initial, battle, current)
  local battleVideoSeed2 = read32Bit(battleVideoSeed2Addr)
  local currAdvances = read32Bit(advancesAddr)

  if initial == current or battleVideoSeed2 == current then
    if initial == current then
      tempInit = initial
    else
      tempInit = battleVideoSeed2
    end

    adjustAdvances = currAdvances
  elseif battle == battleVideoSeed2 and battle ~= 0 and battle ~= tempInit then
    tempInit = battle
    adjustAdvances = currAdvances - calcAdvancesJump(battle)
  elseif initial ~= 0 and initial ~= tempInit then
    tempInit = initial
    adjustAdvances = currAdvances - calcAdvancesJump(initial)
  elseif initial == 0 and battle ~= battleVideoSeed2 then
    tempInit = 0
    adjustAdvances = 0
  end
end

function getEncounterAdvancesHit()
  if prevPID ~= read32Bit(wildAddr) then
    advancesHit = advances + 1
  end
end

function showRngInfo(initial, current, battle, advances)
  gui.text(emuWindow.leftPadding, emuWindow.bottomPadding - 54, string.format("Initial Seed: %04X", initial))
  gui.text(emuWindow.leftPadding + 1, emuWindow.bottomPadding - 36, string.format("Battle Video Seed: %04X", battle))
  gui.text(emuWindow.leftPadding + 1, emuWindow.bottomPadding - 18, string.format("Current Seed: %08X", current))
  gui.text(emuWindow.leftPadding + 1, emuWindow.bottomPadding, "Advances: " .. advances)
end

function getTrainerIDs(addr)
  addr = addr or nil

  local IDsAddr
  local IDs
  local TID
  local SID

  if mode[index] ~= "Pokemon Info" then
    IDsAddr = read32Bit(saveBlock2Addr) + 0xA
    IDs = read32Bit(IDsAddr)
  else
    IDs = read32Bit(addr + 0x4)
  end

  TID = IDs % 0x10000
  SID = floor(IDs / 0x10000)

  return { TID, SID }
end

function showTrainerIDs(addr)
  addr = addr or nil

  local trainerIDs = getTrainerIDs(addr)

  gui.text(emuWindow.rightPadding - 85, emuWindow.bottomPadding - 18, string.format("TID: %d", trainerIDs[1]))
  gui.text(emuWindow.rightPadding - 85, emuWindow.bottomPadding, string.format("SID: %d", trainerIDs[2]))
end

function getMiscOffset(orderIndex)
  local offset

  if orderIndex >= 18 then
    offset = 0
  elseif orderIndex % 6 >= 4 then
    offset = 12
  elseif orderIndex % 2 == 1 then
    offset = 24
  else
    offset = 36
  end

  return offset
end

function getGrowthOffset(orderIndex)
  local offset

  if orderIndex <= 5 then
    offset = 0
  elseif orderIndex % 6 <= 1 then
    offset = 12
  elseif orderIndex % 2 == 0 then
    offset = 24
  else
    offset = 36
  end

  return offset
end

function getAttacksOffset(orderIndex)
  local offset
  local index1 = { 0, 1, 14, 15, 20, 21 }
  local index2 = { 2, 4, 12, 17, 18, 23 }
  local index3 = { 3, 5, 13, 16, 19, 22 }
  local isIndex1 = 0
  local isIndex2 = 0

  for i = 1, table.getn(index1) do
    if orderIndex == index1[i] then
      isIndex1 = 1
      break
    end
  end

  for i = 1, table.getn(index2) do
    if orderIndex == index2[i] then
      isIndex2 = 1
      break
    end
  end

  if orderIndex >= 6 and orderIndex <= 11 then
    offset = 0
  elseif isIndex1 == 1 then
    offset = 12
  elseif isIndex2 == 1 then
    offset = 24
  else
    offset = 36
  end

  return offset
end

function getIVColor(value)
  if value >= 30 then
    return "limegreen"
  elseif value >= 1 and value <= 5 then
    return "orange"
  elseif value < 1 then
    return "red"
  else
    return nil
  end
end

function showIVsAndHP(IVsValue, isRoamer)
  isRoamer = isRoamer or nil

  local textXOffset = 0

  local hpIV = band(IVsValue, 0x1F)
  local atkIV = band(IVsValue, 0x1F * 0x20) / 0x20
  local defIV = band(IVsValue, 0x1F * 0x400) / 0x400
  local spAtkIV = band(IVsValue, 0x1F * 0x100000) / 0x100000
  local spDefIV = band(IVsValue, 0x1F * 0x2000000) / 0x2000000
  local spdIV = band(IVsValue, 0x1F * 0x8000) / 0x8000

  local hpType = floor(((hpIV % 2 + 2 * (atkIV % 2) + 4 * (defIV % 2) + 8 * (spdIV % 2) + 16 * (spAtkIV % 2) + 32 * (spDefIV % 2)) * 15) /
    63)
  local hpPower = floor(((band(hpIV, 2) / 2 + band(atkIV, 2) + 2 * band(defIV, 2) + 4 * band(spdIV, 2) + 8 * band(spAtkIV, 2) + 16 * band(spDefIV, 2)) * 40) /
    63 + 30)

  if isRoamer then
    textXOffset = 419
  end

  gui.text(emuWindow.leftPadding + 1 + textXOffset, emuWindow.topPadding + 90, "IVs:")
  gui.text(emuWindow.leftPadding + 51 + textXOffset, emuWindow.topPadding + 90, string.format("%02d", hpIV),
    getIVColor(hpIV))
  gui.text(emuWindow.leftPadding + 71 + textXOffset, emuWindow.topPadding + 90, "/")
  gui.text(emuWindow.leftPadding + 81 + textXOffset, emuWindow.topPadding + 90, string.format("%02d", atkIV),
    getIVColor(atkIV))
  gui.text(emuWindow.leftPadding + 101 + textXOffset, emuWindow.topPadding + 90, "/")
  gui.text(emuWindow.leftPadding + 111 + textXOffset, emuWindow.topPadding + 90, string.format("%02d", defIV),
    getIVColor(defIV))
  gui.text(emuWindow.leftPadding + 131 + textXOffset, emuWindow.topPadding + 90, "/")
  gui.text(emuWindow.leftPadding + 141 + textXOffset, emuWindow.topPadding + 90, string.format("%02d", spAtkIV),
    getIVColor(spAtkIV))
  gui.text(emuWindow.leftPadding + 161 + textXOffset, emuWindow.topPadding + 90, "/")
  gui.text(emuWindow.leftPadding + 171 + textXOffset, emuWindow.topPadding + 90, string.format("%02d", spDefIV),
    getIVColor(spDefIV))
  gui.text(emuWindow.leftPadding + 191 + textXOffset, emuWindow.topPadding + 90, "/")
  gui.text(emuWindow.leftPadding + 201 + textXOffset, emuWindow.topPadding + 90, string.format("%02d", spdIV),
    getIVColor(spdIV))

  gui.text(emuWindow.leftPadding + 1 + textXOffset, emuWindow.topPadding + 108,
    "HPower: " .. HPTypeNamesList[hpType + 1] .. " " .. hpPower)
end

function isEgg(addr)
  return read16Bit(addr + 0x12) == 0x601
end

function getEncounterSeed(seed)
  local tempSeed = seed

  for i = advancesHit, advances - 1 do
    tempSeed = LCRNG(tempSeed, 0xEEB9, 0xEB65, 0x0A3561A1)
  end

  return tempSeed
end

function getMethod(iv1, iv2, iv3, pid1, pid2)
  if iv1 == piv1 then
    if iv2 == piv2 then
      return 1
    elseif iv3 == piv2 then
      return 4
    end
  elseif iv2 == piv1 then
    if iv3 == piv2 then
      return 2
    end
  end

  return 0
end

function getEncounterMethod(PID, IVsValue)
  if prevPID ~= PID then
    prevPID = PID
    tempEncounterSeed = read32Bit(currSeedAddr)
    hitEncounterSeed = getEncounterSeed(tempEncounterSeed)
  end

  while rshift(PID, 16) ~= rshift(tempEncounterSeed, 16) do
    tempEncounterSeed = LCRNG(tempEncounterSeed, 0xEEB9, 0xEB65, 0x0A3561A1)
  end

  tempEncounterSeed = LCRNG(tempEncounterSeed, 0x41C6, 0x4E6D, 0x6073)
  iv1 = band(rshift(tempEncounterSeed, 16), 0x7FFF)
  tempEncounterSeed = LCRNG(tempEncounterSeed, 0x41C6, 0x4E6D, 0x6073)
  iv2 = band(rshift(tempEncounterSeed, 16), 0x7FFF)
  tempEncounterSeed = LCRNG(tempEncounterSeed, 0x41C6, 0x4E6D, 0x6073)
  iv3 = band(rshift(tempEncounterSeed, 16), 0x7FFF)
  piv1 = band(IVsValue, 0x7FFF)
  piv2 = band(rshift(IVsValue, 15), 0x7FFF)

  encounterMethod = getMethod(iv1, iv2, iv3, piv1, piv2)

  gui.text(emuWindow.rightPadding - 350, emuWindow.topPadding + 252, string.format("Method %d", encounterMethod))
  gui.text(emuWindow.rightPadding - 350, emuWindow.topPadding + 270, string.format("Hit Seed: %08X", hitEncounterSeed))
  gui.text(emuWindow.rightPadding - 350, emuWindow.topPadding + 288, string.format("Hit Advances: %d", advancesHit))
end

function shinyCheck(PID, addr)
  addr = addr or nil

  local trainerIDs = getTrainerIDs(addr)
  local highPID = floor(PID / 0x10000)
  local lowPID = PID % 0x10000
  local shinyTypeValue = bxor(bxor(trainerIDs[2], trainerIDs[1]), bxor(lowPID, highPID))

  if shinyTypeValue < 8 then
    if shinyTypeValue == 0 then
      return { "limegreen", " (Square)" }
    else
      return { "limegreen", " (Star)" }
    end
  else
    return { nil, "" }
  end
end

function showMoves(value1, value2)
  local move1Number = band(value1, 0xFFF)
  local move2Number = rshift(value1, 16)
  local move3Number = band(value2, 0xFFF)
  local move4Number = rshift(value2, 16)

  if move1Number <= 354 then
    gui.text(emuWindow.leftPadding + 1, emuWindow.topPadding + 162, "Move: " .. moveNamesList[move1Number + 1])
  end

  if move2Number <= 354 then
    gui.text(emuWindow.leftPadding + 1, emuWindow.topPadding + 180, "Move: " .. moveNamesList[move2Number + 1])
  end

  if move3Number <= 354 then
    gui.text(emuWindow.leftPadding + 1, emuWindow.topPadding + 198, "Move: " .. moveNamesList[move3Number + 1])
  end

  if move4Number <= 354 then
    gui.text(emuWindow.leftPadding + 1, emuWindow.topPadding + 216, "Move: " .. moveNamesList[move4Number + 1])
  end
end

function getPPColor(value)
  if value >= 1 and value <= 4 then
    return "orange"
  elseif value < 1 then
    return "red"
  else
    return nil
  end
end

function showPP(value)
  local PPmove1 = band(value, 0xFF)
  local PPmove2 = band(rshift(value, 8), 0xFF)
  local PPmove3 = band(rshift(value, 16), 0xFF)
  local PPmove4 = rshift(value, 24)

  gui.text(emuWindow.leftPadding + 210, emuWindow.topPadding + 162, "PP:")
  gui.text(emuWindow.leftPadding + 250, emuWindow.topPadding + 162, PPmove1, getPPColor(PPmove1))
  gui.text(emuWindow.leftPadding + 210, emuWindow.topPadding + 180, "PP:")
  gui.text(emuWindow.leftPadding + 250, emuWindow.topPadding + 180, PPmove2, getPPColor(PPmove2))
  gui.text(emuWindow.leftPadding + 210, emuWindow.topPadding + 198, "PP:")
  gui.text(emuWindow.leftPadding + 250, emuWindow.topPadding + 198, PPmove3, getPPColor(PPmove3))
  gui.text(emuWindow.leftPadding + 210, emuWindow.topPadding + 216, "PP:")
  gui.text(emuWindow.leftPadding + 250, emuWindow.topPadding + 216, PPmove4, getPPColor(PPmove4))
end

function showInfo(addr)
  local PID = read32Bit(addr)
  local shinyType = shinyCheck(PID, addr)
  local natureNumber = PID % 25
  local IDs = read32Bit(addr + 0x4)
  local orderIndex = PID % 24
  local decryptionKey = bxor(PID, IDs)
  local miscOffset = getMiscOffset(orderIndex)
  local growthOffset = getGrowthOffset(orderIndex)
  local attacksOffset = getAttacksOffset(orderIndex)

  local IVsAndAbilityValue = bxor(read32Bit(addr + 0x20 + miscOffset + 0x4), decryptionKey)
  local speciesAndItemValue = bxor(read32Bit(addr + 0x20 + growthOffset), decryptionKey)
  local moves1Value = bxor(read32Bit(addr + 0x20 + attacksOffset), decryptionKey)
  local moves2Value = bxor(read32Bit(addr + 0x20 + attacksOffset + 0x4), decryptionKey)
  local PPValue = bxor(read32Bit(addr + 0x20 + attacksOffset + 0x8), decryptionKey)

  local speciesDexIndex = band(speciesAndItemValue, 0xFFFF)
  local speciesDexNumber = nationalDexList[speciesDexIndex + 1]
  local speciesName = speciesNamesList[speciesDexNumber]

  local itemNumber = rshift(speciesAndItemValue, 16)
  local itemName = itemNamesList[itemNumber + 1]

  local abilityNumber = rshift(IVsAndAbilityValue, 0x1F) + 1
  local abilityName = "--"

  if speciesDexNumber ~= nil and speciesDexNumber < 387 and abilityNumber ~= nil then
    abilityName = abilityNamesList[pokemonAbilities[speciesDexNumber][abilityNumber]]
  end

  --[[if mode[index] == "Capture" then
  getEncounterMethod(PID, IVsAndAbilityValue)
 end]]

  if speciesName ~= nil then
    gui.text(emuWindow.leftPadding + 1, emuWindow.topPadding + 18, "Species: " .. speciesName)
  end

  gui.text(emuWindow.leftPadding + 1, emuWindow.topPadding + 36, "PID:")
  gui.text(emuWindow.leftPadding + 51, emuWindow.topPadding + 36, string.format("%08X%s", PID, shinyType[2]),
    shinyType[1])
  gui.text(emuWindow.leftPadding + 1, emuWindow.topPadding + 54, "Nature: " .. natureNamesList[natureNumber + 1])

  if abilityName ~= nil and abilityNumber ~= nil then
    gui.text(emuWindow.leftPadding + 1, emuWindow.topPadding + 72,
      string.format("Ability: %s (%d)", abilityName, abilityNumber))
  end

  showIVsAndHP(IVsAndAbilityValue)

  if itemName ~= nil then
    gui.text(emuWindow.leftPadding + 1, emuWindow.topPadding + 126, "Held item: " .. itemName)
  end

  showMoves(moves1Value, moves2Value)
  showPP(PPValue)
end

function showOpponentPokemonInfo()
  showInfo(wildAddr)
end

function isRoamerAtPlayerLocation(mapGroupNum1, mapGroupNum2)
  if mapGroupNum1 == mapGroupNum2 then
    return "limegreen"
  else
    return nil
  end
end

function showRoamerInfo()
  local roamerAddr = read32Bit(saveBlock1Addr) + 0x31DC
  local roamerIVsValue = read32Bit(roamerAddr)
  local roamerPID = read32Bit(roamerAddr + 0x4)
  local roamerShinyType = shinyCheck(roamerPID)
  local roamerNatureNumber = roamerPID % 25
  local roamerSpeciesIndex = read16Bit(roamerAddr + 0x8)
  local roamersDexNumber = nationalDexList[roamerSpeciesIndex + 1]
  local roamerSpeciesName = speciesNamesList[roamersDexNumber]
  local roamerHP = read16Bit(roamerAddr + 0xA)
  local roamerLevel = read8Bit(roamerAddr + 0xC)
  local roamerStatusIndex = read8Bit(roamerAddr + 0xD)
  local roamerStatus

  local roamerMapGroupNum = read16Bit(roamerMapGroupNumAddr)
  local roamerMapNum = rshift(roamerMapGroupNum, 8)
  local playerMapGroupNumAddr = read32Bit(saveBlock1Addr) + 0x4
  local playerMapGroupNum = read16Bit(playerMapGroupNumAddr)

  if roamerStatusIndex > 0 and roamerStatusIndex < 0x8 then
    roamerStatus = statusConditionNamesList[2]
  elseif roamerStatusIndex == 0x8 then
    roamerStatus = statusConditionNamesList[3]
  elseif roamerStatusIndex == 0x10 then
    roamerStatus = statusConditionNamesList[4]
  elseif roamerStatusIndex == 0x20 then
    roamerStatus = statusConditionNamesList[5]
  elseif roamerStatusIndex == 0x40 then
    roamerStatus = statusConditionNamesList[6]
  elseif roamerStatusIndex == 0x80 then
    roamerStatus = statusConditionNamesList[7]
  else
    roamerStatus = statusConditionNamesList[1]
  end

  local isRoamerActive = read8Bit(roamerAddr + 0x13) == 1

  if isRoamerActive then
    gui.text(emuWindow.leftPadding + 420, emuWindow.topPadding + 18, "Active Roamer? Yes")

    if roamerSpeciesName ~= nil then
      gui.text(emuWindow.leftPadding + 420, emuWindow.topPadding + 36, "Species: " .. roamerSpeciesName)
    end

    gui.text(emuWindow.leftPadding + 420, emuWindow.topPadding + 54, "PID:")
    gui.text(emuWindow.leftPadding + 470, emuWindow.topPadding + 54,
      string.format("%08X%s", roamerPID, roamerShinyType[2]), roamerShinyType[1])
    gui.text(emuWindow.leftPadding + 420, emuWindow.topPadding + 72, "Nature: " ..
      natureNamesList[roamerNatureNumber + 1])
    showIVsAndHP(band(roamerIVsValue, 0xFF), isRoamerActive)
    gui.text(emuWindow.leftPadding + 420, emuWindow.topPadding + 126, "HP: " .. roamerHP)
    gui.text(emuWindow.leftPadding + 420, emuWindow.topPadding + 144, "Level: " .. roamerLevel)
    gui.text(emuWindow.leftPadding + 420, emuWindow.topPadding + 162, "Status condition: " .. roamerStatus)
    gui.text(emuWindow.leftPadding + 420, emuWindow.topPadding + 180, "Current position:")
    gui.text(emuWindow.leftPadding + 420, emuWindow.topPadding + 198, locationNamesList[roamerMapNum + 1],
      isRoamerAtPlayerLocation(playerMapGroupNum, roamerMapGroupNum))
  else
    gui.text(emuWindow.leftPadding + 420, emuWindow.topPadding + 18, "Active Roamer? No")
  end
end

function getCatchRngStopInput()
  local key = input.get()

  if key["Number5"] or key["Keypad5"] then
    catchRngStop = true
    catchDelayCounter = 999
    catchDelay = 0
  end

  gui.text(emuWindow.rightPadding - 65, emuWindow.bottomPadding, "5 - Stop")
end

function getCatchDelay(isSafariZone)
  local key = joypad.get()
  local advancesDelay
  local safariOffset = 0
  local currSeed3

  getCatchRngStopInput()

  if isSafariZone then
    safariOffset = 80
  end

  if key.Select then
    startingCatchAdvances = advances
    catchDelayCounter = 0
    catchRngStop = false
    catchDelay = 0
    skips = 0
    oneTimeCatchRng = false
    currSeed2 = read32Bit(currSeedAddr)
  end

  if catchDelayCounter <= 200 and catchDelay == 0 and not catchRngStop then
    if read8Bit(catchCheckFlagAddr) == 0x40 and not oneTimeCatchRng then
      currSeed3 = read32Bit(currSeedAddr)

      while currSeed2 ~= currSeed3 do
        currSeed2 = LCRNG(currSeed2, 0x41C6, 0x4E6D, 0x6073)
        skips = skips + 1
      end

      oneTimeCatchRng = true
      advancesDelay = advances - startingCatchAdvances
    else
      currSeed2 = read32Bit(currSeedAddr)
    end

    if skips == 2 and advancesDelay > 120 - safariOffset then
      catchDelay = advancesDelay + 1
    elseif skips == 3 and advancesDelay > 120 - safariOffset then -- 0 shake
      catchDelay = advancesDelay
    elseif skips == 4 and advancesDelay > 120 - safariOffset then -- 1 shake
      catchDelay = advancesDelay - 1
    elseif skips == 5 and advancesDelay > 120 - safariOffset then -- 2 shake
      catchDelay = advancesDelay - 2
    elseif skips == 6 and advancesDelay > 120 - safariOffset then -- 3 shake
      catchDelay = advancesDelay - 3
    end

    catchDelayCounter = catchDelayCounter + 1
  end

  return catchDelay
end

function findCatchSeed(seed, delay)
  local tempSeed = seed

  for i = 1, delay do
    tempSeed = LCRNG(tempSeed, 0x41C6, 0x4E6D, 0x6073)
  end

  return tempSeed
end

function getCatchRate(speciesDexNumber, isSafariZone)
  local safariCatchFactorAddr

  if isSafariZone then
    safariCatchFactorAddr = read32Bit(safariCatchFactorPointerAddr) + 0x7C

    return floor((1275 * read8Bit(safariCatchFactorAddr)) / 100)
  else
    return catchRatesList[speciesDexNumber]
  end
end

function getBonusBall(speciesDexNumber, isSafariZone)
  local wildType = read8Bit(wildTypeAddr)
  local isUnderWater = read8Bit(isUnderWaterAddr) == 0x5
  local level = read8Bit(wildAddr + 0x54)
  local saveBlock2 = read32Bit(saveBlock2Addr)
  local dexCaughtMask = rshift(lshift(0x1000000, band((speciesDexNumber - 1), 7)), 24)
  local dexCaughtFlag = band(read8Bit(saveBlock2 + 0x28 + band(rshift(lshift(speciesDexNumber - 1, 16), 19), 0xFF)),
    dexCaughtMask)
  local battleTurnsCounter = read8Bit(battleTurnsCounterAddr)
  local selectedItem = read16Bit(selectedItemAddr)
  local isBallSelected = selectedItem > 0 and selectedItem < 13

  if wildType == 0x0B or wildType == 0x06 then -- net ball catch rate: 0x0B = Water, 0x06 = Bug
    ballRate[7] = 3
  else
    ballRate[7] = 1
  end

  if isUnderWater then -- dive ball catch rate
    ballRate[8] = 3.5
    -- gui.text(emuWindow.leftPadding + 1, emuWindow.topPadding + 165, "Undewater? Yes")
  else
    ballRate[8] = 1
    -- gui.text(emuWindow.leftPadding + 1, emuWindow.topPadding + 165, "Undewater? No")
  end

  if level < 30 then -- nest ball catch rate
    ballRate[9] = (40 - level) / 10
  else
    ballRate[9] = 1
  end

  if dexCaughtFlag ~= 0 then -- repeat ball catch rate
    ballRate[10] = 3
    --gui.text(emuWindow.leftPadding + 1, emuWindow.topPadding + 165, "Already Catched? Yes")
  else
    ballRate[10] = 1
    --gui.text(emuWindow.leftPadding + 1, emuWindow.topPadding + 165, "Already Catched? No")
  end

  if battleTurnsCounter < 30 then -- timer ball catch rate, bonusBall is x4 if battle turns are >= 30
    ballRate[11] = (battleTurnsCounter + 10) / 10
  else
    ballRate[11] = 4
  end

  if isSafariZone then
    return ballRate[6]
  end

  if isBallSelected then
    return ballRate[selectedItem + 1]
  else
    return 1
  end
end

function getBonusStatus()
  local status = read8Bit(wildAddr + 0x50)

  if status == 0 then
    bonusStatus = 1
  elseif (status > 0 and status < 0x8) or status == 0x20 then
    bonusStatus = 2
  else
    bonusStatus = 1.5
  end

  return bonusStatus
end

function calcCatchProb(isSafariZone)
  local speciesDexIndex = read16Bit(speciesDexIndexAddr)
  local speciesDexNumber = nationalDexList[speciesDexIndex + 1]

  local HPmax = read16Bit(wildAddr + 0x58)
  local HPcurrent = read16Bit(wildAddr + 0x56)
  local catchRate = getCatchRate(speciesDexNumber, isSafariZone)
  local bonusBall = getBonusBall(speciesDexNumber, isSafariZone)
  local bonusStatus = getBonusStatus()

  if HPmax == 0 then
    HPmax = 1
    HPcurrent = 1
  end

  local a = floor(((((3 * HPmax) - (2 * HPcurrent)) * catchRate * bonusBall) / (3 * HPmax)) * bonusStatus)

  if a == 0 then
    a = 1
  end

  local b = floor(1048560 / (sqrt(sqrt(16711680 / a))))

  return b
end

function findSureCatch(seed, catchProbability, isSafariZone)
  local tempSeed = seed
  local tempSeed1 = seed
  local delay = 0
  local ballShakes = 0

  while ballShakes ~= 4 do
    ballShakes = 0

    while rshift(tempSeed, 16) < catchProbability and ballShakes < 4 do
      ballShakes = ballShakes + 1
      tempSeed = LCRNG(tempSeed, 0x41C6, 0x4E6D, 0x6073)
    end

    if isSafariZone and delay % 2 ~= 0 then
      ballShakes = 0
    end

    tempSeed1 = LCRNG(tempSeed1, 0x41C6, 0x4E6D, 0x6073)
    tempSeed = tempSeed1

    if ballShakes ~= 4 then
      delay = delay + 1
    end
  end

  if isSafariZone then
    delay = delay / 2
  end

  return delay
end

function catchRng()
  local isSafariZone = read16Bit(safariZoneStepsCounterAddr) ~= 0
  local wildCatchDelay = getCatchDelay(isSafariZone)

  if wildCatchDelay <= 0 then
    gui.text(emuWindow.leftPadding + 1, emuWindow.height / 2, "Delay not calculated yet")
  else
    gui.text(emuWindow.leftPadding + 1, emuWindow.height / 2, "Delay calculated")
  end

  local catchSeed = findCatchSeed(read32Bit(currSeedAddr), wildCatchDelay)
  local sureCatchDelay

  if wildCatchDelay > 0 then
    sureCatchDelay = findSureCatch(catchSeed, calcCatchProb(isSafariZone), isSafariZone)

    gui.text(emuWindow.leftPadding, (emuWindow.height / 2) + 18, "100% catch missing advances: " .. sureCatchDelay)
  end
end

function showDayCareInfo()
  local eggCurrSeed = read32Bit(eggCurrSeedAddr)
  local timer = read32Bit(timerAddr)
  local calibration = (read32Bit(advancesAddr) - adjustAdvances) - timer
  local eggPIDAddr = read32Bit(eggPIDPointerAddr) + 0x988
  local eggPID = read32Bit(eggPIDAddr)
  local eggShinyType = shinyCheck(eggPID)
  local eggNatureNumber = eggPID % 25
  local eggStepsCounter = 255 - read8Bit(eggPIDAddr - 0x4)
  local eggFlagAddr = read32Bit(saveBlock1Addr) + 0x1280
  local isEggReady = band(rshift(read8Bit(eggFlagAddr), 6), 0x1) == 1

  if eggCurrSeed == 0 then
    base = calibration
    iter = 0
  elseif eggCurrSeed > 0 then
    if base == base and iter < 1 then
      iter = calibration - base - 5
    else
      base = calibration
    end
  end

  if not isEggReady then
    gui.text(emuWindow.leftPadding + 388, emuWindow.topPadding + 108, "Steps Counter: " .. eggStepsCounter)
    gui.text(emuWindow.leftPadding + 388, emuWindow.topPadding + 126, "Egg is not ready")
  end

  gui.text(emuWindow.leftPadding + 388, emuWindow.topPadding + 180, string.format("Egg Current Seed: %08X", eggCurrSeed))
  gui.text(emuWindow.leftPadding + 388, emuWindow.topPadding + 198, "Timer: " .. timer)
  gui.text(emuWindow.leftPadding + 388, emuWindow.topPadding + 216, "Calibration: " .. calibration + 1)

  if isEggReady then
    gui.text(emuWindow.leftPadding + 388, emuWindow.topPadding + 126, "Egg generated, go get it!")
    gui.text(emuWindow.leftPadding + 388, emuWindow.topPadding + 144, "Egg PID:")
    gui.text(emuWindow.leftPadding + 478, emuWindow.topPadding + 144, string.format("%08X%s", eggPID, eggShinyType[2]),
      eggShinyType[1])
    gui.text(emuWindow.leftPadding + 388, emuWindow.topPadding + 162, "Nature: " .. natureNamesList[eggNatureNumber + 1])

    if iter > 1 then
      gui.text(emuWindow.leftPadding + 388, emuWindow.topPadding + 234, string.format("Approx iter: %d", iter))
      gui.text(emuWindow.leftPadding + 388, emuWindow.topPadding + 252, "Stone worked!")
    else
      gui.text(emuWindow.leftPadding + 388, emuWindow.topPadding + 234, "First egg PID result")
      gui.text(emuWindow.leftPadding + 388, emuWindow.topPadding + 252, "Stone failed?")
    end
  elseif eggStepsCounter == 1 then
    gui.text(emuWindow.leftPadding + 388, emuWindow.topPadding + 144, "Next step might generate")
    gui.text(emuWindow.leftPadding + 388, emuWindow.topPadding + 162, "an egg!")
  elseif eggStepsCounter == 0 then
    gui.text(emuWindow.leftPadding + 388, emuWindow.topPadding + 144, "255th step taken")
  else
    gui.text(emuWindow.leftPadding + 388, emuWindow.topPadding + 144, "Keep on steppin'")
  end
end

function showPartyEggInfo()
  local partySlotsCounter = read8Bit(partySlotsCounterAddr) - 1
  local lastPartySlotAddr = partyAddr + (partySlotsCounter * 0x64)

  if isEgg(lastPartySlotAddr) then
    showInfo(lastPartySlotAddr)
  end
end

function writeCheck()
  initSeedWritten = true
end

memoryWriteCheck(writeCheck, 0x02020000)

function isTIDFound()
  local TID = read32Bit(0x02020000)

  for i = 1, table.getn(botTargetTIDs) do
    if TID == botTargetTIDs[i] then
      return true
    end
  end
  return false
end

function TIDBotLoop()
  initSeedWritten = false
  botOneTime = false

  while not TIDFound do
    savestate.save(0)
    joypad.set({ A = true })

    i = 0
    while not initSeedWritten and i < 40 do
      emu.frameadvance()
      i = i + 1
    end

    if initSeedWritten then
      --print(read16Bit(0x02020000))
      TIDFound = isTIDFound()
    end

    if not TIDFound then
      initSeedWritten = false
      savestate.load(0)
      emu.frameadvance()
    else
      break
    end
  end
end

function showFoundTID()
  local TID = read32Bit(0x02020000)

  if TIDFound then
    gui.text(emuWindow.leftPadding + 1, emuWindow.height / 2, "Found!")
    gui.text(emuWindow.leftPadding + 1, (emuWindow.height / 2) + 18, "TID: " .. TID)

    if not botOneTime then
      client.pause()
      botOneTime = true
    end
  end
end

function TIDBot()
  local key = joypad.get()

  if key.Start then
    TIDBotLoop()
  end

  showFoundTID()
end

function getInfoInput()
  leftInfoArrowColor = "gray"
  rightInfoArrowColor = "gray"

  local key = input.get()

  if (key["Number3"] or key["Keypad3"]) and (not prevKeyInfo["Number3"] and not prevKeyInfo["Keypad3"]) then
    leftInfoArrowColor = "orange"
    infoIndex = infoIndex - 1

    if infoIndex < 1 then
      infoIndex = 8
    end
  elseif (key["Number4"] or key["Keypad4"]) and (not prevKeyInfo["Number4"] and not prevKeyInfo["Keypad4"]) then
    rightInfoArrowColor = "orange"
    infoIndex = infoIndex + 1

    if infoIndex > 8 then
      infoIndex = 1
    end
  end

  prevKeyInfo = key
end

function showPokemonInfo()
  local partySlotsCounter
  local lastPartySlotAddr
  local partySelectedSlotNumber
  local partySelectedPokemonAddr
  local currBoxNumber
  local boxAddr
  local boxSelectedSlotNumber
  local boxSelectedPokemonAddr

  if infoMode[infoIndex] == "Gift" then
    partySlotsCounter = read8Bit(partySlotsCounterAddr) - 1
    lastPartySlotAddr = partyAddr + (partySlotsCounter * 0x64)

    showInfo(lastPartySlotAddr)
    showTrainerIDs(lastPartySlotAddr)
  elseif infoMode[infoIndex] == "Party" then
    partySelectedSlotNumber = read8Bit(partySelectedSlotNumberAddr)
    partySelectedPokemonAddr = partyAddr + (partySelectedSlotNumber * 0x64)

    showInfo(partySelectedPokemonAddr)
    showTrainerIDs(partySelectedPokemonAddr)
  elseif infoMode[infoIndex] == "Box" then
    currBoxNumber = read8Bit(read32Bit(currBoxNumberPointerAddr))
    boxAddr = read32Bit(currBoxNumberPointerAddr) + 0x4
    boxSelectedSlotNumber = read8Bit(boxSelectedSlotNumberAddr)
    boxSelectedPokemonAddr = boxAddr + (0x1E * currBoxNumber * 0x50) + (boxSelectedSlotNumber * 0x50)

    showInfo(boxSelectedPokemonAddr)
    showTrainerIDs(boxSelectedPokemonAddr)
  elseif infoMode[infoIndex] == "Battle Party Stats" then
    showInfo(pokemonBattleStatsScreenAddr)
    showTrainerIDs(pokemonBattleStatsScreenAddr)
  elseif infoMode[infoIndex] == "1st Floor Box Stats" then
    showInfo(pokemonStatsScreenAddr)
    showTrainerIDs(pokemonStatsScreenAddr)
  elseif infoMode[infoIndex] == "Party Stats" or infoMode[infoIndex] == "2nd Floor Box Stats" or infoMode[infoIndex] == "DayCare Box Stats" then
    showInfo(pokemonStatsScreen2Addr)
    showTrainerIDs(pokemonStatsScreen2Addr)
  end
end

function setInitseed()
  initSeed = userdata.get("seed")
  adjustAdvances = userdata.get("advances")
end

event.onloadstate(setInitseed)

while warning == "" do
  getScreenDimensions()
  getInput()
  gui.text(emuWindow.leftPadding + 1, emuWindow.topPadding, "Mode: " .. mode[index])
  drawArrowLeft(102, 0, leftArrowColor)
  gui.text((emuWindow.width / 2) - 21, emuWindow.topPadding, "1 - 2")
  drawArrowRight(140, 0, rightArrowColor)
  getInstructionsInput()
  getRoamerInput()
  getRngInfoInput()

  initSeed = read16Bit(initSeedAddr)
  currSeed = read32Bit(currSeedAddr)
  battleVideoSeed = read32Bit(battleVideoSeed1Addr)

  checkInitialSeedGeneration(initSeed, battleVideoSeed, currSeed)

  --[[if mode[index] == "Capture" then
  getEncounterAdvancesHit()
 end]]

  advances = read32Bit(advancesAddr) - adjustAdvances

  userdata.set("advances", adjustAdvances)
  userdata.set("seed", initSeed)

  if mode[index] == "Capture" or mode[index] == "Breeding" or mode[index] == "Pandora" or mode[index] == "Pokemon Info" then
    if showRngInfoText then
      showRngInfo(initSeed, currSeed, battleVideoSeed, advances)
    end

    if mode[index] ~= "Pokemon Info" then
      showTrainerIDs()
    end
  end

  if mode[index] == "Capture" then
    showOpponentPokemonInfo()

    if showRoamerInfoText then
      showRoamerInfo()
    end
  elseif mode[index] == "100% Catch" then
    catchRng()
  elseif mode[index] == "Breeding" then
    showDayCareInfo()
    showPartyEggInfo()
  elseif mode[index] == "Pandora" then
    gui.text(emuWindow.leftPadding + 1, emuWindow.bottomPadding - 72, "Temp TID: " .. initSeed)
  elseif mode[index] == "TID Bot" then
    TIDBot()
  elseif mode[index] == "Pokemon Info" then
    getInfoInput()
    gui.text((emuWindow.width / 2) - 63, emuWindow.bottomPadding - 54, "Mode: " .. infoMode[infoIndex])
    drawArrowLeft(187, 135, leftInfoArrowColor)
    gui.text((emuWindow.width / 2) + 230, emuWindow.bottomPadding - 54, "3 - 4")
    drawArrowRight(222, 135, rightInfoArrowColor)

    showPokemonInfo()
  end

  emu.frameadvance()
end
