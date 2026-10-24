# Creates the leggings and boots of the worn set chestplate, with its durability and damage,
# and marks the three pieces with a new set id (sid), so parts of another set are recognized.
# Leggings / boots that aren't parts of a set are moved to the inventory
execute if items entity @s armor.legs * unless items entity @s armor.legs *[custom_data~{ctf_part:1b}] run function ctf_inv:api/stash {slot: "armor.legs"}
execute if items entity @s armor.feet * unless items entity @s armor.feet *[custom_data~{ctf_part:1b}] run function ctf_inv:api/stash {slot: "armor.feet"}
execute if entity @e[type=item, tag=ctf.buf, limit=1] run function ctf_inv:api/place

execute store result score @s arm.sid run random value 1..1000000
data modify storage ctf_inv:tmp set set value {}
data modify storage ctf_inv:tmp set set from entity @s Inventory[{Slot:102b}].components."minecraft:custom_data".ctf_set
# (the durability is in ctf_set.max: a component equal to the default value is not stored in the item)
# Sets made before ctf_set.max existed: the default durability of the material
execute unless data storage ctf_inv:tmp set.max if data storage ctf_inv:tmp set{mat: "leather"} run data modify storage ctf_inv:tmp set.max set value 80
execute unless data storage ctf_inv:tmp set.max if data storage ctf_inv:tmp set{mat: "golden"} run data modify storage ctf_inv:tmp set.max set value 112
execute unless data storage ctf_inv:tmp set.max if data storage ctf_inv:tmp set{mat: "iron"} run data modify storage ctf_inv:tmp set.max set value 240
execute unless data storage ctf_inv:tmp set.max run data modify storage ctf_inv:tmp set.max set value 240
execute store result storage ctf_inv:tmp set.dmg int 1 run data get entity @s Inventory[{Slot:102b}].components."minecraft:damage"
execute store result storage ctf_inv:tmp set.sid int 1 run scoreboard players get @s arm.sid
function ctf_inv:armor/assemble_apply with storage ctf_inv:tmp set
