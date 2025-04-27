#########################################
# Set game settings

tag @s remove lobby
tag @s add player
clear @s
scoreboard players set game status 1
gamemode survival @s
effect clear @s
title @s subtitle {"text":"The game is being started!", "color": "yellow"}

# Set the attacking and the defending sides
team empty team_1
team modify team_1 friendlyFire false
team modify team_1 displayName "Attack"
team modify team_1 color red
team empty team_2
team modify team_2 friendlyFire false
team modify team_2 displayName "Defence"
team modify team_2 color blue

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

#########################################
# Go to the most voted map

execute if score @p map_vote matches 1 run function ctf:match/map/map_1/join
# execute if score @s[tag=admin] map_vote matches 2 run function ctf:match/map/map_2/join
