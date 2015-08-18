# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


consoles = ["Gameboy", "Gameboy Color", "Gameboy Advance", "Gamecube", "iOS",
            "Nintendo64", "NintendoDS", "Nintendo3DS", "PC", "PlayStation",
            "PS-2", "PS-3", "PS-4", "PS-P", "VITA", "XBox", "XBox360", "XBoxOne", "Wii", "Wii U"]

consoles.each do |console|
  Console.create(name: console)
end

Tag.create!([
  {label: "rpg"},
  {label: "stealth"},
  {label: "action"},
  {label: "adventure"},
  {label: "openworld"},
  {label: "shooter"},
  {label: "fps"},
  {label: "platform"},
  {label: "moba"},
  {label: "2d"},
  {label: "mmorpg"},
  {label: "cartoon"},
  {label: "racing"},
  {label: "minigames"},
  {label: "board game"},
  {label: "browser"},
  {label: "RTS"},
  {label: "fighting"},
  {label: "fantasy"}
])

user1 = User.create(
username: "jeffreycheng92",
password_digest: "$2a$10$KvfaMTvmJkg.doVmU4QZdet9gE9DWFYtAPiM/y6CkZrAquA0FqwZK",
email: "jeffreycheng92@gmail.com"
)

user2 = User.create!(
username: "guest",
password_digest: "$2a$10$BjlOdQ/67K2q3Glm4.7LP.a91iuAFDDPyH5jDAOfudSZF8KEcAjRm",
email: "guest@example.com"
)

user2.avatar.update({
  url: "http://res.cloudinary.com/jeffreycheng/image/upload/v1439571028/lsmk6lwp1ph355ulxlqx.jpg", thumbnail_url:"http://res.cloudinary.com/jeffreycheng/image/upload/t_media_lib_thumb/v1439571028/lsmk6lwp1ph355ulxlqx.jpg"
  })


Game.create(
title: "Super Smash Bros",
author_id: 1,
description: "Super Smash Bros., originally released in Japan as Nintendo All Star! Dairantō Smash Brothers, is a fighting game developed by HAL Laboratory and published by Nintendo for the Nintendo 64. It was released in Japan on January 21, 1999, in North America on April 26, 1999, and in Europe on November 19, 1999. Super Smash Bros. is the first game in the Super Smash Bros. series, followed by Super Smash Bros. Melee for GameCube in 2001, Super Smash Bros. Brawl for Wii in 2008, and Super Smash Bros. for Nintendo 3DS then Super Smash Bros. for Wii U in 2014.

The game is a crossover between many different Nintendo franchises such as Mario, Donkey Kong, The Legend of Zelda, Metroid, Yoshi, Mother, F-Zero, Star Fox, Kirby and Pokémon. It received mostly positive reviews from the media and was commercially successful, selling over 5 million copies worldwide by 2001, with 2.93 million sold in the United States and 1.97 million copies sold in Japan.

The Super Smash Bros. series is a departure from many fighting games; instead of winning by depleting an opponent's life bar, Smash Bros. players seek to knock opposing characters off a stage. Each player has a damage total, represented by a percentage, which rises as damage is taken and can exceed 100%, with a maximum damage of 999%. As this percentage rises, the character can be knocked progressively farther by an opponent's attacks. To KO an opponent, the player must send that character flying off the edge of the stage, which is not an enclosed arena but rather an area with open boundaries, many suspended in an otherwise empty space. When knocked off the stage, a character may use jumping moves in an attempt to return; some characters have longer-ranged jumps and may have an easier time recovering than others. Additionally, characters have different weights, making it harder for heavier opponents to be knocked off the edge, but reciprocally harder for them to recover once sent flying.",
developer: "Hal Laboratory",
release_date: "April 26, 1999",
rating: "10+"
)

Image.create(
  url: "http://res.cloudinary.com/jeffreycheng/image/upload/v1439772812/Super-smash-bros-boxart_ay4o8j.jpg",
  thumbnail_url:"http://res.cloudinary.com/jeffreycheng/image/upload/t_media_lib_thumb/v1439772812/Super-smash-bros-boxart_ay4o8j.jpg",
  imageable_id: 1,
  imageable_type: "Game"
)

GameConsole.create(
game_id: 1,
console_id: 6
)

Game.create(
title: "Counter-Strike: Global Offensive",
author_id: 1,
description: "Global Offensive is an objective-based multiplayer first-person shooter. Each player joins either the Terrorist or Counter-Terrorist team and attempts to complete objectives or eliminate the enemy team. The game operates in short rounds that end when all players on one side are dead or a team's objective is completed. For most game modes, once a player dies, they must wait until the round ends to respawn.

Players purchase weapons and equipment at the beginning of every round with money awarded based on their performance. Completing objectives or killing enemies earns the player money while negative actions, like killing a teammate or hostage, takes money away from the player. In addition, when a round ends all players receive some amount of money, with players on the winning team receiving substantially more.",
developer: "Hidden Path Entertainment, Valve Corporation",
release_date: "August 21, 2012",
rating: "M"
)

Image.create(
  url: "",
  thumbnail_url:"",
  imageable_id: 2,
  imageable_type: "Game"
)

GameConsole.create(
game_id: 2,
console_id: 9
)
GameConsole.create(
game_id: 2,
console_id: 17
)
GameConsole.create(
game_id: 2,
console_id: 12
)

Game.create(
title: "League of Legends",
author_id: "1",
description: "In League of Legends, players assume the role of an unseen \"summoner\" that controls a \"champion\" with unique abilities and battle against a team of other players or computer-controlled champions. In the most popular game modes, the goal is to destroy the opposing team's \"nexus\", a building which lies at the heart of a base protected by defensive structures. Each League of Legends game is discrete, with all champions starting off each game fairly weak and progressing by accumulating gold and experience over the course of the game.

League of Legends is a 3D, third-person multiplayer online battle arena (MOBA) game. In League of Legends, human or AI-controlled players each control a character, called a champion, and form two opposing teams.[10] In the most popular \"classic\" mode, each team begins with a central building, called a nexus, protected by defensive structures. The object of each game is to breach the opposing team's base and destroy their nexus. Each nexus will also occasionally spawn weak, autonomous attackers called \"minions\" that travel along paths called \"lanes\" toward the enemy base. Between the lanes lies an area called the \"jungle\", where neutral monsters reside that can be killed by both teams.",
developer: "Riot Games",
release_date: "October 27, 2009",
rating: "E"
)

Image.create(
  url: "",
  thumbnail_url:"",
  imageable_id: 3,
  imageable_type: "Game"
)

GameConsole.create(
game_id: 3,
console_id: 9
)

Game.create(
title: "Defense of the Ancients 2",
author_id: "1",
description: "Dota 2 is a multiplayer online battle arena (MOBA) game in a three-dimensional environment, presented from an oblique high-angle perspective. The player commands one of 110 controllable character \"Heroes\". Each Hero begins the match at level one and becomes more powerful by accumulating experience points through combat, thereby leveling up to the maximum level of twenty-five. With every level gained the player either selects a new ability for their Hero to learn or enhance their general statistics. Each Hero's method of combat is influenced by its primary property: Strength, Agility, or Intelligence.

Each match of Dota 2 takes place on a functionally symmetrical map that features the strongholds of two warring factions, the Radiant and the Dire. The Radiant is based at the southwest corner of the map, while the Dire is based at the northeast corner; the two sides are divided by a river that runs perpendicular to the central lane. These factions are defended by up to five players. In each stronghold is a critical structure called the \"Ancient\", a fountain that provide health and lesser structures. These bases are connected by three paths, referred to as \"lanes\"—two run alongside the edges of the map, while one runs directly between the two bases. The lanes are guarded by defensive Towers, as well as autonomous characters called \"creeps\", which periodically spawn in groups and travel along the lanes, attacking enemies they encounter. Featured across the map are hostile characters referred to as \"neutrals\", which are not aligned to either faction and are primarily located in the forests (primarily referred to as \"the jungle\" in the game, hence the term \"jungler\" for one who attacks neutral creeps in the jungle). Located in a tarn on the Dire side of the east part of the river is a neutral creep \"boss\" called \"Roshan\", who typically requires multiple team members to kill and drops the powerful item \"Aegis of Immortality\", and significant amounts of gold and experience.

Dota 2 features items, which the player stores in an inventory. These items are acquired predominantly through purchase with gold, the in-game currency. Items vary in function: some enhance the statistics of a Hero, while others grant additional abilities. The player automatically receives small increments of gold continuously, though they can obtain more by destroying enemies. Killing non-player characters grants gold only to the player who lands the final blow, whereas killing enemy Heroes grants gold to the player's nearby allies as well. Destroying Towers or killing Roshan gives gold to all players on the team. \"Denying\" is a feature of the game where players inhibit the enemy's ability to accumulate gold and experience by killing an allied unit or destroying an allied structure before the enemy can do so.",
developer: "Valve Corporation",
release_date: "July 9, 2013",
rating: "M"
)

Image.create(
  url: "",
  thumbnail_url:"",
  imageable_id: 4,
  imageable_type: "Game"
)

GameConsole.create(
game_id: 4,
console_id: 9
)

Game.create(
title: "Heroes of the Storm",
author_id: "1",
description: "Heroes of the Storm revolves around online 5-versus-5 matches, operated through Blizzard's online gaming service Battle.net. Players can choose from three game modes, which include playing with/against computer-controlled heroes or other players. When players first start the game, they may play 5 heroes provided by the free hero rotation, a methodically selected list that changes weekly, but by using gold, the in-game source of wealth, or through microtransactions, they can gain permanent access to a hero. Two additional heroes are available to players who have reached level 15. As of July 2015, there are currently 39 heroes in the game divided into 4 separate roles. Of the currently released maps, 6 of the 8 have the standard 3 main lanes where players can fight, while the others have only two main lanes, but a separate objective-based area. Killing enemy/neutral units and the opposing side's heroes grants experience points, which are shared with the entire team. When a certain experience threshold is reached for a team, each hero on that team levels up, acquiring slightly amplified statuses and gaining a talent point upon reaching levels 1, 4, 7, 10, 13, 16, and 20. Talent points allow players to customize their hero's abilities and generally result in large increase in power, especially for levels 10 and 20. This leveling system emphasizes the importance of teamwork, since a player's action can affect the whole team. Players can also mount different creatures, such as horses or unicorns, to increase their movement speed, automatically unmounting when dealing/receiving damage or using an ability. Minions at neutral camps can be defeated to gain mercenaries that fight for the player. Each map has a different side-objective that will help either team deal significant damage to the other.",
developer: "Blizzard Entertainment",
release_date: "June 2 2015",
rating: "T"
)

Image.create(
  url: "",
  thumbnail_url:"",
  imageable_id: 5,
  imageable_type: "Game"
)

GameConsole.create(
game_id: 5,
console_id: 9
)

Game.create(
title: "StarCraft",
author_id: 1,
description: "StarCraft is a military science fiction media franchise created by Chris Metzen and James Phinney, and owned by Blizzard Entertainment. The series centers on a galactic struggle for dominance between three species—the adaptable and mobile Terrans, the insectoid Zerg, and the enigmatic Protoss—in a distant part of the Milky Way galaxy known as the Koprulu Sector at the beginning of the 26th century. The series debuted with the video game StarCraft in 1998. Since then it has grown to include a number of other games as well as eight novelizations, two Amazing Stories articles, a board game, and other licensed merchandise such as collectible statues and toys.

The original game and its official expansion have been praised as one of the benchmark real-time strategy games of its time. The series has gathered a solid following around the world, particularly in South Korea, where professional players and teams participate in matches, earn sponsorships, and compete in televised matches. As of May 31, 2007, StarCraft and Brood War have sold almost 10 million copies combined. In addition, the series was awarded a star on the Walk of Game in 2006, and holds four Guinness World Records in the Guinness World Records Gamer's Edition of 2008.",
developer: "Blizzard Entertainment",
release_date: "March 31, 1998",
rating: "T"
)

Image.create(
  url: "",
  thumbnail_url:"",
  imageable_id: 6,
  imageable_type: "Game"
)

GameConsole.create(
game_id: 6,
console_id: 9
)

Game.create(
title: "World of Warcraft",
author_id: "1",
description: "World of Warcraft (WoW) is a massively multiplayer online role-playing game (MMORPG) created in 2004 by Blizzard Entertainment.

As with other MMORPGs, players control a character avatar within a game world in third- or first-person view, exploring the landscape, fighting various monsters, completing quests, and interacting with non-player characters (NPCs) or other players. Also similar to other MMORPGs, World of Warcraft requires the player to pay for a subscription, either by buying prepaid game cards for a selected amount of playing time, or by using a credit or debit card to pay on a regular basis.You may also get a trial account that lets you play to level 20 for free but has many features locked.

As characters become more developed, they gain various talents and skills, requiring the player to further define the abilities of that character. Characters can choose from a variety of professions, such as tailoring, blacksmithing, or mining. Characters can learn four secondary skills: archeology, cooking, fishing, and first-aid. Characters may form and join guilds, allowing characters within the guild access to the guild's chat channel, the guild name and optionally allowing other features, including a guild tabard, guild bank, and dues.",
developer: "Blizzard Entertainment",
release_date: "November 23, 2004",
rating: "T"
)

Image.create(
  url: "",
  thumbnail_url:"",
  imageable_id: 7,
  imageable_type: "Game"
)

GameConsole.create(
game_id: 7,
console_id: 9
)

Game.create(
title: "Pokemon Ruby Version",
author_id: "1",
description: "The basic mechanics of Ruby and Sapphire are largely the same as their predecessors'. As with all Pokémon games for hand-held consoles, gameplay is in third-person, overhead perspective and consists of three basic screens: a field map, in which the player navigates the main character; a battle screen; and the menu, in which the player configures his party, items, or gameplay settings. The player begins the game with one Pokémon, and can capture more using Poké Balls. The player can also use his/her Pokémon to battle other Pokémon. When the player encounters a wild Pokémon or is challenged by a trainer to a battle, the screen switches to a turn-based battle screen where the Pokémon fight. During battle, the player may fight, use an item, switch his/her active Pokémon, or flee (the last is not an option in battles against trainers). All Pokémon have hit points (HP); when a Pokémon's HP is reduced to zero, it faints and cannot battle until it is revived. If the player's Pokémon defeats the opposing Pokémon (causes it to faint), it receives experience points. After accumulating enough experience points, it may level up; most Pokémon evolve into a new species of Pokémon when they reach a certain level.

Apart from battling, capturing Pokémon is the most essential element of Pokémon gameplay. During battle with a wild Pokémon (other trainers' Pokémon cannot be captured), the player may use a Poké Ball on the wild Pokémon. If successful, the Pokémon will be added to the player's active party (or stored if the player already has the maximum six Pokémon in his/her party). Factors in the success rate of capture include the HP (and/or status effects such as Paralysis or Sleep,) of the target Pokémon and the strength of the Poké Ball used: the lower the target's HP and the stronger the Poké Ball, the higher the success rate of capture is.",
developer: "Game Freak",
release_date: "March 19, 2003",
rating: "E"
)

Image.create(
  url: "",
  thumbnail_url:"",
  imageable_id: 8,
  imageable_type: "Game"
)

GameConsole.create(
game_id: 8,
console_id: 3
)

Game.create(
title: "Pokemon Sapphire Version",
author_id: "1",
description: "The basic mechanics of Ruby and Sapphire are largely the same as their predecessors'. As with all Pokémon games for hand-held consoles, gameplay is in third-person, overhead perspective and consists of three basic screens: a field map, in which the player navigates the main character; a battle screen; and the menu, in which the player configures his party, items, or gameplay settings. The player begins the game with one Pokémon, and can capture more using Poké Balls. The player can also use his/her Pokémon to battle other Pokémon. When the player encounters a wild Pokémon or is challenged by a trainer to a battle, the screen switches to a turn-based battle screen where the Pokémon fight. During battle, the player may fight, use an item, switch his/her active Pokémon, or flee (the last is not an option in battles against trainers). All Pokémon have hit points (HP); when a Pokémon's HP is reduced to zero, it faints and cannot battle until it is revived. If the player's Pokémon defeats the opposing Pokémon (causes it to faint), it receives experience points. After accumulating enough experience points, it may level up; most Pokémon evolve into a new species of Pokémon when they reach a certain level.

Apart from battling, capturing Pokémon is the most essential element of Pokémon gameplay. During battle with a wild Pokémon (other trainers' Pokémon cannot be captured), the player may use a Poké Ball on the wild Pokémon. If successful, the Pokémon will be added to the player's active party (or stored if the player already has the maximum six Pokémon in his/her party). Factors in the success rate of capture include the HP (and/or status effects such as Paralysis or Sleep,) of the target Pokémon and the strength of the Poké Ball used: the lower the target's HP and the stronger the Poké Ball, the higher the success rate of capture is.",
developer: "Game Freak",
release_date: "March 19, 2003",
rating: "E"
)

Image.create(
  url: "",
  thumbnail_url:"",
  imageable_id: 9,
  imageable_type: "Game"
)

GameConsole.create(
game_id: 9,
console_id: 3
)

Game.create(
title: "Call of Duty",
author_id: "1",
description: "Call of Duty (commonly shortened to CoD) is a first-person video game franchise. As a first-person shooter, Call of Duty places the player in control of an infantry soldier who makes use of various authentic World War II firearms in combat. Each mission features a series of objectives which are marked on the heads-up display's compass; the player must complete all objectives to advance to the next mission. The player can save and load at any time, rather than the checkpoint system utilized in later Call of Duty games.

The player has two primary weapon slots, a handgun slot and can carry up to ten grenades (all of the later Call of Duty games feature only two weapon slots; a sidearm will fill one of these slots). Weapons may be exchanged with those found on the battlefield dropped by dead soldiers. Unlike later Call of Duty games, the first allows the player to toggle between different firing modes (single shot or automatic fire). Call of Duty was one of the early first-person shooters to feature iron sights in game play; by pressing the corresponding key the player aims down the actual sights on the gun for increased accuracy. In addition to weapons carried by the player, mounted machine guns and other fixed weapon emplacements are controllable by the player.

The game uses a standard health points system, with a limited amount of health reflected by a health bar. Medkits scattered throughout the levels or dropped by some foes are used to restore health when the player is injured. This contrasts with all subsequent Call of Duty games in which there is no health bar and the player's health recharges when not taking fire.",
developer: "Infinity Ward",
release_date: "October 29, 2003",
rating: "M"
)

Image.create(
  url: "",
  thumbnail_url:"",
  imageable_id: 10,
  imageable_type: "Game"
)

GameConsole.create(
game_id: 10,
console_id: 9
)
GameConsole.create(
game_id: 10,
console_id: 16
)
GameConsole.create(
game_id: 10,
console_id: 11
)

Game.create(
title: "Maple Story",
author_id: "1",
description: "MapleStory is a 2D scrolling platform game. The controls for the game are executed using the keyboard and mouse. The keyboard is used for many game functions, and much of it can be rearranged to suit users' needs. The mouse is mainly used to trigger NPCs and manipulate items. Like most MMORPGs, gameplay centers on venturing into dungeons and combating monsters in real-time. The players combat monsters and complete quests, in the process acquiring in-game currency called \"Mesos\", experience points and various items. Players are able to acquire in-game professions, allowing them to craft equipment, accessories or potions.

Players have a variety of options when interacting with others online: They can form parties where loot and experience are distributed from a monster; in-game marriages where the game will recognize the two players as a heterosexual couple; guilds which is indicated with a guild's name listed under their character name; or families, an architecture gathering of juniors and seniors. Players are also able to raise or lower the in-game popularity stat entitled Fame of other players and compete with other players in minigames, such as Gomoku or Concentration. They may also engage in trading activities for \"Mesos\" or other in-game items (though subject to virtual tax).",
developer: "Wizet",
release_date: "May 11, 2005",
rating: "10+"
)

Image.create(
  url: "",
  thumbnail_url:"",
  imageable_id: 11,
  imageable_type: "Game"
)

GameConsole.create(
game_id: 11,
console_id: 9
)

Game.create(
title: "Mario Party",
author_id: "1",
description: "Mario Party is a party video game series featuring Mario franchise characters in which four human- or computer-controlled characters compete in a board game interspersed with minigames.

Every game in the main series has a standard Party Mode in which up to four players play through a board, trying to collect as many stars as possible. In every turn, each player rolls a die and progresses on the board, which usually has branching paths. Coins are primarily earned by performing well in a minigame played at the end of each turn. On most boards, players earn stars by reaching a star space and purchasing a star for a certain amount of coins. The star space appears randomly on one of several pre-determined locations and moves every time a star is purchased, usually occupying a blue space.

Every Mario Party contains at least 50 to 90 minigames with a few different types. Four-player games are a free-for-all in which players compete individually. In 2-on-2 and 1-on-3 minigames, players compete as two groups, cooperating to win, even though they are still competing individually in the main game. Some minigames in Mario Party are 4-player co-op, even though it doesn't say it. In most situations, winners earn ten coins each.",
developer: "Hudson Soft",
release_date: "December 18, 1998",
rating: "E"
)

Image.create(
  url: "",
  thumbnail_url:"",
  imageable_id: 12,
  imageable_type: "Game"
)
GameConsole.create(
game_id: 12,
console_id: 6
)

Game.create(
title: "Runescape",
author_id: 1,
description: "RuneScape is a fantasy massively multiplayer online role-playing game (MMORPG) released in January 2001 by Andrew and Paul Gower, and developed and published by Jagex Games Studio. It is a graphical browser game implemented on the client-side in Java or HTML5, and incorporates 3D rendering. The game has had over 200 million accounts created and is recognised by the Guinness World Records as the world's largest free MMORPG and the most-updated game.

RuneScape takes place in the world of Gielinor, a medieval fantasy realm divided into different kingdoms, regions, and cities. Players can travel throughout Gielinor via a number of methods including on foot, magical spells, or charter ships. Each region offers different types of monsters, resources, and quests to challenge players. The game's fictional universe has also been explored through a tie-in video game on another of its maker's websites, FunOrb, Armies of Gielinor, and the novels Betrayal at Falador, Return to Canifis, and Legacy of Blood.

Players are represented in the game with customisable avatars. RuneScape does not follow a linear storyline; rather, players set their own goals and objectives. Players can choose to fight non-player character (NPC) monsters, complete quests, or increase their experience in the available skills. Players interact with each other through trading, chatting, or by participating in mini-games and activities, some of which are competitive or combative in nature, while others require cooperative or collaborative play.",
developer: "Jagex Game Studios",
release_date: "January 4, 2001",
rating: "T"
)

GameConsole.create(
game_id: 13,
console_id: 9
)

Game.create(
title: "Runescape 2",
author_id: 1,
description: "RuneScape is a fantasy massively multiplayer online role-playing game (MMORPG) released in January 2001 by Andrew and Paul Gower, and developed and published by Jagex Games Studio. It is a graphical browser game implemented on the client-side in Java or HTML5, and incorporates 3D rendering. The game has had over 200 million accounts created and is recognised by the Guinness World Records as the world's largest free MMORPG and the most-updated game.

RuneScape takes place in the world of Gielinor, a medieval fantasy realm divided into different kingdoms, regions, and cities. Players can travel throughout Gielinor via a number of methods including on foot, magical spells, or charter ships. Each region offers different types of monsters, resources, and quests to challenge players. The game's fictional universe has also been explored through a tie-in video game on another of its maker's websites, FunOrb, Armies of Gielinor, and the novels Betrayal at Falador, Return to Canifis, and Legacy of Blood.

Players are represented in the game with customisable avatars. RuneScape does not follow a linear storyline; rather, players set their own goals and objectives. Players can choose to fight non-player character (NPC) monsters, complete quests, or increase their experience in the available skills. Players interact with each other through trading, chatting, or by participating in mini-games and activities, some of which are competitive or combative in nature, while others require cooperative or collaborative play.",
developer: "Jagex Game Studios",
release_date: "March 29, 2004",
rating: "T"
)

GameConsole.create(
game_id: 14,
console_id: 9
)

Game.create(
title: "Runescape 3",
author_id: 1,
description: "RuneScape is a fantasy massively multiplayer online role-playing game (MMORPG) released in January 2001 by Andrew and Paul Gower, and developed and published by Jagex Games Studio. It is a graphical browser game implemented on the client-side in Java or HTML5, and incorporates 3D rendering. The game has had over 200 million accounts created and is recognised by the Guinness World Records as the world's largest free MMORPG and the most-updated game.

RuneScape takes place in the world of Gielinor, a medieval fantasy realm divided into different kingdoms, regions, and cities. Players can travel throughout Gielinor via a number of methods including on foot, magical spells, or charter ships. Each region offers different types of monsters, resources, and quests to challenge players. The game's fictional universe has also been explored through a tie-in video game on another of its maker's websites, FunOrb, Armies of Gielinor, and the novels Betrayal at Falador, Return to Canifis, and Legacy of Blood.

Players are represented in the game with customisable avatars. RuneScape does not follow a linear storyline; rather, players set their own goals and objectives. Players can choose to fight non-player character (NPC) monsters, complete quests, or increase their experience in the available skills. Players interact with each other through trading, chatting, or by participating in mini-games and activities, some of which are competitive or combative in nature, while others require cooperative or collaborative play.",
developer: "Jagex Game Studios",
release_date: "July 22, 2013",
rating: "T"
)

GameConsole.create(
game_id: 15,
console_id: 9
)

Game.create(
title: "Mario Kart 8",
author_id: 1,
description: "The game continues the traditional gameplay of the Mario Kart series, in which characters from the Mario universe race against each other in go-karts, attempting to hinder their opponents or improve their racing performance using various tools found in item boxes. Returning features from previous installments include motorbikes, and 12-player racing from Mario Kart Wii, as well as hang gliders, underwater racing, and vehicle customization from Mario Kart 7.

Mario Kart 8'​s new features include anti-gravity racing, in which certain parts of a track can allow racers to drive on walls and ceilings. During these sections, players can bump into other racers or special bumpers to trigger a Spin Boost, which gives them an extra speed boost. New characters include the Koopalings, Baby Rosalina, and Pink Gold Peach. New items include the Boomerang Flower, which can be thrown to attack players, the Piranha Plant, which attacks nearby racers and obstacles, the Crazy Eight, which gives the user eight items, and the Super Horn, which can be used both to attack nearby opponents and defend against items, including the previously nearly unavoidable Spiny Shell. There are a total of 48 tracks to race on. 25 of them were created for this game, and 23 appeared in previous Mario Kart games. Only 32 tracks were available at launch, but updates added 16 more.

Along with local multiplayer, Mario Kart 8 supports online multiplayer for up to twelve players, playable with friends, or with strangers both regionally and worldwide, with voice chat support outside of races. Players are able to set up tournaments with fully customizable rules and schedules, download ghost data from friends or top players, and receive stamps for use on Miiverse by beating staff times and completing Grand Prix races. Mario Kart TV lets the player view replay data from other players, including rewind and slow-motion playback functionality, and then upload highlights to YouTube.",
developer: "Nintendo EAD Group No. 1",
release_date: "May 30, 2014",
rating: "E"
)

Image.create(
  url: "",
  thumbnail_url:"",
  imageable_id: 16,
  imageable_type: "Game"
)

GameConsole.create(
game_id: 16,
console_id: 20
)

Game.create(
title: "Spyro the Dragon",
author_id: 1,
description: "Spyro the Dragon puts players in the control of the titular Spyro, as he travels across various worlds in order to rescue his fellow dragons, recover the stolen treasure, and defeat the evil Gnasty Gnorc. Spyro has two main attacks; breathing fire and charging with his horns, which must be strategically used for defeating enemies and smashing open crates. Charging can be used against many small enemies but not against larger enemies. Likewise, fire is capable of defeating larger enemies, but can be blocked by enemies that use metal armor. Spyro is also able to glide whilst jumping to reach new areas, with some levels allowing him to fly freely in the air. Spyro's health is represented by the color of his dragonfly partner, Sparx, who also helps him pick up nearby treasure. Taking damage will cause Sparx to lose his color and disappear, leaving Spyro vulnerable, but he can recover health by eating butterflies spawned from defeating small animals. Various treasure can be found in various areas, including inside treasure chests, some of which require certain techniques to break open, or earned by defeating enemies. Enemies that have already had their gems retrieved upon revisiting areas will instead release orbs that can be collected towards earning extra lives.

The game consists of various hub worlds, which is divided into various realms accessed by finding their gates. In order to progress to the next hub world, the player needs to fulfil the goal required by the balloonist in each world, such as a certain amount of treasure, rescued dragons, or dragon eggs. Most worlds contain dragons encased in stone, which can be rescued by touching them. Some of these dragons offer hints, and their platforms can be used to save the game. Eggs are in the possession of speedy blue thieves that must be chased down and defeated in order to recover them. In order to beat the game, the player must travel to the final homeworld, enter Gnasty Gnorc's lair, and defeat him. Upon Gnasty's defeat the player is presented with a closing cinematic and credits, then the player may now go to all worlds and realms in order to obtain each gem, egg, and release each dragon. Upon achieving 100% completion the player can access Gnasty's Loot.",
developer: "Insomniac Games",
release_date: "October 25, 2007",
rating: "E"
)

Image.create(
  url: "",
  thumbnail_url:"",
  imageable_id: 17,
  imageable_type: "Game"
)
GameConsole.create(
game_id: 17,
console_id: 10
)

Game.create(
title: "Spyro: Season of Ice",
author_id: 1,
description: "he objective of the game is to release fairies from their ice prisons and to progress from realm to realm before defeating Grendor. Spyro starts off in the Autumn Fairy Home one of the four seasonal fairy realms in the game. In the each realm, gems can be collected, critters like sheep can be destroyed for healing butterflies (and some to grant extra lives), special objects (like pumpkins) can be ignited, baskets can broken for more gems and Bianca and Hunter in various spots can give hints. Spyro can never die in the seasonal realms, with the fairy magic force protecting him from drowning in the water and no enemies present. The realms link to several places via portals. To access them, a number of fairies have to be procured, indicated next to the level name.

Some of the portals will go to levels which are similar in gameplay to the realms except they have enemies to destroy, dangerous territory that harms Spyro, water which Spyro can drown in and special encounters. There are always characters to talk with. One or two characters in a level will asks a request to do something in exchange for a fairy (often referring it to something other than a fairy like a diamond gem). In some levels Spyro can catch thieves, which can be tricky to do. When all enemies are destroyed, a portal appears and will take Spyro back to the seasonal realm he came from.

Some of the portals will go to a long stretching horizon landscape in which Spyro flies across. The game can be played in Normal and Hard modes, but both will have to be played and won to obtain two fairies. The object of these levels is to move around the screen, flying through hoops, destroying lines of enemies and scattered enemies in a set time limit. Destroying enemies with a different colour from the latter and going through hoops grants Spyro extra time. At the end of level, Spyro must face a boss or two and destroy them.",
developer: "Digital Eclipse",
release_date: "October 29, 2001",
rating: "E"
)

Image.create(
  url: "",
  thumbnail_url:"",
  imageable_id: 18,
  imageable_type: "Game"
)

GameConsole.create(
game_id: 18,
console_id: 3
)

Game.create(
title: "Super Mario Galaxy",
author_id: 1,
description: "Super Mario Galaxy is set in outer space, where Mario travels from galaxy to galaxy in order to collect Power Stars, which are earned by completing levels in galaxies or defeating enemies. Each galaxy contains a number of planets and other space matter for the player to explore. The game uses a new physics system that allows for a unique feature: each celestial object has its own gravitational force, allowing the player to completely circumnavigate rounded or irregular planetoids, walking sideways or upside down. The player can usually jump from one independent object and fall towards another one nearby. Though the main gameplay is in 3D, there are several areas in the game in which the player's movements are restricted to a 2-dimensional plane, an element reminiscent of 2D Mario games.",
developer: "Nintendo EAD Tokyo",
release_date: "November 12, 2007",
rating: "E",
)

Image.create(
  url: "",
  thumbnail_url:"",
  imageable_id: 19,
  imageable_type: "Game"
)

GameConsole.create(
game_id: 19,
console_id: 19
)

Game.create(
title: "Super Mario 64",
author_id: 1,
description: "Super Mario 64 is a 3D platformer where the player controls Mario through several courses. Each course is an enclosed world in which the player is free to wander in all directions and discover the environment without time limits. The worlds are filled with enemies that attack Mario as well as friendly creatures that provide assistance, offer information, or ask a favor (such as pink \"peace-loving\" Bob-omb Buddies). The player gathers stars in each course; some stars only appear after completing certain tasks, often hinted at by the name of the course. These challenges include defeating a boss, solving puzzles, racing an opponent, and gathering coins. As more stars are collected, more areas of the castle hub world become accessible. The player unlocks doors in the castle with keys obtained by defeating Bowser in special courses. There are many hidden mini-courses and other secrets to the game, most containing extra stars required for the full completion of the game.",
developer: "Nintendo",
release_date: "September 26, 1996",
rating: "E",
)

Image.create(
  url: "",
  thumbnail_url:"",
  imageable_id: 20,
  imageable_type: "Game"
)

GameConsole.create(
game_id: 20,
console_id: 6
)

Game.create(
title: "Assassin's Creed",
author_id: 1,
description: "Assassin's Creed is an action-adventure video game in which the player primarily assumes the role of Altaïr, as experienced by protagonist Desmond Miles. The primary goal of the game is to carry out a series of assassinations ordered by Al Mualim, the leader of the Assassins. To achieve this goal, the player must travel from the Brotherhood's headquarters in Masyaf, across the terrain of the Holy Land known as the Kingdom to one of three cities—Jerusalem, Acre, or Damascus—to find the Brotherhood agent in that city. There, the agent, in addition to providing a safe house, gives the player minimal knowledge about the target, and requires them to perform additional \"recon\" missions before attempting the assassination. These missions include: eavesdropping, interrogation, pickpocketing and completing tasks for informers and fellow assassins. Additionally, the player may take part in any number of side objectives in these open world environments, including climbing tall towers to map out the city, and saving citizens who are being threatened or harassed by the city guards. There are also various side quests that do not advance the plot such as hunting down and killing Templars and flag collecting. After completing each set of assassinations, the player is returned to the Brotherhood and rewarded with a better weapon and then given another set of targets, with the player free to select the order of certain targets.",
developer: "Ubisoft Montreal",
release_date: "November 13, 2007",
rating: "M"
)

Image.create(
  url: "",
  thumbnail_url:"",
  imageable_id: 21,
  imageable_type: "Game"
)

GameConsole.create(
game_id: 21,
console_id: 9
)
GameConsole.create(
game_id: 21,
console_id: 12
)
GameConsole.create(
game_id: 21,
console_id: 17
)

Game.create(
title: "Assassin's Creed II",
author_id: 1,
description: "he player directly controls the on-screen character through a third-person perspective, and can control the camera allowing for a 360° view of their surroundings. The game takes place in an open world environment with nonlinear gameplay, allowing the player to roam freely within several regions throughout late fifteenth-century Italy such as Venice, Florence, Forlì, San Gimignano, Rome (The Vatican only) and the Tuscan countryside. The Animus 2.0, a new version of the machine of the same name present in Assassin's Creed, provides in-game context for changes and additions to several game elements. A database is also available, providing extra historical information about key landmarks, characters and services that the player encounters. The health system has been made more dynamic, with synchronization to the Animus and causing the character to recover only from minor injuries.[1] More grievous injuries require visiting a street-side doctor or use of medicine (which can be purchased from doctors or found on bodies).

The player may now swim in water, and Eagle Vision—the ability to identify specific people and landmarks—can now be used in third-person view and while moving. A young Leonardo da Vinci is present in the game, aiding the player by creating new weapons from translated \"Codex pages\" that Altaïr, the original game's main character, left behind for future Assassins' analysis and insight. Within the game, the player will be able to use Leonardo's flying machine (based on real-life plans by Leonardo) during one mission. The player also has the ability to control a carriage in one level, and can row gondolas, as well as ride horses at any point in the game where they are readily available between towns and cities. The setting of the various places the player may go to have been made more detailed and in-depth; civilians sometimes cough or sneeze. Additionally, the player can hire different groups of NPCs, such as mercenaries, courtesans, or thieves; these groups can be used to fight, distract, or lure guards, respectively. A day and night cycle has been added to the game, giving the game more of a sense of time, in addition to setting missions and events at certain times of the day.

There are many ways to interact with NPCs. Money thrown to the ground, or a corpse carried and then deposited on the ground, may also serve as a distraction for both guards and peasants. There are also several different types of enemies, some more agile or stronger than others, and some of which will actively search hiding places where Ezio was last seen.",
developer: "Ubisoft Montreal",
release_date: "November 17, 2009",
rating: "M"
)

Image.create(
  url: "",
  thumbnail_url:"",
  imageable_id: 22,
  imageable_type: "Game"
)

GameConsole.create(
game_id: 22,
console_id: 9
)
GameConsole.create(
game_id: 22,
console_id: 12
)
GameConsole.create(
game_id: 22,
console_id: 17
)

Game.create(
title: "Crash Bandicoot",
author_id: 1,
description: "Crash Bandicoot is a platform game in which the player controls Crash Bandicoot, who must traverse the three islands of the game, defeat his creator Doctor Neo Cortex and rescue his girlfriend Tawna. The game is split up into levels, through which the player must progress one at a time to proceed in the game. The player is given a certain amount of lives, which are lost when Crash is attacked by an enemy or falls into water or a pit. If all lives are lost at any point in the game, the \"Game Over\" screen will appear, in which the player can continue from the last time they saved their progress by selecting \"Yes\".

Crash has the ability to jump into the air and land on an enemy character, as well as the ability to spin in a tornado-like fashion to knock enemies off-screen. An enemy that is attacked by Crash's spin attack can be launched into another enemy that is on-screen at the same time. These same techniques can be used to open the numerous boxes found in each stage. Most boxes in the game contain Wumpa Fruit, which give the player an extra life if 100 of them are collected. Another item found inside crates is the Witch Doctor's Mask, which shields Crash from one enemy attack. Collecting three of these masks in a row grants Crash temporary invulnerability from all minor dangers. Arrow boxes (marked with arrows pointing up) propel Crash further than his ordinary jump can, while TNT boxes explode after a three-second fuse when jumped on. Boxes with an exclamation mark (!) on them cause previously intangible objects in the area to solidify. Check Point boxes allow Crash to return to the point where the first Check Point box has been opened upon losing a life. If more than one Check Point box has been opened in a stage, Crash returns to the last Check Point box that has been opened.",
developer: "Naughty Dog",
release_date: "August 31, 1996",
rating: "E"
)

Image.create(
  url: "",
  thumbnail_url:"",
  imageable_id: 23,
  imageable_type: "Game"
)

GameConsole.create(
game_id: 23,
console_id: 10
)

Game.create(
title: "Borderlands",
author_id: 1,
description: "Borderlands includes character-building elements found in role-playing games, leading Gearbox to call the game a \"role-playing shooter\". At the start of the game, players select one of four characters, each with a unique special skill and with proficiencies with certain weapons. The four characters are: Roland the Soldier, Mordecai the Hunter, Lilith the Siren, and Brick the Berserker. From then on, players take on missions assigned through non-player characters or from bounty boards, each typically rewarding the player with experience points, money, and sometimes a reward item. Players earn experience by killing both human and non-human foes and completing in-game challenges (such as getting a certain number of kills using a specific type of weapon). As they gain levels from experience growth, players can then allocate skill points into a skill tree that features three distinct specializations of the base character; for example, Mordecai can become specialized in sniping, gunslinging with revolvers, or using his pet Bloodwing to assist in kills and health boosting. Players can distribute points among any of the specializations, and can also spend a small amount of in-game money to redistribute their skill points.

The game can be played alone, but also supports two-player cooperative play through split-screen (on consoles), and up to four players playing co-operatively online or over LAN. The game follows the progress of the host player, rewarding the other active players for completion of quests for their characters. If the other players are doing the same quests in their campaign, the completed quests remain the same in their campaign as well as the host's. When more players are present, the game alters the statistics of the generated enemies, balancing the game due to the larger number of players. Players can take part in one-on-one duels anywhere in the game world, or can visit arenas in the game world to participate in free-for-all, 2-on-2 or 3-on-1 combat battles with their fellow players.",
developer: "Gearbox Software",
release_date: "October 20, 2009",
rating: "M"
)

Image.create(
  url: "",
  thumbnail_url:"",
  imageable_id: 24,
  imageable_type: "Game"
)

GameConsole.create(
game_id: 24,
console_id: 9
)
GameConsole.create(
game_id: 24,
console_id: 13
)
GameConsole.create(
game_id: 24,
console_id: 17
)
