# Every tick, as a bot with the crossbow (multishot): loaded in aim ticks, then 3 arrows; a miss
# (chance miss): dev degrees to a side
scoreboard players add @s bot.aim 1
$execute if score @s bot.aim matches ..$(aim) run return 0
scoreboard players set @s bot.aim 0
$data modify storage ctf_bots:shot set value {yaw: 0, elevation: $(elevation), fire: 0, three: 1}
$execute if predicate {condition: "minecraft:random_chance", chance: $(miss)} run function ctf_bots:internal/combat/miss {dev: $(dev)}
function ctf_bots:internal/combat/volley with storage ctf_bots:shot
playsound minecraft:item.crossbow.shoot player @a[tag=!lobby] ~ ~ ~ 1 1
