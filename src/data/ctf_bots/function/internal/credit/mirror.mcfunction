# Every tick, as a bot marked by a grenade / trap / ultimate (kc.time): the mark copied to its wallet,
# which outlives it (a dead bot can't be selected: ctf_bots:internal/credit/watch)
scoreboard players operation #me bots = @s bot.n
execute as @e[type=marker, tag=bot_wallet] if score @s bot.n = #me bots run tag @s add bot_mywallet
scoreboard players operation @e[type=marker, tag=bot_mywallet] kc.by = @s kc.by
scoreboard players operation @e[type=marker, tag=bot_mywallet] kc.src = @s kc.src
scoreboard players operation @e[type=marker, tag=bot_mywallet] kc.time = @s kc.time
tag @e[type=marker, tag=bot_mywallet] add kc.watch
tag @e[type=marker, tag=bot_mywallet] remove bot_mywallet
