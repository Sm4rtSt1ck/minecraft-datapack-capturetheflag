# As a bot with a speed potion, its target far: drunk. Speed II (+40%): a mob moves by speed^2, so it
# is about the doubled speed of a player with the potion's speed IV, for the same 8 s
scoreboard players remove @s bot.speed 1
effect give @s minecraft:speed 8 1 true
playsound minecraft:entity.generic.drink neutral @a[tag=!lobby] ~ ~ ~ 1 1
