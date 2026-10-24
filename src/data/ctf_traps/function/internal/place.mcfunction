from registry:traps import TRAPS
function admin:log/function {name: "match/events/traps/place"}

scoreboard players set @s just_placed_trap 0


execute as @n[tag=!placed, tag=trap_display] at @s run tp @s ~ ~-1.4 ~
execute as @n[tag=!placed, tag=trap_display] at @s if entity @n[tag=placed, tag=trap_display, distance=..0.1] run tp @s ~ ~1 ~
execute as @n[tag=!placed, tag=trap_display] at @s if entity @n[tag=placed, tag=trap_display, distance=..0.1] run tp @s ~ ~1 ~

# Every trap of the registry TRAPS (ctf_traps:internal/<id>/place)
for t in TRAPS:
    execute as @n[tag=!placed, tag=trap_display, tag=f"trap.{t['id']}"] run function f"ctf_traps:internal/{t['id']}/place"

# Owner of the new trap (kill credit)
execute at @s run scoreboard players operation @e[tag=trap_marker, tag=!kc.owned, distance=..8] kc.owner = @s player_id
execute at @s run tag @e[tag=trap_marker, tag=!kc.owned, distance=..8] add kc.owned

tag @n[tag=!placed, tag=trap_display] add placed
