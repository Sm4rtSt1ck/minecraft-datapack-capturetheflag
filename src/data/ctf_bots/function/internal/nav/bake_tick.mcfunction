# The links of NAV "bake_per_tick" nodes a tick (ctf_bots:internal/nav/bake_node); all done: the graph
# is ready
from registry:bots import NAV
for _i in range(NAV["bake_per_tick"]):
    execute as @e[type=marker, tag=nav_todo, limit=1] at @s run function ctf_bots:internal/nav/bake_node
execute if entity @e[type=marker, tag=nav_todo] run return run schedule function ctf_bots:internal/nav/bake_tick 1t
scoreboard players set #ready nav 1
