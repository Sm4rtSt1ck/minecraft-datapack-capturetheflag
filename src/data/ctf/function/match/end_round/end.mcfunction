function admin:log/function {name: "match/end_round/end"}

# Modules: the ultimates end (+80 points), loot crate rewards in the world (walls, stun traps,
# fire areas) are removed
function #ctf:on/end_round_end

tag @a[tag=player] remove dead
tag @a[tag=player] remove just_died

execute if score team_1 rounds <= swap rounds if score team_2 rounds <= swap rounds unless score match rounds = swap rounds run function ctf:match/freeze/start
execute if score match rounds = swap rounds run function ctf:match/swap_teams

execute if score team_1 rounds > swap rounds run function ctf:match/end/win_team_1
execute if score team_2 rounds > swap rounds run function ctf:match/end/win_team_2
