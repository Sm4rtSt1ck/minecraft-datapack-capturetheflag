say match/start
#########################################
# SET THE GAME SETTINGS

tag @s remove lobby
tag @s remove dead
tag @s add player
spawnpoint @s -190 -30 -190
clear @s
scoreboard players set match rounds 0
scoreboard players set team_1 rounds 0
scoreboard players set team_2 rounds 0
bossbar set ctf:match visible true
bossbar set ctf:match players @a[tag=!lobby]
title @s subtitle {"text":"Preparing the map!", "color": "yellow"}

scoreboard players set @a[tag=player] money 2000
scoreboard objectives setdisplay list kills
scoreboard players reset * deaths
scoreboard players reset * kills
# Display players with no kills
scoreboard players set @a[tag=player] kills 0

scoreboard players reset @a[tag=player] just_died
scoreboard players reset @a[tag=player] just_killed
scoreboard players reset @a[tag=player] flag_placed
scoreboard players reset @a[tag=player] flag_broken
scoreboard players reset @a[tag=player] flag_dropped
scoreboard players reset @a[tag=player] flag_pickedup

# Set the attacking and the defending sides
team empty team_1
team modify team_1 friendlyFire false
team modify team_1 displayName "Attack"
team modify team_1 color red
team modify team_1 nametagVisibility hideForOtherTeams
team empty team_2
team modify team_2 friendlyFire false
team modify team_2 displayName "defense"
team modify team_2 color blue
team modify team_2 nametagVisibility hideForOtherTeams

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

# execute if score @p map_vote matches 1 run function ctf:match/map/map_1/join
# execute if score @s[tag=admin] map_vote matches 2 run function ctf:match/map/map_2/join
execute if score @r[tag=admin] map_vote matches 1 run function ctf:match/map/map_1/prepare
execute if score @r[tag=admin] map_vote matches 2 run function ctf:match/map/map_2/prepare
schedule function ctf:match/warmup/start 5s
