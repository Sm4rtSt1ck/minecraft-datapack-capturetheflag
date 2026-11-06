# As a bot, at it (4 times a second): what to do now. The target is set only when it changes
# (ctf_bots:internal/brain/target_want, lure_here). A climbing bot only climbs (ctf_bots:internal/climb)
execute if entity @s[tag=bot_climb] run return 0
scoreboard players operation #me bots = @s bot.n
execute as @e[type=rabbit, tag=bot_lure] if score @s bot.own = #me bots run tag @s add bot_mylure
execute if score @s bot.clw matches 1.. run scoreboard players remove @s bot.clw 1
# A detour (ctf_bots:internal/brain/detour), a ladder to climb (ctf_bots:internal/climb/go), else its
# side's thinking (ctf_bots:internal/brain/act)
execute if score @s bot.det matches 1.. run function ctf_bots:internal/brain/detour
execute unless score @s bot.det matches 1.. if score @s bot.clm matches 1.. run function ctf_bots:internal/climb/go
execute if entity @s[tag=!bot_climb] run function ctf_bots:internal/brain/act
tag @e[type=rabbit, tag=bot_mylure] remove bot_mylure
tag @a remove bot_want
tag @a remove bot_tgt
tag @e[type=marker, tag=bot_post] remove bot_post
