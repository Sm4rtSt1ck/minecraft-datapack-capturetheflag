# As a bot, positioned at where it must go: its lure stands here and the bot chases it. The bot is
# made to (a hit "by" the lure: it retaliates) only when its target isn't the lure already
execute if entity @s[tag=bot_guard] run function ctf_bots:internal/brain/unguard
execute unless entity @e[type=rabbit, tag=bot_mylure] run function ctf_bots:internal/brain/new_lure
tp @e[type=rabbit, tag=bot_mylure] ~ ~ ~
scoreboard players set #ok bots 0
execute on target if entity @s[type=rabbit, tag=bot_mylure] run scoreboard players set #ok bots 1
execute if score #ok bots matches 1 run return 1
# Chasing a player: dropped first (ctf_bots:internal/brain/drop_target), the lure at the next think
execute on target if entity @s[type=player] run scoreboard players set #ok bots 2
execute if score #ok bots matches 2 run return run function ctf_bots:internal/brain/drop_target
data merge entity @n[type=rabbit, tag=bot_mylure] {Invulnerable: 0b}
damage @s 0.01 minecraft:generic by @n[type=rabbit, tag=bot_mylure]
