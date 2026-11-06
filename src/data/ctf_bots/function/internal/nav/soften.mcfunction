# As a bot falling fast right above the ground with a wind charge: the gust under it, no fall damage
scoreboard players remove @s bot.wind 1
data modify entity @s FallDistance set value 0.0f
data modify entity @s Motion[1] set value -0.1d
particle minecraft:gust_emitter_small ~ ~-0.5 ~ 0 0 0 0 1 force @a[tag=!lobby]
playsound minecraft:entity.wind_charge.wind_burst neutral @a[tag=!lobby] ~ ~ ~ 1 1
