# Takes the item out of the player's slot into a buffer (an item entity).
# Buffers are put back with ctf_inv:api/place. Nothing gets destroyed here.
# slot - any slot of the player (hotbar.N, container.N, weapon.offhand, player.crafting.N, ...)
$execute unless items entity @s $(slot) * run return 0

summon item ~ -100 ~ {Item: {id: "minecraft:stone", count: 1}, PickupDelay: 32767s, NoGravity: true, Tags: ["ctf.buf", "ctf.buf_new", "ctf.seen"]}
$item replace entity @e[type=item, tag=ctf.buf_new, limit=1] contents from entity @s $(slot)
tag @e[type=item, tag=ctf.buf_new] remove ctf.buf_new
$item replace entity @s $(slot) with air
return 1
