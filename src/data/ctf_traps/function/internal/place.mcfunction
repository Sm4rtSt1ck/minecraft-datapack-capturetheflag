function admin:log/function {name: "match/events/traps/place"}

scoreboard players set @s just_placed_trap 0


execute as @n[tag=!placed, tag=trap_display] at @s run tp @s ~ ~-1.4 ~
execute as @n[tag=!placed, tag=trap_display] at @s if entity @n[tag=placed, tag=trap_display, distance=..0.1] run tp @s ~ ~1 ~
execute as @n[tag=!placed, tag=trap_display] at @s if entity @n[tag=placed, tag=trap_display, distance=..0.1] run tp @s ~ ~1 ~

execute as @n[tag=!placed, tag=trap_display, tag=trap.tnt] run function ctf_traps:internal/tnt/place
execute as @n[tag=!placed, tag=trap_display, tag=trap.anvil] run function ctf_traps:internal/anvil/place
execute as @n[tag=!placed, tag=trap_display, tag=trap.web] run function ctf_traps:internal/web/place
execute as @n[tag=!placed, tag=trap_display, tag=trap.levitation] run function ctf_traps:internal/levitation/place
execute as @n[tag=!placed, tag=trap_display, tag=trap.wither] run function ctf_traps:internal/wither/place
execute as @n[tag=!placed, tag=trap_display, tag=trap.detector] run function ctf_traps:internal/detector/place

# Owner of the new trap (kill credit)
execute at @s run scoreboard players operation @e[tag=trap_marker, tag=!kc.owned, distance=..8] kc.owner = @s player_id
execute at @s run tag @e[tag=trap_marker, tag=!kc.owned, distance=..8] add kc.owned

tag @n[tag=!placed, tag=trap_display] add placed
