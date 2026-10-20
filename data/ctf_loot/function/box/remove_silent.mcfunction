function ctf_loot:box/remove_blocks with entity @s data
kill @e[type=interaction, tag=ctf.loot_click, distance=..0.1]
kill @s
