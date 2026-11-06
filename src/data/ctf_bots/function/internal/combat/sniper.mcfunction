# Every tick, as a bot with the sniper rifle: it aims (aim ticks), shoots (spread), then reloads
# like a player (ctf_sniper:config reload)
execute if score @s bot.cd matches 1.. run return run scoreboard players remove @s bot.cd 1
scoreboard players add @s bot.aim 1
$execute if score @s bot.aim matches ..$(aim) run return 0
scoreboard players set @s bot.aim 0
$scoreboard players set #s gun.tmp $(spread)
function ctf_guns:spread
function ctf_bots:internal/combat/fire {gun: 1}
playsound minecraft:entity.generic.explode player @a[tag=!lobby] ~ ~ ~ 2 2
playsound minecraft:item.crossbow.shoot player @a[tag=!lobby] ~ ~ ~ 2 0.6
execute store result score @s bot.cd run data get storage ctf_sniper:config reload
