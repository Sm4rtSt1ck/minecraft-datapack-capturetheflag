function admin:log/function {name: "match/events/traps/place"}

scoreboard players set @s just_placed_trap 0


execute as @n[tag=!placed, tag=trap_display] at @s run tp @s ~ ~-1.4 ~
execute as @n[tag=!placed, tag=trap_display] at @s if entity @n[tag=placed, tag=trap_display, distance=..0.1] run tp @s ~ ~1 ~
execute as @n[tag=!placed, tag=trap_display] at @s if entity @n[tag=placed, tag=trap_display, distance=..0.1] run tp @s ~ ~1 ~

execute as @n[tag=!placed, tag=trap_display, tag=trap.tnt] run function ctf:match/events/traps/tnt/place
execute as @n[tag=!placed, tag=trap_display, tag=trap.anvil] run function ctf:match/events/traps/anvil/place
execute as @n[tag=!placed, tag=trap_display, tag=trap.web] run function ctf:match/events/traps/web/place
execute as @n[tag=!placed, tag=trap_display, tag=trap.levitation] run function ctf:match/events/traps/levitation/place
execute as @n[tag=!placed, tag=trap_display, tag=trap.wither] run function ctf:match/events/traps/wither/place
execute as @n[tag=!placed, tag=trap_display, tag=trap.detector] run function ctf:match/events/traps/detector/place
# execute at @s as @n[tag=!placed, tag=trap.something run function ctf:match/events/traps/place_something

# Owner of the new trap (kill credit)
execute at @s run scoreboard players operation @e[tag=trap_marker, tag=!kc.owned, distance=..8] kc.owner = @s player_id
execute at @s run tag @e[tag=trap_marker, tag=!kc.owned, distance=..8] add kc.owned

tag @n[tag=!placed, tag=trap_display] add placed
