# Freeze, as a defense bot (POST_TP chance): its defend spot now (ctf_bots:internal/brain/pick_spot),
# a teleport there; it keeps the spot at the round start (bot_posted)
function ctf_bots:internal/brain/pick_spot
scoreboard players operation #me bots = @s bot.n
execute as @e[type=marker, tag=bot_defend] if score @s bot.own = #me bots run tag @s add bot_dest
execute if entity @e[type=marker, tag=bot_dest] run tag @s add bot_posted
execute at @n[type=marker, tag=bot_dest] run tp @s ~ ~ ~
tag @e[type=marker, tag=bot_dest] remove bot_dest
