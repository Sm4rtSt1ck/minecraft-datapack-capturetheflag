# Freeze start, the bots defend: the flag goes to a random flag spot of the map (bot markers); a map
# without flag spots: where a defense bot stands
execute if score Bots_learn settings matches 1 if score #map lrn matches 1.. if function ctf_bots:internal/learn/hide run return 0
execute if entity @e[type=marker, tag=bot_flag] at @e[type=marker, tag=bot_flag, sort=random, limit=1] run return run function ctf_flag:api/place_here
execute at @e[type=zombified_piglin, tag=ctf_bot, tag=defense, sort=random, limit=1] run function ctf_flag:api/place_here
