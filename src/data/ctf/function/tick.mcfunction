#########################################
# LOBBY TICKS

execute if entity @a[tag=lobby] run function #ctf:tick/lobby

#########################################
# MATCH TICKS

# Warm-up
execute if score game state = warmup state run function ctf:match/warmup/tick
# Freeze
execute if score game state = freeze state run function ctf:match/freeze/tick
# Round (after freeze and before win)
execute if score game state = round state run function ctf:match/round/tick
# End of round
execute if score game state = end_round state run function ctf:match/end_round/tick
# End of the match
execute if score game state = end state run function ctf:match/end/tick

# Check if there are no players in the match
execute if score game state matches 2..7 unless entity @a[tag=player] run function ctf:match/end/end

execute if score game state matches 2..7 run function ctf:match/keep_spectators_in_bounds

#########################################
# EVERY TICK: the exit button message, effects, loot crates, death camera (also used by the tests)

function #ctf:tick/global

#########################################
# GLOBAL EVENTS

execute as @a[scores={carrot_on_stick=1..}] positioned as @s run playsound ui.button.click ambient @s ~ ~ ~
scoreboard players set @a carrot_on_stick 0

execute as @a unless score @s had_left matches 0 run function ctf:events/player_join
