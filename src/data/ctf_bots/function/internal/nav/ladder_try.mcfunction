from registry:bots import NAV
# As a node B 2+ blocks above / below the node A (at A), no walk between them: a ladder near A (the
# nearest within 3 blocks: up from A's level / down from under A's level) and a walk from its other
# end to B (ctf_bots:internal/nav/bake_up / bake_down); none: a wind charge jump up (2..NAV "wind_up"
# blocks: ctf_bots:internal/nav/wind_col)
execute store result score #dy nav run data get entity @s Pos[1] 10
execute store result score #ay nav run data get entity @e[type=marker, tag=nav_a, limit=1] Pos[1] 10
scoreboard players operation #dy nav -= #ay nav
execute if score #dy nav matches 20.. align xyz positioned ~0.5 ~ ~0.5 run function ctf_bots:internal/nav/search_up
execute if score #dy nav matches ..-20 align xyz positioned ~0.5 ~ ~0.5 run function ctf_bots:internal/nav/search_down
execute if score #ok nav matches 0 if score #dy nav matches (f"20..{NAV['wind_up'] * 10}") align xyz positioned ~0.5 ~ ~0.5 run function ctf_bots:internal/nav/wind_try
