function admin:log/function {name: "match/end_round/start"}

scoreboard players operation game state = end_round state

effect clear @a[tag=player, nbt={Inventory:[{id:"minecraft:yellow_banner"}]}] minecraft:glowing


function ctf:match/helpers/update_score_display

scoreboard players add match rounds 1

# Timer to restart 7 secs (140 ticks)
scoreboard players set end_round timer 140
bossbar set ctf:match max 140

function ctf:match/maps/call_current {function: "end_round"}
