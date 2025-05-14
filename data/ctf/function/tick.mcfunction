#########################################
# LOBBY TICKS

execute if score game status matches 0..1 run function ctf:lobby/tick

# Vote
execute if score game status matches 1 as @a[tag=lobby] run function ctf:lobby/vote/tick

#########################################
# MATCH TICKS

# Warm-up
execute if score game status matches 2 run function ctf:match/warmup/tick
# Freeze
execute if score game status matches 3 run function ctf:match/freeze/tick
# Round (after freeze and before win)
execute if score game status matches 4 run function ctf:match/round/tick
# End of round
execute if score game status matches 5 run function ctf:match/end_round/tick
# End of the match
execute if score game status matches 6 run function ctf:match/end/tick

# Check if there are no players in the match
execute if score game status matches 2..6 unless entity @a[tag=player] run function ctf:match/end/end

#########################################
# GLOBAL EVENTS

execute as @a unless score @s had_left matches 0 run function ctf:events/player_join
