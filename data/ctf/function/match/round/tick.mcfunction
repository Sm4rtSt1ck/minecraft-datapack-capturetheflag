#########################################
# RULES

item replace entity @a container.9 with minecraft:black_stained_glass_pane[custom_name='""',custom_data={tags:["shop"]}]
item replace entity @a container.10 with minecraft:black_stained_glass_pane[custom_name='""',custom_data={tags:["shop"]}]
item replace entity @a container.11 with minecraft:black_stained_glass_pane[custom_name='""',custom_data={tags:["shop"]}]
item replace entity @a container.12 with minecraft:black_stained_glass_pane[custom_name='""',custom_data={tags:["shop"]}]
item replace entity @a container.13 with minecraft:black_stained_glass_pane[custom_name='""',custom_data={tags:["shop"]}]
item replace entity @a container.14 with minecraft:black_stained_glass_pane[custom_name='""',custom_data={tags:["shop"]}]
item replace entity @a container.15 with minecraft:black_stained_glass_pane[custom_name='""',custom_data={tags:["shop"]}]
item replace entity @a container.16 with minecraft:black_stained_glass_pane[custom_name='""',custom_data={tags:["shop"]}]
item replace entity @a container.17 with minecraft:black_stained_glass_pane[custom_name='""',custom_data={tags:["shop"]}]
item replace entity @a container.18 with minecraft:black_stained_glass_pane[custom_name='""',custom_data={tags:["shop"]}]
item replace entity @a container.19 with minecraft:black_stained_glass_pane[custom_name='""',custom_data={tags:["shop"]}]
item replace entity @a container.20 with minecraft:black_stained_glass_pane[custom_name='""',custom_data={tags:["shop"]}]
item replace entity @a container.21 with minecraft:black_stained_glass_pane[custom_name='""',custom_data={tags:["shop"]}]
item replace entity @a container.22 with minecraft:black_stained_glass_pane[custom_name='""',custom_data={tags:["shop"]}]
item replace entity @a container.23 with minecraft:black_stained_glass_pane[custom_name='""',custom_data={tags:["shop"]}]
item replace entity @a container.24 with minecraft:black_stained_glass_pane[custom_name='""',custom_data={tags:["shop"]}]
item replace entity @a container.25 with minecraft:black_stained_glass_pane[custom_name='""',custom_data={tags:["shop"]}]
item replace entity @a container.26 with minecraft:black_stained_glass_pane[custom_name='""',custom_data={tags:["shop"]}]
item replace entity @a container.27 with minecraft:black_stained_glass_pane[custom_name='""',custom_data={tags:["shop"]}]
item replace entity @a container.28 with minecraft:black_stained_glass_pane[custom_name='""',custom_data={tags:["shop"]}]
item replace entity @a container.29 with minecraft:black_stained_glass_pane[custom_name='""',custom_data={tags:["shop"]}]
item replace entity @a container.30 with minecraft:black_stained_glass_pane[custom_name='""',custom_data={tags:["shop"]}]
item replace entity @a container.31 with minecraft:black_stained_glass_pane[custom_name='""',custom_data={tags:["shop"]}]
item replace entity @a container.32 with minecraft:black_stained_glass_pane[custom_name='""',custom_data={tags:["shop"]}]
item replace entity @a container.33 with minecraft:black_stained_glass_pane[custom_name='""',custom_data={tags:["shop"]}]
item replace entity @a container.34 with minecraft:black_stained_glass_pane[custom_name='""',custom_data={tags:["shop"]}]
item replace entity @a container.35 with minecraft:black_stained_glass_pane[custom_name='""',custom_data={tags:["shop"]}]
item replace entity @a container.36 with minecraft:black_stained_glass_pane[custom_name='""',custom_data={tags:["shop"]}]
kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{tags:["shop"]}}}}]

execute at @e[type=armor_stand, tag=flag] run effect give @a[tag=attack, distance=..5] minecraft:blindness 2 1 true

# Restrict picking up
function ctf:match/round/pickup_restrict

#########################################
# TIMER

scoreboard players remove round timer 1
execute store result bossbar ctf:match value run scoreboard players get round timer

#########################################
# EVENTS

execute as @a[scores={flag_broken=1..}] run function ctf:match/event/on_break_flag
execute as @a[scores={wall_flag_broken=1..}] run function ctf:match/event/on_break_flag
execute as @a[scores={flag_dropped=1..}] run function ctf:match/event/on_drop_flag
execute as @a[scores={flag_pickedup=1..}] run function ctf:match/event/on_pickup_flag
execute as @a[scores={just_killed=1..}] run function ctf:match/event/kill
execute as @a[scores={just_died=1..}] run function ctf:match/event/die

#########################################
# WIN LOGIC

# If all attack team is dead -> defense wins
execute unless entity @a[tag=!dead, tag=attack] run function ctf:match/round/win_defense

# If time is over -> defense wins
execute if score round timer matches -2147483648..0 run function ctf:match/round/win_defense

# If flag is stolen -> attack wins
# This works via command_block and pressure plate above it (doesn't execute every tick, if only command_block activates)
# command for the command_block: execute if entity @p[tag=attack, nbt={Inventory:[{id:"minecraft:yellow_banner"}]}] if score game status matches 4 run function ctf:match/round/win_attack
