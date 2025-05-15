scoreboard players set @s just_placed_trap 0

execute as @n[tag=!placed, tag=trap.tnt] run function ctf:match/events/traps/place_tnt
# execute at @s as @n[tag=!placed, tag=trap.something run function ctf:match/events/traps/place_something

execute as @n[tag=!placed, tag=trap.tnt] at @s run tp @s ~ ~-1.4 ~
tag @n[tag=!placed, tag=trap.tnt] add placed
