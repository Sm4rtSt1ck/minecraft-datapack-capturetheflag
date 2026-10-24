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
effect give @a[tag=!lobby] minecraft:blindness 15 0 true
effect give @a[tag=!lobby] minecraft:levitation 15 0 true

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

execute as @a[tag=spectator] run function ctf:match/spectate

# Module settings (also loaded by ctf:load)
function #ctf:config
# Modules: starting money, event scores, ultimates, the map start (title, music)
function #ctf:on/match_start

# Modules: the map is cloned, then warm-up (match start) or freeze (swap) starts
function #ctf:on/prepare

