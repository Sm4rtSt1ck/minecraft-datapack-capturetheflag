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

function ctf:match/events/handle

#########################################
# TIMER

scoreboard players remove end_round timer 1
execute store result bossbar ctf:match value run scoreboard players get end_round timer
execute if score end_round timer matches -2147483648..0 run function ctf:match/end_round/end
execute if score end_round timer matches 10 as @a[tag=player, tag=ultimate] run function ctf:match/events/ultimate/end
