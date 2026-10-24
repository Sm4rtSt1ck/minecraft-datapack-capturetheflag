# PARENT: lobby/vote/results/check
# This function counts the number of votes for each map when called for each player (registry MAPS)
from registry:maps import MAPS

for i in range(1, len(MAPS) + 1):
    execute if score @s map_vote_player matches (i) run scoreboard players add f"total_map_{i}" map_vote 1
