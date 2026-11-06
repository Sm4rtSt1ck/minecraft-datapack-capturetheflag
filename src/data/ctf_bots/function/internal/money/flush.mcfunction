# As a bot: the money it got (kills, the flag) goes into its wallet, capped like a player's
scoreboard players operation #me bots = @s bot.n
execute as @e[type=marker, tag=bot_wallet] if score @s bot.n = #me bots run tag @s add bot_mywallet
scoreboard players operation @e[type=marker, tag=bot_mywallet] money += @s money
scoreboard players set @s money 0
execute as @e[type=marker, tag=bot_mywallet] run function ctf_econ:cap
tag @e[type=marker, tag=bot_mywallet] remove bot_mywallet
