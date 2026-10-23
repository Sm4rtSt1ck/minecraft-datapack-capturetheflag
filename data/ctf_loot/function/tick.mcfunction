# Run every tick (ctf:tick)
execute as @e[type=marker, tag=ctf.loot_fall] at @s run function ctf_loot:fall/tick
function ctf_loot:items/tick
