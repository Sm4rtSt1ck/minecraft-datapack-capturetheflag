# Runs as an ammo buffer. Empty slot -> moved there; the same ammo there -> merged
# (given again, "give" stacks it); anything else -> dropped
execute if items entity @s contents firework_rocket unless items entity @a[tag=ctf.stash_owner, limit=1] weapon.offhand * run return run function ctf_inv:stash/to {slot: "weapon.offhand"}
execute unless items entity @a[tag=ctf.stash_owner, limit=1] hotbar.6 * run return run function ctf_inv:stash/to {slot: "hotbar.6"}

data modify storage ctf_inv:tmp ammo.type set from entity @s Item.components."minecraft:custom_data".ammo
execute store result storage ctf_inv:tmp ammo.count int 1 run data get entity @s Item.count
function ctf_inv:stash/to_ammo_merge with storage ctf_inv:tmp ammo
