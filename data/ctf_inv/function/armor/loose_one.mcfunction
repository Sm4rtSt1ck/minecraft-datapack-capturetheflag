# slot, to
$execute unless items entity @s $(to) * run function ctf_inv:armor/move {from: "$(slot)", to: "$(to)"}
$execute if items entity @s $(to) * unless items entity @s $(slot) * run return run function ctf_inv:armor/sound
summon item ~ ~1 ~ {Item: {id: "minecraft:stone", count: 1}, PickupDelay: 40s, Tags: ["ctf.lim_new"]}
$item replace entity @e[type=item, tag=ctf.lim_new, limit=1] contents from entity @s $(slot)
$item replace entity @s $(slot) with air
tag @e[type=item, tag=ctf.lim_new] remove ctf.lim_new
