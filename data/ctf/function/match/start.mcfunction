function admin:log/function {name: "match/start"}

#########################################
# GLOBAL

forceload add -200 -200 -72 -72

#########################################
# TAGS

tag @a remove lobby
tag @a remove dead
tag @a remove skip
tag @a remove ultimate
tag @a[tag=!spectator, tag=!lobby] add player

#########################################
# EFFECTS

effect clear @a[tag=!lobby]
effect give @a[tag=player] minecraft:saturation infinite 127 true
effect give @a[tag=!lobby] minecraft:blindness 10 0 true
effect give @a[tag=!lobby] minecraft:resistance 10 0 true

#########################################
# SCOREBOARDS

# Unique match identifier
scoreboard players add match match_id 1
scoreboard players operation @a[tag=!lobby] match_id = match match_id

# Rounds
scoreboard players set match rounds 0
scoreboard players set team_1 rounds 0
scoreboard players set team_2 rounds 0

# Kills and deaths counters
scoreboard players reset * deaths
scoreboard objectives setdisplay list deaths
scoreboard players reset * kills
scoreboard players set @a[tag=player] kills 0
scoreboard objectives setdisplay sidebar kills

# Money
scoreboard players set @a[tag=player] money 200

# Events
scoreboard players reset * just_used_totem
scoreboard players reset * just_died
scoreboard players reset * just_killed
scoreboard players reset * flag_placed
scoreboard players reset * flag_broken
scoreboard players reset * wall_flag_broken
scoreboard players reset * flag_dropped
scoreboard players reset * flag_pickedup
scoreboard players reset * just_placed_trap
scoreboard players reset * just_threw_grenade

# Ultimate
scoreboard players set @a[tag=player] ultimate_category 1

#########################################
# TEAMS

# Set the attacking and the defending sides
team empty team_1
team modify team_1 displayName "Attack"
team modify team_1 color red
team modify team_1 prefix "🪓 "
team modify team_1 suffix " 🪓"

team empty team_2
team modify team_2 displayName "defense"
team modify team_2 color blue
team modify team_2 prefix "⛨ "
team modify team_2 suffix " ⛨"

#########################################
# PLAYERS

clear @a[tag=!lobby]
stopsound @a[tag=!lobby]
tp @a[tag=!lobby] 0 100000 0

# Join teams 10 players
team join team_2 @r[tag=player]
team join team_1 @r[tag=player, team=!team_2]
team join team_2 @r[tag=player, team=!team_1]
team join team_1 @r[tag=player, team=!team_2]
team join team_2 @r[tag=player, team=!team_1]
team join team_1 @r[tag=player, team=!team_2]
team join team_2 @r[tag=player, team=!team_1]
team join team_1 @r[tag=player, team=!team_2]
team join team_2 @r[tag=player, team=!team_1]
team join team_1 @r[tag=player, team=!team_2]

tag team_1 add attack
tag @a[team=team_1] add attack
tag team_1 remove defense
tag @a[team=team_1] remove defense
tag team_2 add defense
tag @a[team=team_2] add defense
tag team_2 remove attack
tag @a[team=team_2] remove attack

#########################################
# GO TO THE MOST VOTED MAP

# Bossbar
bossbar set ctf:match value 0
bossbar set ctf:match visible true
bossbar set ctf:match players @a[tag=!lobby]
bossbar set ctf:match name {"text":"PREPARING...", "color": "yellow", "bold": true}
execute positioned as @a[tag=!lobby] run playsound entity.firework_rocket.launch ambient @s ~ ~ ~ 1 1

# Stop map music loops
schedule clear ctf:match/maps/test_map/music
schedule clear ctf:match/maps/green_mine/music
schedule clear ctf:match/maps/night_club/music
schedule clear ctf:match/maps/farm/music
schedule clear ctf:match/maps/railway_station/music

execute as @a[tag=spectator] run function ctf:match/spectate
execute as @a[tag=player] run function ctf:match/events/ultimate/reset_value

function ctf:match/maps/call_current {function: "start"}

function ctf:match/prepare/prepare

# schedule function ctf:match/warmup/start 60t
