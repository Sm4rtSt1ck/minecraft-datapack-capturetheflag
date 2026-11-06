# As a bot, at it, its next node tagged nav_next, the link to it bot.lk: narrow (2) slower; jump (3) /
# fall (7) its gap jumps armed (only on jump links along the graph: ctf_bots:internal/brain/leap_scan); ladder
# up (5) / down (6): the ladder near it climbed first (ctf_bots:internal/climb; once: bot_climbed);
# then its lure at the node
execute if score @s bot.lk matches 2 run function ctf_bots:internal/nav/slow_on
execute unless score @s bot.lk matches 2 run function ctf_bots:internal/nav/slow_off
execute if score @s bot.lk matches 3 run tag @s add bot_jl
execute if score @s bot.lk matches 7 run tag @s add bot_jl
execute unless score @s bot.lk matches 3 unless score @s bot.lk matches 7 run tag @s remove bot_jl
# fall (7): at the edge, a hole ahead towards the node: off it (the gap jump when it lands within 4
# blocks, else a push: ctf_bots:internal/nav/fall_push); wind charge up (8): launched
# (ctf_bots:internal/nav/wind_up)
execute if score @s bot.lk matches 7 if predicate {condition: "minecraft:entity_properties", entity: "this", predicate: {flags: {is_on_ground: true}}} facing entity @n[type=marker, tag=nav_next] feet rotated ~ 0 if block ^ ^-1 ^1 #ctf_bots:gap if block ^ ^-2 ^1 #ctf_bots:gap run function ctf_bots:internal/nav/fall_push
execute if score @s bot.lk matches 8 if score @s bot.wind matches 1.. unless entity @s[tag=bot_wup] if predicate {condition: "minecraft:entity_properties", entity: "this", predicate: {flags: {is_on_ground: true}}} run function ctf_bots:internal/nav/wind_up
execute if score @s bot.lk matches 5 unless entity @s[tag=bot_climbed] unless score @s bot.clm matches 1.. align xyz positioned ~0.5 ~ ~0.5 if function ctf_bots:internal/climb/search_up_near run return 0
execute if score @s bot.lk matches 6 unless entity @s[tag=bot_climbed] unless score @s bot.clm matches 1.. align xyz positioned ~0.5 ~ ~0.5 if function ctf_bots:internal/climb/search_down_near run return 0
execute at @n[type=marker, tag=nav_next] run function ctf_bots:internal/brain/lure_direct
