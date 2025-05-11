#########################################
# RULES

# Instant tnt explosion
execute positioned as @e[type=tnt] run summon minecraft:creeper ~ ~ ~ {\
  Fuse:0,\
  ignited:1b,\
  ExplosionRadius:3\
}
kill @e[type=tnt]

function ctf:match/helpers/pickup_restrict
function ctf:match/helpers/inventory

#########################################
# EVENTS

execute as @a[scores={flag_broken=1..}] run function ctf:match/event/break_flag
execute as @a[scores={wall_flag_broken=1..}] run function ctf:match/event/break_flag
execute as @a[scores={flag_dropped=1..}] run function ctf:match/event/drop_flag
execute as @a[scores={flag_pickedup=1..}] run function ctf:match/event/pickup_flag
execute as @a[scores={just_killed=1..}] run function ctf:match/event/kill
execute as @a[scores={just_died=1..}] run function ctf:match/event/die

#########################################
# TIMER

scoreboard players remove end_round timer 1
execute store result bossbar ctf:match value run scoreboard players get end_round timer
execute if score end_round timer matches 0 run function ctf:match/end_round/end
