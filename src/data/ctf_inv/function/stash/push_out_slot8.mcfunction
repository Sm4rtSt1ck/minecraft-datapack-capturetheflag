# Runs as the player: moves a foreign item from slot 8 into a free slot (or drops it)
execute unless items entity @s hotbar.7 * run return 0
summon item ~ -100 ~ {Item: {id: "minecraft:stone", count: 1}, PickupDelay: 32767s, NoGravity: true, Tags: ["ctf.push", "ctf.seen"]}
item replace entity @e[type=item, tag=ctf.push, limit=1] contents from entity @s hotbar.7
item replace entity @s hotbar.7 with air
execute as @e[type=item, tag=ctf.push, limit=1] run function ctf_inv:stash/to_free
tag @e[type=item, tag=ctf.push] remove ctf.push
