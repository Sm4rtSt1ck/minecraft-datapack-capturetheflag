#########################################
# RULES

# Instant tnt explosion
execute positioned as @e[type=tnt] run summon minecraft:creeper ~ ~ ~ {\
  Fuse:0,\
  ignited:1b,\
  ExplosionRadius:3\
}
kill @e[type=tnt]


# Blindness near the flag
execute at @e[type=armor_stand, tag=flag] run effect give @a[tag=attack, distance=..5] minecraft:blindness 2 1 true
execute at @e[type=armor_stand, tag=flag] run particle minecraft:ash ~ ~ ~ 0.5 1 0.5 0 20 normal

# Restrict picking up
function ctf:match/helpers/pickup_restrict

# Fill inventory
function ctf:match/helpers/inventory

#########################################
# TIMER

scoreboard players remove round timer 1
execute store result bossbar ctf:match value run scoreboard players get round timer

#########################################
# EVENTS

execute as @a[scores={flag_broken=1..}] run function ctf:match/events/flag/break
execute as @a[scores={wall_flag_broken=1..}] run function ctf:match/events/flag/break
execute as @a[scores={flag_dropped=1..}] run function ctf:match/events/flag/drop
execute as @a[scores={flag_pickedup=1..}] run function ctf:match/events/flag/pickup
execute as @a[scores={just_killed=1..}] run function ctf:match/events/fight/kill
execute as @a[scores={just_died=1..}] run function ctf:match/events/fight/die

#########################################
# WIN LOGIC

# If all attack team is dead -> defense wins
execute unless entity @a[tag=!dead, tag=attack] run function ctf:match/round/win_defense

# If time is over -> defense wins
execute if score round timer matches -2147483648..0 run function ctf:match/round/win_defense

# If flag is stolen -> attack wins
# This works via command_block and pressure plate above it (doesn't execute every tick, if only command_block activates)
# command for the command_block: execute as @a[tag=attack, nbt={Inventory:[{id:"minecraft:yellow_banner"}]}, distance=..4] if score game status matches 4 run function ctf:match/events/flag/bring
