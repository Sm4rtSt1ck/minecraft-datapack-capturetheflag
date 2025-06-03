# PARENT: vote/results/check
# This function counts the number of votes for each map when called for each player

execute if score @s map_vote_player matches 1 run scoreboard players add total_map_1 map_vote 1
execute if score @s map_vote_player matches 2 run scoreboard players add total_map_2 map_vote 1
execute if score @s map_vote_player matches 3 run scoreboard players add total_map_3 map_vote 1
execute if score @s map_vote_player matches 4 run scoreboard players add total_map_4 map_vote 1
execute if score @s map_vote_player matches 5 run scoreboard players add total_map_5 map_vote 1
execute if score @s map_vote_player matches 6 run scoreboard players add total_map_6 map_vote 1
execute if score @s map_vote_player matches 7 run scoreboard players add total_map_7 map_vote 1
execute if score @s map_vote_player matches 8 run scoreboard players add total_map_8 map_vote 1
