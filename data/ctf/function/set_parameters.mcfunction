#########################################
# GAMERULES AND WORLD PARAMETERS

# Mobs and world
gamerule doMobSpawning false
gamerule mobGriefing true
gamerule doMobLoot false
gamerule doVinesSpread false
gamerule doFireTick false
gamerule doDaylightCycle false
gamerule doWeatherCycle false
gamerule doTileDrops false
# Players
gamerule spawnRadius 0
gamerule fallDamage false
gamerule keepInventory false
gamerule naturalRegeneration false
gamerule doImmediateRespawn true
gamerule announceAdvancements false
gamerule spectatorsGenerateChunks false
# Commands and something else
gamerule commandBlockOutput false
gamerule sendCommandFeedback false
gamerule reducedDebugInfo true
gamerule commandModificationBlockLimit 2097152
# Other settings
difficulty normal
defaultgamemode adventure
setworldspawn 0 -41 0
time set noon
weather clear

#########################################
# TEAMS

team leave @a

team add lobby
team modify lobby color gold
team modify lobby collisionRule never
team modify lobby friendlyFire false
team modify lobby nametagVisibility hideForOtherTeams
team modify lobby deathMessageVisibility hideForOtherTeams
team modify lobby prefix "⚑ "
team modify lobby suffix " ⚑"

team add team_1
team modify team_1 friendlyFire true
team modify team_1 nametagVisibility hideForOtherTeams
team modify team_1 seeFriendlyInvisibles true

team add team_2
team modify team_2 friendlyFire true
team modify team_2 nametagVisibility hideForOtherTeams
team modify team_2 seeFriendlyInvisibles true

#########################################
# SCOREBOARDS

# Numbers
scoreboard objectives add number dummy
scoreboard players set 2 number 2

# Global events
scoreboard objectives add had_left minecraft.custom:minecraft.leave_game
scoreboard objectives add carrot_on_stick minecraft.used:minecraft.carrot_on_a_stick

# Game state (0 - lobby, 1 - vote, 2 - warmup, 3 - freeze, 4 - round, 5 - end_round, 6 - swap teams, 7 - end)
scoreboard objectives add state dummy
scoreboard players set lobby state 0
scoreboard players set vote state 1
scoreboard players set warmup state 2
scoreboard players set freeze state 3
scoreboard players set round state 4
scoreboard players set end_round state 5
scoreboard players set swap state 6
scoreboard players set end state 7
# IMPORTANT! change to lobby after fully adding vote state
scoreboard players operation game state = vote state

# Vote
scoreboard objectives add map_vote dummy
scoreboard objectives add map_vote_player dummy [\
    {"text": "🎴", "color": "light_purple", "bold": false}, \
    {"text": " VOTES FOR MAPS ", "color": "green", "bold": true}, \
    {"text": "🎴", "color": "light_purple", "bold": false}\
]
scoreboard players reset * map_vote_player

# Timer
scoreboard objectives add timer dummy "Time"

# Health
scoreboard objectives add health health "hp"
scoreboard objectives modify health rendertype hearts
scoreboard objectives setdisplay below_name health
scoreboard objectives modify health numberformat styled {"color":"yellow"}

# Unique match identifier to check if a player is in the match
scoreboard objectives add match_id dummy
# To prevent bla bla lba
scoreboard players add match match_id 1

# Rounds
scoreboard objectives add rounds dummy "Rounds"
scoreboard players set max rounds 10
scoreboard players operation swap rounds = max rounds
scoreboard players operation swap rounds /= 2 number
scoreboard players set team_1 rounds 0
scoreboard players set team_2 rounds 0

# Money
scoreboard objectives add money dummy "Money"

# Kills and deaths counters
scoreboard objectives add kills playerKillCount [\
    {"text": "🌢", "color": "light_purple", "bold": false}, \
    {"text": " KILLS ", "color": "#AA99FF", "bold": true}, \
    {"text": "🌢", "color": "light_purple", "bold": false}\
]
scoreboard objectives add deaths deathCount {"text": "Deaths", "color": "red"}

# Match events
scoreboard objectives add just_killed playerKillCount
scoreboard objectives add just_died deathCount
scoreboard objectives add just_used_totem minecraft.used:minecraft.totem_of_undying
scoreboard objectives add flag_placed minecraft.used:minecraft.armor_stand
scoreboard objectives add flag_dropped minecraft.dropped:minecraft.yellow_banner
scoreboard objectives add flag_pickedup minecraft.picked_up:minecraft.yellow_banner
scoreboard objectives add flag_broken minecraft.mined:minecraft.yellow_banner
scoreboard objectives add wall_flag_broken minecraft.mined:minecraft.yellow_wall_banner
scoreboard objectives add just_placed_trap minecraft.used:minecraft.frog_spawn_egg
scoreboard objectives add just_threw_grenade minecraft.used:minecraft.lingering_potion
scoreboard objectives add just_used_chorus minecraft.used:minecraft.chorus_fruit

# Shop
scoreboard objectives add shop_category dummy
scoreboard objectives add bought.item dummy

#########################################
# BOSSBAR

bossbar remove ctf:match
bossbar add ctf:match ""
bossbar set ctf:match visible true
bossbar set ctf:match color pink
bossbar set ctf:match max 300
bossbar set ctf:match style notched_10

#########################################
# OTHER

forceload remove all

kill @e[tag=flag]
kill @e[tag=map_entity]
kill @e[tag=clone_marker]
kill @e[tag=lastDeathMarker]
kill @e[tag=trap]
kill @e[tag=win_trigger]

#########################################

# Join to lobby
function ctf:lobby/join_all
