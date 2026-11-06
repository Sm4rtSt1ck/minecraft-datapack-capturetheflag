# As a bot, positioned at a point on its way (ctf_bots:internal/brain/lure_here, the graph): its lure
# stands here and the bot chases it (its target, set only when it isn't already: ctf_bots:internal/brain/aim)
execute if entity @s[tag=bot_guard] run function ctf_bots:internal/brain/unguard
execute unless entity @e[type=rabbit, tag=bot_mylure] run function ctf_bots:internal/brain/new_lure
tp @e[type=rabbit, tag=bot_mylure] ~ ~ ~
scoreboard players set #ok bots 0
execute on target if entity @s[type=rabbit, tag=bot_mylure] run scoreboard players set #ok bots 1
execute if score #ok bots matches 1 run return 1
tag @e[type=rabbit, tag=bot_mylure] add bot_aim
function ctf_bots:internal/brain/aim
tag @e[type=rabbit, tag=bot_aim] remove bot_aim
