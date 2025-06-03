#########################################
# RESET ALL VARIABLES

scoreboard players reset * map_vote

#########################################
# COUNT SINGLE RESULTS FOR EVERY MAP

execute as @a run function ctf:lobby/vote/results/count_single

#########################################
# CALCULATE THE MAXIMUM NUMBER OF VOTES

scoreboard players operation max map_vote = total_map_1 map_vote
execute if score max map_vote < total_map_2 map_vote run scoreboard players operation max map_vote = total_map_2 map_vote
execute if score max map_vote < total_map_3 map_vote run scoreboard players operation max map_vote = total_map_3 map_vote
execute if score max map_vote < total_map_4 map_vote run scoreboard players operation max map_vote = total_map_4 map_vote
execute if score max map_vote < total_map_5 map_vote run scoreboard players operation max map_vote = total_map_5 map_vote
execute if score max map_vote < total_map_6 map_vote run scoreboard players operation max map_vote = total_map_6 map_vote
execute if score max map_vote < total_map_7 map_vote run scoreboard players operation max map_vote = total_map_7 map_vote
execute if score max map_vote < total_map_8 map_vote run scoreboard players operation max map_vote = total_map_8 map_vote

#########################################
# COUNT THE NUMBER OF MAPS WITH THE SAME MAXIMUM NUMBER OF VOTES

execute if score max map_vote = total_map_1 map_vote run scoreboard players add tie map_vote 1
execute if score max map_vote = total_map_2 map_vote run scoreboard players add tie map_vote 1
execute if score max map_vote = total_map_3 map_vote run scoreboard players add tie map_vote 1
execute if score max map_vote = total_map_4 map_vote run scoreboard players add tie map_vote 1
execute if score max map_vote = total_map_5 map_vote run scoreboard players add tie map_vote 1
execute if score max map_vote = total_map_6 map_vote run scoreboard players add tie map_vote 1
execute if score max map_vote = total_map_7 map_vote run scoreboard players add tie map_vote 1
execute if score max map_vote = total_map_8 map_vote run scoreboard players add tie map_vote 1

#########################################
# USING A RANDOM NUMBER IN CASE THERE ARE MULTIPLE WINNERS

scoreboard players operation choice map_vote = random number
scoreboard players operation choice map_vote %= tie map_vote
scoreboard players add choice map_vote 1

#########################################
# CALCULATE THE WINNING MAP

execute if score total_map_1 map_vote = max map_vote run scoreboard players remove choice map_vote 1
execute if score total_map_1 map_vote = max map_vote if score choice map_vote matches 0 run scoreboard players set result map_vote 1

execute if score total_map_2 map_vote = max map_vote run scoreboard players remove choice map_vote 1
execute if score total_map_2 map_vote = max map_vote if score choice map_vote matches 0 run scoreboard players set result map_vote 2

execute if score total_map_3 map_vote = max map_vote run scoreboard players remove choice map_vote 1
execute if score total_map_3 map_vote = max map_vote if score choice map_vote matches 0 run scoreboard players set result map_vote 3

execute if score total_map_4 map_vote = max map_vote run scoreboard players remove choice map_vote 1
execute if score total_map_4 map_vote = max map_vote if score choice map_vote matches 0 run scoreboard players set result map_vote 4

execute if score total_map_5 map_vote = max map_vote run scoreboard players remove choice map_vote 1
execute if score total_map_5 map_vote = max map_vote if score choice map_vote matches 0 run scoreboard players set result map_vote 5

execute if score total_map_6 map_vote = max map_vote run scoreboard players remove choice map_vote 1
execute if score total_map_6 map_vote = max map_vote if score choice map_vote matches 0 run scoreboard players set result map_vote 6

execute if score total_map_7 map_vote = max map_vote run scoreboard players remove choice map_vote 1
execute if score total_map_7 map_vote = max map_vote if score choice map_vote matches 0 run scoreboard players set result map_vote 7

execute if score total_map_8 map_vote = max map_vote run scoreboard players remove choice map_vote 1
execute if score total_map_8 map_vote = max map_vote if score choice map_vote matches 0 run scoreboard players set result map_vote 8

#########################################
# START THE MATCH

execute as @a run function ctf:match/start
