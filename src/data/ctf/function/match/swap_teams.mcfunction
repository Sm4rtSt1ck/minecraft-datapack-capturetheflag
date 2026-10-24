function admin:log/function {name: "match/swap_teams"}

scoreboard players operation game state = swap state
function #ctf:on/round_cleanup

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

# Modules: money of the new half
function #ctf:on/swap

title @a[tag=!lobby] title {"text":"SWAP TEAMS", "color": "green"}

gamemode spectator @a[tag=player]

execute as @a[tag=player] run function #ctf:on/player_reset
# ONLY AFTER ULTIMATE STOPPING (#ctf:on/player_reset)
clear @a[tag=player]

kill @e[tag=trap]


# Modules: the map is cloned, then warm-up (match start) or freeze (swap) starts
function #ctf:on/prepare

