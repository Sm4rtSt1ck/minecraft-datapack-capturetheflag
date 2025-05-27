function admin:log/function {name: "match/swap_teams"}

scoreboard players set game state 6

team modify team_1 displayName "defense"
team modify team_1 color blue
team modify team_1 prefix "⛨ "
team modify team_1 suffix " ⛨"
tag team_1 remove attack
tag team_1 add defense
tag @a[team=team_1] remove attack
tag @a[team=team_1] add defense

team modify team_2 displayName "Attack"
team modify team_2 color red
team modify team_2 prefix "🪓 "
team modify team_2 suffix " 🪓"
tag team_2 remove defense
tag team_2 add attack
tag @a[team=team_2] remove defense
tag @a[team=team_2] add attack

scoreboard players set @a[tag=player] money 200

title @a[tag=!lobby] title {"text":"SWAP TEAMS", "color": "green"}

clear @a[tag=player]
gamemode spectator @a[tag=player]

kill @e[tag=trap]

function ctf:match/prepare/prepare

# schedule function ctf:match/freeze/start 200t
# schedule function ctf:match/helpers/update_score_display 200t
