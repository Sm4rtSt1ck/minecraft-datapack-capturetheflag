# As a searching bot without a spot: the unchecked node where the players hid the flag most often this
# match (ctf_bots:internal/trick/hide_pick), else the nearest unchecked flag spot (F) nobody took (bot.sc -1), else
# the nearest unchecked node nobody took; none: everything again (the checks and the claims cleared)
function ctf_bots:internal/trick/hide_pick
execute unless entity @e[type=marker, tag=bot_sdest] as @e[type=marker, tag=bot_flag, tag=!bot_chk, scores={bot.sc=-1}, sort=nearest, limit=1] run tag @s add bot_sdest
execute unless entity @e[type=marker, tag=bot_sdest] as @e[type=marker, tag=nav_node, tag=!bot_chk, scores={bot.sc=-1}, sort=nearest, limit=1] run tag @s add bot_sdest
execute unless entity @e[type=marker, tag=bot_sdest] run function ctf_bots:internal/team/search_reset
execute unless entity @e[type=marker, tag=bot_sdest] as @e[type=marker, tag=nav_node, tag=!bot_chk, sort=random, limit=1] run tag @s add bot_sdest
scoreboard players operation @e[type=marker, tag=bot_sdest] bot.sc = #me bots
