# Flag
execute as @a[scores={flag_broken=1..}] run function ctf:match/events/flag/break
execute as @a[scores={wall_flag_broken=1..}] run function ctf:match/events/flag/break
execute as @a[scores={flag_dropped=1..}] run function ctf:match/events/flag/drop
execute as @a[scores={flag_pickedup=1..}] run function ctf:match/events/flag/pickup
# Fight
execute as @a[scores={just_killed=1..}] run function ctf:match/events/fight/kill
execute as @a[scores={just_died=1..}] run function ctf:match/events/fight/die
execute as @a[scores={just_used_totem=1..}] run function ctf:match/events/fight/use_totem
# Traps
execute at @a[tag=player, tag=!dead] as @e[tag=trap.tnt, tag=trap_marker, distance=..2] run function ctf:match/events/traps/tnt_explode
execute at @e[type=arrow] as @e[tag=trap.tnt, tag=trap_marker, distance=..2] run function ctf:match/events/traps/tnt_explode
execute at @e[type=firework_rocket] as @e[tag=trap.tnt, tag=trap_marker, distance=..2] run function ctf:match/events/traps/tnt_explode
execute at @e[type=wind_charge] as @e[tag=trap.tnt, tag=trap_marker, distance=..2] run function ctf:match/events/traps/tnt_explode
execute as @e[tag=trap.tnt, tag=trap_display] positioned as @s unless entity @n[tag=trap.tnt, tag=trap_marker, distance=1.3..1.4] run kill @s
