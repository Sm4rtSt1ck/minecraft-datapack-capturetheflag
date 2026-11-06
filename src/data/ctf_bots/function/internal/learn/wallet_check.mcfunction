# As the wallet of a bot (at its bot's last place): the bot is gone (dead) -> the point within 8 counts a
# death (lrn.dg), once a round (lrn_dead)
scoreboard players operation #wn lrn = @s bot.n
scoreboard players set #alive lrn 0
execute as @e[type=zombified_piglin, tag=ctf_bot] if score @s bot.n = #wn lrn run scoreboard players set #alive lrn 1
execute if score #alive lrn matches 1 run return 0
tag @s add lrn_dead
execute at @s as @n[type=marker, tag=lrn_pt, distance=..8] run scoreboard players add @s lrn.dg 10
