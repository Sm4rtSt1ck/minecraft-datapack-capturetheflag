# #ctf:tick/combat (round, end_round)
execute as @a[scores={carrot_on_stick=1..}] if items entity @s weapon.mainhand carrot_on_a_stick[minecraft:custom_data={tags:["trap", "detector"]}] run function ctf_traps:internal/detector/place

# An attacker who sets a trap off (by walking or shooting) gets the kill credit (ctf_traps:internal/touch/<id>)
execute as @a[tag=player, tag=!dead, tag=!invisible] at @s if entity @e[type=frog, tag=trap.tnt, tag=trap_marker, distance=..2] run function ctf_traps:internal/touch/tnt
# Attack bots set traps off the same way (BOTS.md); defense bots never step into their own traps
execute as @e[type=zombified_piglin, tag=ctf_bot, tag=attack] at @s if entity @e[type=frog, tag=trap.tnt, tag=trap_marker, distance=..2] run function ctf_traps:internal/touch/tnt
# Any damage to a trap marker (shots, explosions, fire...) sets it off; a hit with the hand removes it
function ctf_traps:internal/hurt

execute as @a[tag=player, tag=!dead, tag=!invisible] at @s positioned ~-0.125 ~1 ~-0.125 if entity @e[type=frog, tag=trap.anvil, tag=trap_marker, dx=0.25, dy=256, dz=0.25] run function ctf_traps:internal/touch_anvil
execute as @e[type=zombified_piglin, tag=ctf_bot, tag=attack] at @s positioned ~-0.125 ~1 ~-0.125 if entity @e[type=frog, tag=trap.anvil, tag=trap_marker, dx=0.25, dy=256, dz=0.25] run function ctf_traps:internal/touch_anvil

# Falling anvils (ctf_traps:internal/anvil/trigger)
execute as @e[type=block_display, tag=trap_anvil_fall] at @s run function ctf_traps:internal/anvil/fall

execute at @a[tag=player, tag=!dead, tag=!invisible] as @e[type=frog, tag=trap.web, tag=trap_marker, tag=!triggered, distance=..2] run function ctf_traps:internal/web/trigger
execute at @e[type=zombified_piglin, tag=ctf_bot, tag=attack] as @e[type=frog, tag=trap.web, tag=trap_marker, tag=!triggered, distance=..2] run function ctf_traps:internal/web/trigger

execute as @a[tag=player, tag=!dead, tag=!invisible] at @s if entity @e[type=frog, tag=trap.levitation, tag=trap_marker, distance=..2] run function ctf_traps:internal/touch/levitation
execute as @a[tag=player, tag=!dead, tag=!invisible] at @s if entity @e[type=frog, tag=trap.wither, tag=trap_marker, distance=..2] run function ctf_traps:internal/touch/wither
execute as @e[type=zombified_piglin, tag=ctf_bot, tag=attack] at @s if entity @e[type=frog, tag=trap.levitation, tag=trap_marker, distance=..2] run function ctf_traps:internal/touch/levitation
execute as @e[type=zombified_piglin, tag=ctf_bot, tag=attack] at @s if entity @e[type=frog, tag=trap.wither, tag=trap_marker, distance=..2] run function ctf_traps:internal/touch/wither

function ctf_traps:tick/detector

execute as @e[type=armor_stand, tag=trap_display] positioned as @s unless entity @n[type=frog, tag=trap_marker, distance=1.2..1.5] run kill @s
