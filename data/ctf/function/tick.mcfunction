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

execute if score game state matches 2..7 as @a[tag=spectator] if entity @s[x=-201, y=-100, z=-250, dx=-100, dy=300, dz=300] at @s run tp @s ~1 ~ ~
execute if score game state matches 2..7 as @a[tag=spectator] if entity @s[x=-250, y=-100, z=-72, dx=300, dy=300, dz=100] at @s run tp @s ~ ~ ~-1
execute if score game state matches 2..7 as @a[tag=spectator] if entity @s[x=-72, y=-100, z=-250, dx=100, dy=300, dz=300] at @s run tp @s ~-1 ~ ~
execute if score game state matches 2..7 as @a[tag=spectator] if entity @s[x=-250, y=-100, z=-201, dx=300, dy=300, dz=-100] at @s run tp @s ~ ~ ~1
execute if score game state matches 2..7 as @a[tag=spectator] if entity @s[x=-250, y=-53, z=-250, dx=300, dy=-100, dz=300] at @s run tp @s ~ ~1 ~
execute if score game state matches 2..7 as @a[tag=spectator] if entity @s[x=-250, y=76, z=-250, dx=300, dy=100, dz=300] at @s run tp @s ~ ~-1 ~

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
