title @a[tag=!lobby] title {"text": "Defending team wins!", "color": "blue"}

execute if entity @a[tag=defence, team=team_1] run scoreboard players add team_1 rounds 1
execute if entity @a[tag=defence, team=team_2] run scoreboard players add team_2 rounds 1

function ctf:match/end_round/start
