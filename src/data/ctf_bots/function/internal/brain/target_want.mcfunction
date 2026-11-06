# As a bot: its target is the player tagged bot_want (a hit "by" him: the bot retaliates and chases
# him, even out of sight while it is repeated), only when it isn't already. A running retaliation
# isn't restarted by a new hit, so the old target is dropped first: the lure becomes invulnerable
# (the goal stops in the same tick), another player: ctf_bots:internal/brain/drop_target
execute if entity @s[tag=bot_guard] run function ctf_bots:internal/brain/unguard
scoreboard players set #ok bots 0
execute on target if entity @s[tag=bot_want] run scoreboard players set #ok bots 1
execute if score #ok bots matches 1 run return 1
execute on target if entity @s[type=player] run scoreboard players set #ok bots 2
execute if score #ok bots matches 2 run return run function ctf_bots:internal/brain/drop_target
execute as @e[type=rabbit, tag=bot_mylure] run data merge entity @s {Invulnerable: 1b}
damage @s 0.01 minecraft:generic by @p[tag=bot_want]
