# MAP BUILDING: prints a backup of the bot markers of the loaded chunks (admin:build/bots/get_tools)
# as the "bot" entry of a map (registry/maps.bolt): click the line to copy it, then paste it into the
# map's entry (restored by admin:build/bots/show/<map>). The bots don't need it: every clone copies
# the markers of the template. Template coordinates (the blocks of the markers); one template at a time.
from admin:bot_markers import SPOTS
# Only in the lobby
execute unless score game state = lobby state run return run function admin:build/internal/wrong_phase

data modify storage admin:build dump set value {flag_spots: [], trap_spots: [], anvil_spots: [], defend_spots: [], nav_points: [], routes: [[], [], [], []]}
for _s in SPOTS:
    execute as @e[type=armor_stand, tag=f"{_s['tag']}"] run function admin:build/bots/internal/append {list: (f"dump.{_s['key']}")}
# The routes: the points by their number (build.idx), from 1 to the highest one
scoreboard players set #max solid.tmp 0
execute as @e[type=armor_stand, tag=build_route] run scoreboard players operation #max solid.tmp > @s build.idx
scoreboard players set #k solid.tmp 1
execute if score #max solid.tmp matches 1.. run function admin:build/bots/internal/route_step

function admin:build/bots/internal/print with storage admin:build dump
