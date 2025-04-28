say match/start
#########################################
# SET THE GAME SETTINGS

tag @s remove lobby
tag @s add player
clear @s
scoreboard players set match rounds 0
bossbar set ctf:match visible true
bossbar set ctf:match players @a[tag=!lobby]
title @s subtitle {"text":"The game is being started!", "color": "yellow"}

# Set the attacking and the defending sides
team empty team_1
team modify team_1 friendlyFire false
team modify team_1 displayName "Attack"
team modify team_1 color red
team modify team_1 nametagVisibility hideForOtherTeams
team empty team_2
team modify team_2 friendlyFire false
team modify team_2 displayName "Defence"
team modify team_2 color blue
team modify team_2 nametagVisibility hideForOtherTeams

# Join teams 10 players
team join team_1 @r[tag=player]
team join team_2 @r[tag=player,team=!team_1]
team join team_1 @r[tag=player,team=!team_2]
team join team_2 @r[tag=player,team=!team_1]
team join team_1 @r[tag=player,team=!team_2]
team join team_2 @r[tag=player,team=!team_1]
team join team_1 @r[tag=player,team=!team_2]
team join team_2 @r[tag=player,team=!team_1]
team join team_1 @r[tag=player,team=!team_2]
team join team_2 @r[tag=player,team=!team_1]

tag team_1 add attack
tag @a[team=team_1] add attack
tag team_1 remove defence
tag @a[team=team_1] remove defence
tag team_2 add defence
tag @a[team=team_2] add defence
tag team_2 remove attack
tag @a[team=team_2] remove attack

#########################################
# GO TO THE MOST VOTED MAP

# execute if score @p map_vote matches 1 run function ctf:match/map/map_1/join
function ctf:match/warmup/start
# execute if score @s[tag=admin] map_vote matches 2 run function ctf:match/map/map_2/join
