#########################################
# RULES

# Restrict picking up
function ctf:match/round/pickup_restrict

#########################################
# TIMER

scoreboard players remove round timer 1
execute store result bossbar ctf:match value run scoreboard players get round timer

#########################################
# EVENTS

execute as @a[scores={flag_broken=1..}] run function ctf:match/event/on_break_flag
execute as @a[scores={flag_dropped=1..}] run function ctf:match/event/on_drop_flag
execute as @a[scores={flag_pickedup=1..}] run function ctf:match/event/on_pickup_flag
execute as @a[scores={just_killed=1..}] run function ctf:match/event/kill
execute as @a[scores={just_died=1..}] run function ctf:match/event/die

#########################################
# WIN LOGIC

# If all attack team is dead -> defence wins
execute unless entity @a[tag=!dead, tag=attack] run function ctf:match/round/win_defence

# If flag is stolen -> attack wins
# This works via command_block and pressure plate above it (doesn't execute every tick, if only command_block activates)
# command for the command_block: execute if entity @p[tag=attack, nbt={Inventory:[{id:"minecraft:yellow_banner"}]}] if score game status matches 4 run function ctf:match/round/win_attack

# If time is over -> defence wins
execute if score round timer matches -2147483648..0 run function ctf:match/round/win_defence
