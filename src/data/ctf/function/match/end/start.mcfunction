from registry:world import PODIUM
function admin:log/function {name: "match/end/start"}

scoreboard players operation game state = end state
bossbar set ctf:match color pink
function #ctf:on/round_cleanup
# Tiemr to lobby 30 secs (300 ticks)
scoreboard players set end timer 300
bossbar set ctf:match max 300

execute as @a[tag=player] run function #ctf:on/player_reset
# ONLY AFTER ULTIMATE STOPPING (#ctf:on/player_reset)
clear @a[tag=player]

effect clear @a[tag=player]
effect give @a[tag=player] saturation infinite 127 true
effect give @a[tag=player] resistance infinite 127 true
effect give @a[tag=player] regeneration 1 127 true

execute as @a[team=team_1] run function ctf:match/end/sort_top_players
execute as @a[team=team_2] run function ctf:match/end/sort_top_players

#########################################
# TELEPORT TO PEDESTAL

for _winner, _loser in [("team_1", "team_2"), ("team_2", "team_1")]:
    # If the team wins (registry/world.bolt: PODIUM)
    for _top in ["top1", "top2", "top3"]:
        execute if score f"{_winner}" rounds > f"{_loser}" rounds run tp @a[team=f"{_winner}", tag=f"{_top}"] (PODIUM["winners"][0]) (PODIUM["winners"][1]) (PODIUM["winners"][2])
    for _i in range(3):
        _l = PODIUM["losers"][_i]
        execute if score f"{_winner}" rounds > f"{_loser}" rounds run tp @a[team=f"{_loser}", tag=f"top{_i + 1}"] (_l[0]) (_l[1]) (_l[2])
