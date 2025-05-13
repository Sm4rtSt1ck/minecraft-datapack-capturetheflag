say match/end_round/start

scoreboard players set game status 5


function ctf:match/helpers/update_score_display

scoreboard players add match rounds 1

# Timer to restart 7 secs (140 ticks)
scoreboard players set end_round timer 140
bossbar set ctf:match max 140

execute if score @r[tag=admin] map_vote matches 1 run function ctf:match/map/map_1/end_round
execute if score @r[tag=admin] map_vote matches 2 run function ctf:match/map/map_2/end_round
execute if score @r[tag=admin] map_vote matches 3 run function ctf:match/map/night_club/end_round
