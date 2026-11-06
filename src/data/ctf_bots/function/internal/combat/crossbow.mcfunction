# Every tick, as a bot with the crossbow (multishot): loaded in aim ticks, then 3 arrows
scoreboard players add @s bot.aim 1
$execute if score @s bot.aim matches ..$(aim) run return 0
scoreboard players set @s bot.aim 0
$execute anchored eyes facing entity @a[tag=bot_tc, limit=1] eyes rotated ~ ~-$(elevation) positioned ^ ^ ^0.6 run function ctf_bots:internal/combat/arrow {fire: 0}
$execute anchored eyes facing entity @a[tag=bot_tc, limit=1] eyes rotated ~-10 ~-$(elevation) positioned ^ ^ ^0.6 run function ctf_bots:internal/combat/arrow {fire: 0}
$execute anchored eyes facing entity @a[tag=bot_tc, limit=1] eyes rotated ~10 ~-$(elevation) positioned ^ ^ ^0.6 run function ctf_bots:internal/combat/arrow {fire: 0}
playsound minecraft:item.crossbow.shoot player @a[tag=!lobby] ~ ~ ~ 1 1
