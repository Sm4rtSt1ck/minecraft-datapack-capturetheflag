# Runs in the layout check (inventory changed). Armor is only worn, never kept in the inventory.
# Chestplate + leggings + boots work as one set:
#   - a set chestplate / helmet in the inventory -> put on (empty armor slot) or dropped
#   - a set chestplate put on                    -> the leggings and boots appear
#   - the chestplate taken off / dropped         -> the leggings and boots disappear
#   - leggings or boots taken with the cursor    -> the whole set becomes one chestplate on the cursor
#   - leggings or boots put into the inventory   -> they go back on (the set stays worn)
#   - leggings or boots dropped                  -> the whole set is dropped
# The helmet is separate.
from ctf_inv:lib import count
function ctf_inv:armor/loose {pred: '*[custom_data~{ctf_set:{}}]', to: "armor.chest"}
function ctf_inv:armor/loose {pred: '#ctf_inv:helmets[!custom_data~{tags:["ultimate"]}]', to: "armor.head"}

execute store success score #c inv.tmp if items entity @s armor.chest *[custom_data~{ctf_set:{}}]
execute store result storage ctf_inv:tmp arm.sid int 1 run scoreboard players get @s arm.sid
function ctf_inv:armor/check_sid with storage ctf_inv:tmp arm

# The set is complete
execute if score #s inv.tmp matches 1 if score #l inv.tmp matches 1 if score #f inv.tmp matches 1 run return 0

count('*[custom_data~{ctf_part:1b}]')
scoreboard players operation #p inv.tmp = #n inv.tmp
execute if items entity @s armor.legs *[custom_data~{ctf_part:1b}] run scoreboard players add #p inv.tmp 1
execute if items entity @s armor.feet *[custom_data~{ctf_part:1b}] run scoreboard players add #p inv.tmp 1

# No set chestplate worn: no parts
execute if score #c inv.tmp matches 0 run return run function ctf_inv:armor/clear_parts

# Another set chestplate was put on, or no parts at all: new parts for it
execute if score #s inv.tmp matches 0 run return run function ctf_inv:armor/reassemble
execute if score #p inv.tmp matches 0 run return run function ctf_inv:armor/reassemble

# Our set, but a part was taken off:
#   with the cursor -> the whole set (the chestplate) is on the cursor
#   into the inventory -> it goes back on
#   nowhere -> it was dropped: the whole set is dropped
execute if items entity @s player.cursor *[custom_data~{ctf_part:1b}] run return run function ctf_inv:armor/to_cursor
execute if score #n inv.tmp matches 1.. run return run function ctf_inv:armor/reassemble
function ctf_inv:armor/drop_set
