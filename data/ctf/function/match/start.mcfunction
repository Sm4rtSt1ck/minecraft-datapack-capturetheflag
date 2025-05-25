function admin:log/function {name: "match/start"}
#########################################
# SET THE GAME SETTINGS

forceload add -200 -200 -72 -72

kill @e[tag=trap]

tag @s remove lobby
tag @s remove dead
tag @s add player
clear @s

effect clear @a[tag=player]
effect give @a[tag=player] minecraft:saturation infinite 127 true
effect give @a[tag=attack] minecraft:haste infinite 40 true

scoreboard players add match match_id 1
scoreboard players operation @a[tag=!lobby] match_id = match match_id

scoreboard players set match rounds 0
scoreboard players set team_1 rounds 0
scoreboard players set team_2 rounds 0
bossbar set ctf:match value 0
bossbar set ctf:match visible true
bossbar set ctf:match players @a[tag=!lobby]
bossbar set ctf:match name {"text":"PREPARING...", "color": "yellow"}

scoreboard players set @a[tag=player] money 200
scoreboard objectives setdisplay list deaths
scoreboard players reset * deaths
scoreboard players reset * kills
# Display players with no kills
scoreboard players set @a[tag=player] kills 0

scoreboard players reset * just_used_totem
scoreboard players reset * just_died
scoreboard players reset * just_killed
scoreboard players reset * flag_placed
scoreboard players reset * flag_broken
scoreboard players reset * wall_flag_broken
scoreboard players reset * flag_dropped
scoreboard players reset * flag_pickedup
scoreboard players reset * just_placed_trap

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

function ctf:match/prepare/prepare
# schedule function ctf:match/warmup/start 60t
