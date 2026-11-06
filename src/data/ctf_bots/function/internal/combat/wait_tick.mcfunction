# Every tick, as a bot waiting (ctf_bots:internal/combat/wait): the time over, it can hit again
scoreboard players remove @s bot.rdy 1
execute if score @s bot.rdy matches 1.. run return 0
tag @s remove bot_wait
attribute @s minecraft:attack_damage modifier remove ctf_bots:wait
