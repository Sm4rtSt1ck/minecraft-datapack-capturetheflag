# Runs as the click catcher of a box. Only the owner (same UUID) gets the reward. field
$data modify storage ctf_loot:tmp clicker set from entity @s $(field).player
$data remove entity @s $(field)
data modify storage ctf_loot:tmp cmp set from entity @e[type=marker, tag=ctf.loot_box, distance=..0.1, limit=1] data.uuid
execute store success score #diff loot.tmp run data modify storage ctf_loot:tmp cmp set from storage ctf_loot:tmp clicker
execute if score #diff loot.tmp matches 1 run return run function ctf_loot:box/not_owner
execute as @e[type=marker, tag=ctf.loot_box, distance=..0.1, limit=1] run function ctf_loot:box/claim
