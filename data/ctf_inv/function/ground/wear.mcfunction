# Runs as a player next to armor on the ground: it is put on straight into the empty armor slot
# (never into the inventory, so a full inventory doesn't matter)
tag @s add ctf.wearer
scoreboard players operation #me inv.tmp = @s player_id
execute unless items entity @s armor.chest * as @e[type=item, tag=ctf.r.armor, distance=..1.5, nbt={PickupDelay: 0s}, sort=nearest, limit=1] if function ctf_inv:ground/may_take run function ctf_inv:ground/wear_item {slot: "armor.chest"}
execute unless items entity @s armor.head * as @e[type=item, tag=ctf.r.helmet, distance=..1.5, nbt={PickupDelay: 0s}, sort=nearest, limit=1] if function ctf_inv:ground/may_take run function ctf_inv:ground/wear_item {slot: "armor.head"}
tag @s remove ctf.wearer
