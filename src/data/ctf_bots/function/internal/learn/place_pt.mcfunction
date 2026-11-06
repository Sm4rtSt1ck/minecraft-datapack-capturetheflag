# Positioned at a stored point: a bot marker standing here (the map's own) becomes it, else a new point
# marker (a node of the bots' graph in a match with bots, or in the lobby view: nav_tmp); its stats from storage (ctf_bots:internal/learn/pt_stats)
execute as @e[type=marker, tag=bot_nav, tag=!lrn_pt, distance=..1, limit=1] run tag @s add lrn_cur
execute unless entity @e[type=marker, tag=lrn_cur] run summon marker ~ ~ ~ {Tags: ["lrn_pt", "lrn_learned", "map_entity", "lrn_cur"]}
execute if score team bots matches 1.. run tag @e[type=marker, tag=lrn_cur] add bot_nav
execute if score #lshow nav matches 1 run tag @e[type=marker, tag=lrn_cur] add bot_nav
execute if score #lshow nav matches 1 run tag @e[type=marker, tag=lrn_cur] add nav_tmp
tag @e[type=marker, tag=lrn_cur] add lrn_pt
execute as @e[type=marker, tag=lrn_cur] run function ctf_bots:internal/learn/pt_stats
tag @e[type=marker, tag=lrn_cur] remove lrn_cur
