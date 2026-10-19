# Creates the leggings and boots of the worn set chestplate, with its durability and damage,
# and marks the three pieces with a new set id (sid), so parts of another set are recognized.
# Leggings / boots that aren't parts of a set are moved to the inventory
execute if items entity @s armor.legs * unless items entity @s armor.legs *[custom_data~{ctf_part:1b}] run function ctf_inv:api/stash {slot: "armor.legs"}
execute if items entity @s armor.feet * unless items entity @s armor.feet *[custom_data~{ctf_part:1b}] run function ctf_inv:api/stash {slot: "armor.feet"}
execute if entity @e[type=item, tag=ctf.buf, limit=1] run function ctf_inv:api/place

execute store result score @s arm.sid run random value 1..2147483646
data modify storage ctf_inv:tmp set set value {}
data modify storage ctf_inv:tmp set set from entity @s Inventory[{Slot:102b}].components."minecraft:custom_data".ctf_set
data modify storage ctf_inv:tmp set.max set from entity @s Inventory[{Slot:102b}].components."minecraft:max_damage"
execute store result storage ctf_inv:tmp set.dmg int 1 run data get entity @s Inventory[{Slot:102b}].components."minecraft:damage"
execute store result storage ctf_inv:tmp set.sid int 1 run scoreboard players get @s arm.sid
function ctf_inv:armor/assemble_apply with storage ctf_inv:tmp set
