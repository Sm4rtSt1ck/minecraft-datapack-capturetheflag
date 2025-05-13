say match/swap_teams

team modify team_1 displayName "defense"
team modify team_1 color blue
tag team_1 remove attack
tag team_1 add defense
tag @a[team=team_1] remove attack
tag @a[team=team_1] add defense

team modify team_2 displayName "Attack"
team modify team_2 color red
tag team_2 remove defense
tag team_2 add attack
tag @a[team=team_2] remove defense
tag @a[team=team_2] add attack

scoreboard players set @a[tag=player] money 2000

title @a[tag=!lobby] title {"text":"SWAP TEAMS", "color": "green"}

clear @a[tag=player]
gamemode spectator @a[tag=player]

effect clear @a[tag=player] haste
effect give @a[tag=attack] minecraft:haste infinite 3 true

function ctf:match/prepare/prepare

schedule function ctf:match/freeze/start 200t
schedule function ctf:match/helpers/update_score_display 200t
