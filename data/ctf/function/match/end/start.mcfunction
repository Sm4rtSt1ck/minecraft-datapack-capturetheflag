function admin:log/function {name: "match/end/start"}

scoreboard players set game state 7
# Tiemr to lobby 30 secs (300 ticks)
scoreboard players set end timer 600
bossbar set ctf:match max 600

kill @e[tag=flag]
kill @e[tag=trap]
kill @e[tag=map_entity]

clear @a[tag=player]

effect clear @a[tag=player]
effect give @a[tag=player] saturation infinite 127 true
effect give @a[tag=player] resistance infinite 127 true
effect give @a[tag=player] regeneration 1 127 true

execute as @a[team=team_1] run function ctf:match/end/sort_top_players
execute as @a[team=team_2] run function ctf:match/end/sort_top_players

#########################################
# TELEPORT TO PEDESTAL

# If team 1 wins
execute if score team_1 rounds > team_2 rounds run tp @a[team=team_1, tag=top1] -74 -48 -5
execute if score team_1 rounds > team_2 rounds run tp @a[team=team_1, tag=top2] -74 -48 -5
execute if score team_1 rounds > team_2 rounds run tp @a[team=team_1, tag=top3] -74 -48 -5

execute if score team_1 rounds > team_2 rounds run tp @a[team=team_2, tag=top1] -87 -48 -5
execute if score team_1 rounds > team_2 rounds run tp @a[team=team_2, tag=top2] -87 -49 -1
execute if score team_1 rounds > team_2 rounds run tp @a[team=team_2, tag=top3] -87 -50 -9

# If team 2 wins
execute if score team_2 rounds > team_1 rounds run tp @a[team=team_2, tag=top1] -74 -48 -5
execute if score team_2 rounds > team_1 rounds run tp @a[team=team_2, tag=top2] -74 -48 -5
execute if score team_2 rounds > team_1 rounds run tp @a[team=team_2, tag=top3] -74 -48 -5

execute if score team_2 rounds > team_1 rounds run tp @a[team=team_1, tag=top1] -87 -48 -5
execute if score team_2 rounds > team_1 rounds run tp @a[team=team_1, tag=top2] -87 -49 -1
execute if score team_2 rounds > team_1 rounds run tp @a[team=team_1, tag=top3] -87 -50 -9
