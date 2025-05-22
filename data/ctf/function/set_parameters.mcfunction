#########################################
# GAMERULES AND WORLD PARAMETERS

gamerule naturalRegeneration false
gamerule doImmediateRespawn true
gamerule mobGriefing false
gamerule doMobSpawning false
gamerule doFireTick false
gamerule commandBlockOutput false
gamerule keepInventory false
gamerule spectatorsGenerateChunks false
gamerule fallDamage false
gamerule announceAdvancements false
gamerule doVinesSpread false

defaultgamemode adventure
setworldspawn 0 -41 0

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

# Game status (0 - lobby, 1 - vote, 2 - warmup, 3 - freeze, 4 - round, 5 - end_round, 6 - end)
scoreboard objectives add status dummy
# IMPORTANT! change to 0 after fully adding vote status
scoreboard players set game status 1

# Vote
scoreboard objectives add map_vote dummy {"text": "🎴 VOTES FOR MAPS 🎴", "color": "green", "bold": true}
scoreboard players reset * map_vote

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
scoreboard objectives add kills playerKillCount [{"text": "🌢", "color": "light_purple", "bold": false}, {"text": " KILLS ", "color": "#AA99FF", "bold": true}, {"text": "🌢", "color": "light_purple", "bold": false}]
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
# kill @e[tag=tnt_marker]

#########################################

# Join to lobby
function ctf:lobby/join_all
