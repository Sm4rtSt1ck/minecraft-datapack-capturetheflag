# x, y, z, sy (the block above)
data modify storage ctf_loot:tmp look.x set from entity @s data.x
data modify storage ctf_loot:tmp look.y set from entity @s data.y
data modify storage ctf_loot:tmp look.z set from entity @s data.z
data modify storage ctf_loot:tmp look.sy set from entity @s data.sy
function ctf_loot:fall/place_blocks with storage ctf_loot:tmp look
