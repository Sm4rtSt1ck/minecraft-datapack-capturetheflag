title @a[tag=!lobby] title {"text": "Attack team wins!", "color": "red"}

execute if entity @a[tag=attack, team=team_1] run scoreboard players add team_1 rounds 1
execute if entity @a[tag=attack, team=team_2] run scoreboard players add team_2 rounds 1

clear @a[tag=attack] minecraft:yellow_banner

effect clear @a[tag=attack] minecraft:glowing

scoreboard players add @a[tag=attack] money 2500
scoreboard players add @a[tag=defense] money 2500

function ctf:match/end_round/start
