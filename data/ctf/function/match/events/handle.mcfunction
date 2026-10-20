# IF I COMMIT WITHOUT REMOVING THIS LINE, AMA ULTRA STUPID
# execute as @a[scores={just_placed_trap=1..}] run function ctf:match/events/traps/place

execute as @a[scores={carrot_on_stick=1..}] if items entity @s weapon.mainhand carrot_on_a_stick[minecraft:custom_data={tags:["trap", "detector"]}] run function ctf:match/events/traps/detector/place


# Flag
execute as @a[scores={flag_broken=1..}] run function ctf:match/events/flag/break
execute as @a[scores={wall_flag_broken=1..}] run function ctf:match/events/flag/break
execute as @a[scores={flag_dropped=1..}] run function ctf:match/events/flag/drop
execute as @a[scores={flag_pickedup=1..}] run function ctf:match/events/flag/pickup
execute as @e[type=armor_stand, tag=flag] at @s unless block ~ ~ ~ magenta_banner unless block ~ ~ ~ magenta_wall_banner run function ctf:match/events/flag/break
# Fight
execute as @a[scores={just_killed=1..}] run function ctf:match/events/fight/kill
execute as @a[scores={just_died=1..}] run function ctf:match/events/fight/die
tag @a remove just_killed
execute as @a[scores={just_used_totem=1..}] run function ctf:match/events/fight/use_totem
execute as @a[scores={just_threw_grenade=1..}] run function ctf:match/events/grenades/throw
execute as @a[scores={just_threw_smoke=1..}] run function ctf:match/events/grenades/smoke/throw
function ctf:match/events/grenades/smoke/tick
# Traps
# An attacker who sets a trap off (by walking or shooting) gets the kill credit (ctf:match/events/traps/touch)
execute as @a[tag=player, tag=!dead, tag=!invisible] at @s if entity @e[tag=trap.tnt, tag=trap_marker, distance=..2] run function ctf:match/events/traps/touch {trap: "tnt"}
execute as @e[type=arrow] at @s if entity @e[tag=trap.tnt, tag=trap_marker, distance=..2] run function ctf:match/events/traps/by_projectile {trap: "tnt"}
execute as @e[type=firework_rocket] at @s if entity @e[tag=trap.tnt, tag=trap_marker, distance=..2] run function ctf:match/events/traps/by_projectile {trap: "tnt"}
execute as @e[type=wind_charge] at @s if entity @e[tag=trap.tnt, tag=trap_marker, distance=..2] run function ctf:match/events/traps/by_projectile {trap: "tnt"}

execute as @a[tag=player, tag=!dead, tag=!invisible] at @s positioned ~-0.125 ~1 ~-0.125 if entity @e[tag=trap.anvil, tag=trap_marker, dx=0.25, dy=256, dz=0.25] run function ctf:match/events/traps/touch_anvil

execute at @a[tag=player, tag=!dead, tag=!invisible] as @e[tag=trap.web, tag=trap_marker, tag=!triggered, distance=..2] run function ctf:match/events/traps/web/trigger

execute as @a[tag=player, tag=!dead, tag=!invisible] at @s if entity @e[tag=trap.levitation, tag=trap_marker, distance=..2] run function ctf:match/events/traps/touch {trap: "levitation"}
execute as @a[tag=player, tag=!dead, tag=!invisible] at @s if entity @e[tag=trap.wither, tag=trap_marker, distance=..2] run function ctf:match/events/traps/touch {trap: "wither"}

function ctf:match/events/traps/detector/trigger

execute as @e[tag=trap_display] positioned as @s unless entity @n[tag=trap_marker, distance=1.2..1.5] run kill @s

# Kill credit: effect clouds of traps mark players inside; the credit expires
execute as @e[type=area_effect_cloud, tag=kc.cloud] at @s run function ctf:match/events/credit/cloud
scoreboard players remove @a[scores={kc.time=1..}] kc.time 1

# Grenades
execute as @e[type=armor_stand, tag=he_grenade] run function ctf:match/events/grenades/fly

# Ultimate
execute as @a[tag=player, scores={carrot_on_stick=1..}] if items entity @s weapon.mainhand carrot_on_a_stick[minecraft:custom_data~{action:"ultimate"}] run function ctf:match/events/ultimate/check_points
execute as @a[tag=player, tag=ultimate] run function ctf:match/events/ultimate/tick
