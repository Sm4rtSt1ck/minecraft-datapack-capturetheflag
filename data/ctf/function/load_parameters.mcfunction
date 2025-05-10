gamerule naturalRegeneration false
gamerule doImmediateRespawn true
gamerule mobGriefing false
gamerule doMobSpawning false
gamerule doFireTick false
gamerule commandBlockOutput false
gamerule keepInventory false
gamerule spectatorsGenerateChunks false
setworldspawn 0 -45 0
defaultgamemode adventure

forceload remove all

kill @e[tag=flag]
kill @e[tag=map_entity]
effect clear @a

team leave @a
team add team_1
team add team_2

scoreboard objectives add const dummy
scoreboard players set 2 const 2
scoreboard players set 3 const 3
scoreboard players set 4 const 4
scoreboard players set 5 const 5
scoreboard players set 6 const 6
scoreboard players set 7 const 7
scoreboard players set 8 const 8
scoreboard players set 9 const 9
scoreboard players set 10 const 10

scoreboard objectives add rounds dummy "Rounds"
scoreboard players set team_1 rounds 0
scoreboard players set team_2 rounds 0

scoreboard objectives add map_vote dummy "Map vote"
scoreboard players reset @a map_vote

# Game status (0 - lobby, 1 - vote, 2 - warmup, 3 - freeze, 4 - round, 5 - end_round, 6 - end)
scoreboard objectives add status dummy
# IMPORTANT! change to 0 after fully adding vote status
scoreboard players set game status 1

scoreboard players set max rounds 10
scoreboard players operation swap rounds = max rounds
scoreboard players operation swap rounds /= 2 const
# Timer
scoreboard objectives add timer dummy "Time"

scoreboard objectives add health health "hp"
scoreboard objectives modify health rendertype hearts
scoreboard objectives setdisplay below_name health
scoreboard objectives modify health numberformat styled {"color":"green"}
scoreboard objectives add money dummy "Money"

scoreboard objectives add kills playerKillCount "Kills"
scoreboard objectives add deaths deathCount "Deaths"
# Events
scoreboard objectives add just_killed playerKillCount
scoreboard objectives add just_died deathCount
scoreboard objectives add flag_placed minecraft.used:minecraft.armor_stand
scoreboard objectives add flag_dropped minecraft.dropped:minecraft.yellow_banner
scoreboard objectives add flag_pickedup minecraft.picked_up:minecraft.yellow_banner
scoreboard objectives add flag_broken minecraft.mined:minecraft.yellow_banner
scoreboard objectives add wall_flag_broken minecraft.mined:minecraft.yellow_wall_banner

bossbar remove ctf:match
bossbar add ctf:match ""
bossbar set ctf:match visible true
bossbar set ctf:match color purple
bossbar set ctf:match max 300
bossbar set ctf:match style notched_20

# Join to lobby
# tag @a remove lobby
function ctf:lobby/join_all
