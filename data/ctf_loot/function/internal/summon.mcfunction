# x, top, z (+ the whole crate data in the marker's "data").
# The center of the block is reached by tp (+0.5): "$(x).5" would be wrong for negative coordinates
$summon marker $(x) $(top) $(z) {Tags: ["ctf.loot_fall", "ctf.loot_new"]}
execute as @e[type=marker, tag=ctf.loot_new] at @s run tp @s ~0.5 ~ ~0.5
data modify entity @e[type=marker, tag=ctf.loot_new, limit=1] data set from storage ctf_loot:tmp d
scoreboard players set @e[type=marker, tag=ctf.loot_new] loot.t 0
tag @e[type=marker, tag=ctf.loot_new] remove ctf.loot_new
