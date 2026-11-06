# As a bot with the mace on the ground, its target close: a wind charge under its feet throws it up,
# its fall makes the next mace hit a smash (vanilla: the fall distance of the attacker)
scoreboard players remove @s bot.wind 1
scoreboard players set @s bot.cd2 12
summon wind_charge ~ ~0.3 ~ {Motion: [0.0d, -1.5d, 0.0d]}
