# As a hurt bot with a regeneration potion: drunk. A zombified piglin is undead: regeneration doesn't heal it,
# instant damage II does (8 health, like the potion's regeneration II for 10 s)
scoreboard players remove @s bot.regen 1
effect give @s minecraft:instant_damage 1 1 true
playsound minecraft:entity.generic.drink neutral @a[tag=!lobby] ~ ~ ~ 1 1
particle minecraft:heart ~ ~2 ~ 0.3 0.3 0.3 0 5 normal @a[tag=!lobby]
