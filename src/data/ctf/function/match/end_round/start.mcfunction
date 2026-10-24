function admin:log/function {name: "match/end_round/start"}

scoreboard players operation game state = end_round state

function ctf:match/helpers/update_score_display

scoreboard players add match rounds 1

# Timer to restart 7 secs (140 ticks)
scoreboard players set end_round timer 140
bossbar set ctf:match max 140

# Modules: the flag carrier stops glowing, the map end_round
function #ctf:on/end_round_start
