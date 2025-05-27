function admin:log/function {name: "match/end_round/start"}

scoreboard players set game state 5


function ctf:match/helpers/update_score_display

scoreboard players add match rounds 1

# Timer to restart 7 secs (140 ticks)
scoreboard players set end_round timer 140
bossbar set ctf:match max 140

function ctf:match/maps/call_current {function: "end_round"}
