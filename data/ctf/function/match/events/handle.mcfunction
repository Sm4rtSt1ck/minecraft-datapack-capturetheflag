# IF I COMMIT WITHOUT REMOVING THIS LINE, AMA ULTRA STUPID
# execute as @a[scores={just_placed_trap=1..}] run function ctf:match/events/traps/place

execute as @a[scores={carrot_on_stick=1..}] if items entity @s weapon.mainhand carrot_on_a_stick[minecraft:custom_data={tags:["trap", "detector"]}] run function ctf:match/events/traps/detector/place


# Flag
execute as @a[scores={flag_broken=1..}] run function ctf:match/events/flag/break
execute as @a[scores={wall_flag_broken=1..}] run function ctf:match/events/flag/break
execute as @a[scores={flag_dropped=1..}] run function ctf:match/events/flag/drop
execute as @a[scores={flag_pickedup=1..}] run function ctf:match/events/flag/pickup
execute as @e[type=armor_stand, tag=flag] at @s unless block ~ ~ ~ yellow_banner unless block ~ ~ ~ yellow_wall_banner run function ctf:match/events/flag/break
# Fight
execute as @a[scores={just_killed=1..}] run function ctf:match/events/fight/kill
execute as @a[scores={just_died=1..}] run function ctf:match/events/fight/die
execute as @a[scores={just_used_totem=1..}] run function ctf:match/events/fight/use_totem
execute as @a[scores={just_threw_grenade=1..}] run function ctf:match/events/grenades/throw
# Traps
execute at @a[tag=player, tag=!dead] as @e[tag=trap.tnt, tag=trap_marker, distance=..2] run function ctf:match/events/traps/tnt/trigger
execute at @e[type=arrow] as @e[tag=trap.tnt, tag=trap_marker, distance=..2] run function ctf:match/events/traps/tnt/trigger
execute at @e[type=firework_rocket] as @e[tag=trap.tnt, tag=trap_marker, distance=..2] run function ctf:match/events/traps/tnt/trigger
execute at @e[type=wind_charge] as @e[tag=trap.tnt, tag=trap_marker, distance=..2] run function ctf:match/events/traps/tnt/trigger

execute at @a[tag=player, tag=!dead] positioned ~-0.125 ~1 ~-0.125 as @e[tag=trap.anvil, tag=trap_marker, dx=0.25, dy=256, dz=0.25] run function ctf:match/events/traps/anvil/trigger

execute at @a[tag=player, tag=!dead] as @e[tag=trap.web, tag=trap_marker, distance=..2] run function ctf:match/events/traps/web/trigger

execute at @a[tag=player, tag=!dead] as @e[tag=trap.levitation, tag=trap_marker, distance=..2] run function ctf:match/events/traps/levitation/trigger
execute at @a[tag=player, tag=!dead] as @e[tag=trap.wither, tag=trap_marker, distance=..2] run function ctf:match/events/traps/wither/trigger

# Grenades
execute as @e[type=armor_stand, tag=he_grenade] run function ctf:match/events/grenades/fly


function ctf:match/events/traps/detector/trigger

execute as @e[tag=trap_display] positioned as @s unless entity @n[tag=trap_marker, distance=1.2..1.5] run kill @s
