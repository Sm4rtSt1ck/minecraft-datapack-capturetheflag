# The navigation graph (BOTS.md stage 8), after a clone: every bot marker of the arena (bot_nav) is a
# node (nav_node, nav.id 1..: ctf_bots:internal/nav/node_try), except an anvil spot (AN: on a ceiling);
# then
# ctf_bots:internal/nav/bake_tick finds the links of a few nodes a tick. No graph until then (#ready
# nav 0: the bots go straight); the fields are computed again
from registry:bots import NAV
scoreboard players set #ready nav 0
kill @e[type=marker, tag=nav_link]
tag @e[type=marker, tag=bot_nav] remove nav_node
tag @e[type=marker, tag=bot_nav] remove nav_todo
tag @e[type=marker, tag=bot_nav] remove nav_air
scoreboard players set #id nav 0
execute as @e[type=marker, tag=bot_nav, tag=!bot_anvil] at @s run function ctf_bots:internal/nav/node_try
for _k in range(NAV["slots"]):
    scoreboard players set f"#g{_k}" nav 0
    scoreboard players set f"#t{_k}" nav -1
scoreboard players set #smax nav (2 * NAV["link_range"] + 8)
schedule function ctf_bots:internal/nav/bake_tick 1t
