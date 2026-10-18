# Only once per round (several win conditions can happen in the same tick)
execute unless score game state = round state run return 0

title @a[tag=!lobby] title {"text": "Attack team wins!", "color": "red"}
execute as @a[tag=attack] at @s run playsound entity.player.levelup ambient @s ~ ~ ~ 1 1
execute as @a[tag=defense] at @s run playsound entity.bee.death ambient @s ~ ~ ~ 1 1

execute if score match rounds < swap rounds run scoreboard players add team_1 rounds 1
execute if score match rounds >= swap rounds run scoreboard players add team_2 rounds 1

clear @a[tag=attack] minecraft:yellow_banner

effect clear @a[tag=attack] minecraft:glowing

# 1 - the flag was delivered (it was broken before), 2 - the flag was not placed
scoreboard players set #reason econ.tmp 2
execute if score broken flag_state matches 1 run scoreboard players set #reason econ.tmp 1
function ctf_econ:round_end {winner: "attack", loser: "defense"}

function ctf:match/end_round/start
