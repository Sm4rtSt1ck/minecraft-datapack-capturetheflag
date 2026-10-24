# #ctf:tick/combat (round, end_round)
execute as @a[scores={carrot_on_stick=1..}] if items entity @s weapon.mainhand carrot_on_a_stick[minecraft:custom_data={tags:["trap", "detector"]}] run function ctf:match/events/traps/detector/place

# An attacker who sets a trap off (by walking or shooting) gets the kill credit (ctf:match/events/traps/touch)
execute as @a[tag=player, tag=!dead, tag=!invisible] at @s if entity @e[type=frog, tag=trap.tnt, tag=trap_marker, distance=..2] run function ctf:match/events/traps/touch {trap: "tnt"}
# Any damage to a trap marker (shots, explosions, fire...) sets it off; a hit with the hand removes it
function ctf:match/events/traps/hurt

execute as @a[tag=player, tag=!dead, tag=!invisible] at @s positioned ~-0.125 ~1 ~-0.125 if entity @e[type=frog, tag=trap.anvil, tag=trap_marker, dx=0.25, dy=256, dz=0.25] run function ctf:match/events/traps/touch_anvil

execute at @a[tag=player, tag=!dead, tag=!invisible] as @e[type=frog, tag=trap.web, tag=trap_marker, tag=!triggered, distance=..2] run function ctf:match/events/traps/web/trigger

execute as @a[tag=player, tag=!dead, tag=!invisible] at @s if entity @e[type=frog, tag=trap.levitation, tag=trap_marker, distance=..2] run function ctf:match/events/traps/touch {trap: "levitation"}
execute as @a[tag=player, tag=!dead, tag=!invisible] at @s if entity @e[type=frog, tag=trap.wither, tag=trap_marker, distance=..2] run function ctf:match/events/traps/touch {trap: "wither"}

function ctf:match/events/traps/detector/trigger

execute as @e[type=armor_stand, tag=trap_display] positioned as @s unless entity @n[type=frog, tag=trap_marker, distance=1.2..1.5] run kill @s
