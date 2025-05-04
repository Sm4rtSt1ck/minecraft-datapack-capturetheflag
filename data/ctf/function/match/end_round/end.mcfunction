say match/end_round/end

execute if score match rounds = swap rounds run function ctf:match/swap_teams
execute if score team_1 rounds <= swap rounds if score team_2 rounds <= swap rounds run function ctf:match/freeze/start

execute if score team_1 rounds > swap rounds run function ctf:match/end/win_team_1
execute if score team_2 rounds > swap rounds run function ctf:match/end/win_team_2

tag @a[tag=player] remove dead
