#########################################
# LOBBY TICKS

execute if score game state matches 0..1 run function ctf:lobby/tick

# Vote
execute if score game state matches 1 run function ctf:lobby/vote/tick

#########################################
# MATCH TICKS

# Warm-up
execute if score game state matches 2 run function ctf:match/warmup/tick
# Freeze
execute if score game state matches 3 run function ctf:match/freeze/tick
# Round (after freeze and before win)
execute if score game state matches 4 run function ctf:match/round/tick
# End of round
execute if score game state matches 5 run function ctf:match/end_round/tick
# End of the match
execute if score game state matches 7 run function ctf:match/end/tick

# Check if there are no players in the match
execute if score game state matches 2..7 unless entity @a[tag=player] run function ctf:match/end/end

# Global match events
execute as @a[scores={carrot_on_stick=1..}] positioned as @s run playsound ui.button.click ambient @s ~ ~ ~

execute as @a[scores={carrot_on_stick=1..}] if items entity @s weapon.mainhand carrot_on_a_stick[custom_data={action:"exit"}] run \
    tellraw @s [\
        {"text": "To exit, press ", "color": "gold"}, \
        {"text": "here", "color": "red", "clickEvent": {"action": "run_command", "value": "/function ctf:lobby/join"}, \
        "hoverEvent": {"action": "show_text", "contents": "*click*"}}\
    ]

#########################################
# GLOBAL EVENTS

execute as @a unless score @s had_left matches 0 run function ctf:events/player_join

scoreboard players set @a carrot_on_stick 0
