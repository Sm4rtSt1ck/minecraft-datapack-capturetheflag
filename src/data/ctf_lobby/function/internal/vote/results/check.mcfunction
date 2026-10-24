# The maps: registry MAPS
from registry:maps import MAPS

#########################################
# RESET ALL VARIABLES

scoreboard players reset * map_vote

#########################################
# COUNT SINGLE RESULTS FOR EVERY MAP

execute as @a run function ctf_lobby:internal/vote/results/count_single

#########################################
# CALCULATE THE MAXIMUM NUMBER OF VOTES

scoreboard players operation max map_vote = total_map_1 map_vote
for i in range(2, len(MAPS) + 1):
    execute if score max map_vote < f"total_map_{i}" map_vote run scoreboard players operation max map_vote = f"total_map_{i}" map_vote

#########################################
# COUNT THE NUMBER OF MAPS WITH THE SAME MAXIMUM NUMBER OF VOTES

for i in range(1, len(MAPS) + 1):
    execute if score max map_vote = f"total_map_{i}" map_vote run scoreboard players add tie map_vote 1

#########################################
# USING A RANDOM NUMBER IN CASE THERE ARE MULTIPLE WINNERS

scoreboard players operation choice map_vote = random number
scoreboard players operation choice map_vote %= tie map_vote
scoreboard players add choice map_vote 1

#########################################
# CALCULATE THE WINNING MAP

for i in range(1, len(MAPS) + 1):
    execute if score f"total_map_{i}" map_vote = max map_vote run scoreboard players remove choice map_vote 1
    execute if score f"total_map_{i}" map_vote = max map_vote if score choice map_vote matches 0 run scoreboard players set result map_vote (i)

#########################################
# START THE MATCH

execute as @a run function ctf:match/start
