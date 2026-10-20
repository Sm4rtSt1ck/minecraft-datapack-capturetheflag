# Runs as a box marker (the center of the box)
function ctf_loot:box/remove_blocks with entity @s data
execute positioned ~ ~0.5 ~ run function ctf_fx:explosion
kill @e[type=interaction, tag=ctf.loot_click, distance=..0.1]
kill @s
