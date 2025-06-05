function admin:log/function {name: "match/end_round/end"}

execute as @a[tag=player, tag=ultimate] run function ctf:match/events/ultimate/end
execute as @a[tag=player] run function ctf:match/events/ultimate/add_point {points: 80}

tag @a[tag=player] remove dead

execute if score team_1 rounds <= swap rounds if score team_2 rounds <= swap rounds unless score match rounds = swap rounds run function ctf:match/freeze/start
execute if score match rounds = swap rounds run function ctf:match/swap_teams

execute if score team_1 rounds > swap rounds run function ctf:match/end/win_team_1
execute if score team_2 rounds > swap rounds run function ctf:match/end/win_team_2
