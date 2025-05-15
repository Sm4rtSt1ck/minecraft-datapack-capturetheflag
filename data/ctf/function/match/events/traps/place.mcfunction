scoreboard players set @s just_placed_trap 0


execute as @n[tag=!placed, tag=trap_display] at @s run tp @s ~ ~-1.4 ~
execute as @n[tag=!placed, tag=trap_display] at @s if entity @n[tag=placed, tag=trap_display, distance=..0.1] run tp @s ~ ~1 ~
execute as @n[tag=!placed, tag=trap_display] at @s if entity @n[tag=placed, tag=trap_display, distance=..0.1] run tp @s ~ ~1 ~

execute as @n[tag=!placed, tag=trap_display, tag=trap.tnt] run function ctf:match/events/traps/place_tnt
# execute at @s as @n[tag=!placed, tag=trap.something run function ctf:match/events/traps/place_something

tag @n[tag=!placed, tag=trap_display] add placed
