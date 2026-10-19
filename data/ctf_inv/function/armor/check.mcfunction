# Runs in the layout check (inventory changed). Keeps chestplate + leggings + boots as one set:
#   - a set chestplate put on              -> the leggings and boots appear
#   - the chestplate taken off / dropped   -> the leggings and boots disappear
#   - leggings or boots taken off          -> the whole set becomes one chestplate in the inventory
#   - leggings or boots dropped            -> the whole set is dropped
# The helmet is separate.
function ctf_inv:armor/auto_equip

execute store success score #c inv.tmp if items entity @s armor.chest *[custom_data~{ctf_set:{}}]
execute store result storage ctf_inv:tmp arm.sid int 1 run scoreboard players get @s arm.sid
function ctf_inv:armor/check_sid with storage ctf_inv:tmp arm

# The set is complete
execute if score #s inv.tmp matches 1 if score #l inv.tmp matches 1 if score #f inv.tmp matches 1 run return 0

function ctf_inv:limits/count {pred: '*[custom_data~{ctf_part:1b}]'}
scoreboard players operation #p inv.tmp = #n inv.tmp
execute if items entity @s armor.legs *[custom_data~{ctf_part:1b}] run scoreboard players add #p inv.tmp 1
execute if items entity @s armor.feet *[custom_data~{ctf_part:1b}] run scoreboard players add #p inv.tmp 1

# No set chestplate worn: no parts
execute if score #c inv.tmp matches 0 run return run function ctf_inv:armor/clear_parts

# Another set chestplate was put on (or a set without parts): new parts for it
execute if score #s inv.tmp matches 0 run return run function ctf_inv:armor/reassemble

# Our set, but a part was taken off: in the inventory -> unequip the set, nowhere -> it was dropped
scoreboard players operation #loose inv.tmp = #n inv.tmp
execute if score #loose inv.tmp matches 1.. run return run function ctf_inv:armor/unequip
function ctf_inv:armor/drop_set
