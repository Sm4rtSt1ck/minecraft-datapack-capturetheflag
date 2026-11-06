# As a withering bot (bot.wth ticks left): 1 damage every BODY_FX "wither_every" ticks, like the wither
# effect on a player (the kill credit: the trap cloud marked it, ctf_fight:internal/credit/cloud)
from registry:bots import BODY_FX
scoreboard players remove @s bot.wth 1
particle minecraft:smoke ~ ~1 ~ 0.25 0.5 0.25 0 1 normal @a[tag=!lobby]
scoreboard players operation #m bots = @s bot.wth
scoreboard players set #k bots (BODY_FX["wither_every"])
scoreboard players operation #m bots %= #k bots
execute if score #m bots matches 0 run damage @s 1 minecraft:wither
