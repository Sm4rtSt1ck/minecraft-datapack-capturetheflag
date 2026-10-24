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
execute at @e[type=armor_stand, tag=flag] run effect give @a[tag=attack, distance=..5] minecraft:darkness 2 1 true
execute at @e[type=armor_stand, tag=flag] run particle minecraft:white_smoke ~ ~0.8 ~ 0.3 0.6 0.3 0.01 5 normal

# Locked inventory (slots 9-35)
function ctf_shop:tick
function ctf_sniper:tick
function ctf_guns:tick

# Exit button in the crafting grid
execute as @a[tag=player, gamemode=!spectator] run function ctf_inv:exit/tick

# Hotbar layout and items on the ground
function ctf_inv:tick

#########################################
# TIMER

scoreboard players remove round timer 1
execute store result bossbar ctf:match value run scoreboard players get round timer

#########################################
# EVENTS

function ctf:match/events/handle

#########################################
# WIN LOGIC

# If all attack team is dead -> defense wins
execute unless entity @a[tag=!dead, tag=attack] run function ctf:match/round/win_defense

# If time is over -> defense wins
execute if score round timer matches -2147483648..0 run function ctf:match/round/win_defense

# If flag is stolen -> attack wins
execute positioned as @e[type=armor_stand, tag=win_trigger] as @a[tag=attack, distance=..2.5] if function ctf:match/helpers/has_banner run function ctf:match/events/flag/bring
