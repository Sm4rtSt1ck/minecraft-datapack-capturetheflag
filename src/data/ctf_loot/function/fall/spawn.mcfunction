# The box marker (keeps the crate data, for removing the box and returning rewards). x, y, z
$summon marker $(x) $(y) $(z) {Tags: ["ctf.loot_box", "ctf.loot_new"]}
execute as @e[type=marker, tag=ctf.loot_new] at @s run tp @s ~0.5 ~ ~0.5
data modify entity @e[type=marker, tag=ctf.loot_new, limit=1] data set from entity @s data
tag @e[type=marker, tag=ctf.loot_new] remove ctf.loot_new

# The reward goes into the middle slot of the box
function ctf_loot:fall/fill with entity @s data
