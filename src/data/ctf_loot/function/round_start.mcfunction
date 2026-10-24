# Start of the round: crates that weren't opened disappear with an explosion
execute as @e[type=marker, tag=ctf.loot_box] at @s run function ctf_loot:box/remove
kill @e[type=marker, tag=ctf.loot_fall]
