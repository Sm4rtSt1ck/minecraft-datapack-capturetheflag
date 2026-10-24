# Only once per round (several win conditions can happen in the same tick)
execute unless score game state = round state run return 0

title @a[tag=!lobby] title {"text": "Defending team wins!", "color": "blue"}
execute as @a[tag=defense] at @s run playsound entity.player.levelup ambient @s ~ ~ ~ 1 1
execute as @a[tag=attack] at @s run playsound entity.bee.death ambient @s ~ ~ ~ 1 1

execute if score match rounds < swap rounds run scoreboard players add team_2 rounds 1
execute if score match rounds >= swap rounds run scoreboard players add team_1 rounds 1

# reason: 3 - all attackers are dead, 4 - the time is over
data modify storage ctf:round won set value {winner: "defense", loser: "attack", reason: 3}
execute if score round timer matches ..0 if entity @a[tag=attack, tag=!dead] run data modify storage ctf:round won.reason set value 4
# Modules: round rewards
function #ctf:on/round_win

function ctf:match/end_round/start
