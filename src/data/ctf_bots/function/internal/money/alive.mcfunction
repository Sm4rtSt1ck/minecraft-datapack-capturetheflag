# As a bot alive at the round end: its wallet isn't dead
scoreboard players operation #me bots = @s bot.n
execute as @e[type=marker, tag=bot_wallet] if score @s bot.n = #me bots run tag @s remove dead
