function admin:log/function {name: "match/end_round/start"}

scoreboard players set game state 5


function ctf:match/helpers/update_score_display

scoreboard players add match rounds 1

# Timer to restart 7 secs (140 ticks)
scoreboard players set end_round timer 140
bossbar set ctf:match max 140

execute if score result map_vote matches 1 run function ctf:match/maps/test_map/end_round
execute if score result map_vote matches 2 run function ctf:match/maps/green_mine/end_round
execute if score result map_vote matches 3 run function ctf:match/maps/night_club/end_round
execute if score result map_vote matches 4 run function ctf:match/maps/farm/end_round
