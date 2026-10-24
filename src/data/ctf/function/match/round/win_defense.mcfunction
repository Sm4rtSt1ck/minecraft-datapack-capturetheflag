# Only once per round (several win conditions can happen in the same tick)
execute unless score game state = round state run return 0

title @a[tag=!lobby] title {"text": "Defending team wins!", "color": "blue"}
execute as @a[tag=defense] at @s run playsound entity.player.levelup ambient @s ~ ~ ~ 1 1
execute as @a[tag=attack] at @s run playsound entity.bee.death ambient @s ~ ~ ~ 1 1

execute if score match rounds < swap rounds run scoreboard players add team_2 rounds 1
execute if score match rounds >= swap rounds run scoreboard players add team_1 rounds 1

# 3 - all attackers are dead, 4 - the time is over
scoreboard players set #reason econ.tmp 3
execute if score round timer matches ..0 if entity @a[tag=attack, tag=!dead] run scoreboard players set #reason econ.tmp 4
function ctf_econ:round_end {winner: "defense", loser: "attack"}

function ctf:match/end_round/start
