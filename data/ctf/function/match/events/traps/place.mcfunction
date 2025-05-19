scoreboard players set @s just_placed_trap 0


execute as @n[tag=!placed, tag=trap_display] at @s run tp @s ~ ~-1.4 ~
execute as @n[tag=!placed, tag=trap_display] at @s if entity @n[tag=placed, tag=trap_display, distance=..0.1] run tp @s ~ ~1 ~
execute as @n[tag=!placed, tag=trap_display] at @s if entity @n[tag=placed, tag=trap_display, distance=..0.1] run tp @s ~ ~1 ~

execute as @n[tag=!placed, tag=trap_display, tag=trap.tnt] run function ctf:match/events/traps/tnt/place
execute as @n[tag=!placed, tag=trap_display, tag=trap.anvil] run function ctf:match/events/traps/anvil/place
execute as @n[tag=!placed, tag=trap_display, tag=trap.web] run function ctf:match/events/traps/web/place
execute as @n[tag=!placed, tag=trap_display, tag=trap.levitation] run function ctf:match/events/traps/levitation/place
# execute at @s as @n[tag=!placed, tag=trap.something run function ctf:match/events/traps/place_something

tag @n[tag=!placed, tag=trap_display] add placed
