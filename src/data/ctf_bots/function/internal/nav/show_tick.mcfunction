# The graph shown to the players tagged nav_viewer (ctf_bots:api/nav/show), every 10 ticks
execute unless entity @a[tag=nav_viewer] run return 0
execute at @a[tag=nav_viewer] as @e[type=marker, tag=nav_node, distance=..24] at @s run particle minecraft:flame ~ ~0.3 ~ 0 0.2 0 0 3 force @a[tag=nav_viewer]
execute at @a[tag=nav_viewer] as @e[type=marker, tag=nav_air, distance=..24] at @s run particle minecraft:dust{color: [1.0, 0.0, 0.0], scale: 1.5} ~ ~0.3 ~ 0 0.2 0 0 3 force @a[tag=nav_viewer]
execute at @a[tag=nav_viewer] as @e[type=marker, tag=nav_link, distance=..24] at @s run function ctf_bots:internal/nav/show_link
schedule function ctf_bots:internal/nav/show_tick 10t
