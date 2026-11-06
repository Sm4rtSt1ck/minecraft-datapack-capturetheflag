# As a burning bot (bot.fire ticks left): flames seen by everyone (its body shows no fire), 1 damage
# every BODY_FX "burn_every" ticks, like a burning player; water puts it out
from registry:bots import BODY_FX
execute if block ~ ~ ~ minecraft:water run return run scoreboard players set @s bot.fire 0
execute if block ~ ~1 ~ minecraft:water run return run scoreboard players set @s bot.fire 0
scoreboard players remove @s bot.fire 1
particle minecraft:flame ~ ~0.9 ~ 0.25 0.5 0.25 0.01 2 normal @a[tag=!lobby]
scoreboard players operation #m bots = @s bot.fire
scoreboard players set #k bots (BODY_FX["burn_every"])
scoreboard players operation #m bots %= #k bots
execute if score #m bots matches 0 run damage @s 1 minecraft:generic
