# As a new route marker (admin:build/internal/placed, admin:build/bots/show/<map>): its number in its
# route (build.idx, the order of the points) and its name R<route>.<number>
from admin:bot_markers import ROUTE_TEXT
for r in range(1, 5):
    # The first marker of the route: the numbers start again from 1
    execute if entity @s[tag=f"build_route_{r}"] store result score #c solid.tmp if entity @e[type=armor_stand, tag=f"build_route_{r}"]
    execute if entity @s[tag=f"build_route_{r}"] if score #c solid.tmp matches 1 run scoreboard players set f"#route_{r}" solid.tmp 0
    execute if entity @s[tag=f"build_route_{r}"] run scoreboard players add f"#route_{r}" solid.tmp 1
    execute if entity @s[tag=f"build_route_{r}"] run scoreboard players operation @s build.idx = f"#route_{r}" solid.tmp
    execute if entity @s[tag=f"build_route_{r}"] run data modify storage admin:build name set value {r: (r), c: (ROUTE_TEXT[r - 1])}
execute store result storage admin:build name.i int 1 run scoreboard players get @s build.idx
function admin:build/bots/internal/name with storage admin:build name
