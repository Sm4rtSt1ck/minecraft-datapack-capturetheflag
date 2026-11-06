# As the fake at its place: on guard; noise every TRICKS "noise" ticks (5 a think): shots the players hear
from registry:bots import TRICKS
execute unless entity @s[tag=bot_faked] run function ctf_bots:internal/talk/fake
tag @s add bot_faked
function ctf_bots:internal/brain/guard
scoreboard players add @s bot.nz 5
execute if score @s bot.nz matches (f"..{TRICKS['noise'] - 1}") run return 0
scoreboard players set @s bot.nz 0
playsound minecraft:entity.firework_rocket.blast player @a[tag=!lobby] ~ ~ ~ 3 1.6
playsound minecraft:entity.arrow.shoot player @a[tag=!lobby] ~ ~ ~ 2 1
particle minecraft:smoke ~ ~1.5 ~ 0.2 0.2 0.2 0.02 6 normal @a[tag=!lobby]
