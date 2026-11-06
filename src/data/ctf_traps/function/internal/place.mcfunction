from registry:traps import TRAPS
function admin:log/function {name: "match/events/traps/place"}

scoreboard players set @s just_placed_trap 0


execute as @n[tag=!placed, tag=trap_display] at @s run tp @s ~ ~-1.4 ~
execute as @n[tag=!placed, tag=trap_display] at @s if entity @n[tag=placed, tag=trap_display, distance=..0.1] run tp @s ~ ~1 ~
execute as @n[tag=!placed, tag=trap_display] at @s if entity @n[tag=placed, tag=trap_display, distance=..0.1] run tp @s ~ ~1 ~

# Every trap of the registry TRAPS (ctf_traps:internal/<id>/place)
for t in TRAPS:
    execute as @n[tag=!placed, tag=trap_display, tag=f"trap.{t['id']}"] run function f"ctf_traps:internal/{t['id']}/place"

# Owner and placer of the new trap (kill credit): the one who placed it (a player, or a bot:
# ctf_traps:api/place/<id>). Only the new marker has no owner yet
scoreboard players operation @e[type=frog, tag=trap_marker, tag=!kc.owned] kc.owner = @s player_id
scoreboard players operation @e[type=frog, tag=trap_marker, tag=!kc.owned] kc.placer = @s player_id
tag @e[type=frog, tag=trap_marker, tag=!kc.owned] add kc.owned

tag @n[tag=!placed, tag=trap_display] add placed
