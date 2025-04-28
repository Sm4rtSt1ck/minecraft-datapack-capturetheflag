say match/end_round/end

execute if score match rounds = swap rounds run function ctf:match/swap_teams
execute if score match rounds < max rounds run function ctf:match/freeze/start
execute if score match rounds >= max rounds run function ctf:match/end/start
