# Every tick, as a bot with a bow: drawn for aim ticks, then an arrow at its target (aimed
# elevation degrees up against the drop; fire: 1 for the fire bow)
scoreboard players add @s bot.aim 1
$execute if score @s bot.aim matches ..$(aim) run return 0
scoreboard players set @s bot.aim 0
$execute anchored eyes facing entity @a[tag=bot_tc, limit=1] eyes rotated ~ ~-$(elevation) positioned ^ ^ ^0.6 run function ctf_bots:internal/combat/arrow {fire: $(fire)}
playsound minecraft:entity.arrow.shoot player @a[tag=!lobby] ~ ~ ~ 1 1
