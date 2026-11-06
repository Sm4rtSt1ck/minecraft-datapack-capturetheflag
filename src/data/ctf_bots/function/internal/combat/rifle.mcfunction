# Every tick, as a bot shooting its assault rifle: the players' fire rate (6 a second: bot.cd in
# 1/20 of a shot), magazine (30) and reload (50 ticks); the players' base spread + the bot's (spread)
execute if score @s bot.cd matches 1.. run scoreboard players remove @s bot.cd 6
execute if score @s bot.cd matches 1.. run return 0
execute store result score #s gun.tmp run data get storage ctf_guns:config rifle_spread_base
$scoreboard players add #s gun.tmp $(spread)
function ctf_guns:spread
function ctf_bots:internal/combat/fire {gun: 2}
playsound minecraft:entity.firework_rocket.blast player @a[tag=!lobby] ~ ~ ~ 3 1.6
playsound minecraft:item.crossbow.shoot player @a[tag=!lobby] ~ ~ ~ 2 1.8
scoreboard players add @s bot.cd 20
scoreboard players remove @s bot.mag 1
execute unless score @s bot.mag matches 1.. run scoreboard players add @s bot.cd 300
execute unless score @s bot.mag matches 1.. run scoreboard players set @s bot.mag 30
