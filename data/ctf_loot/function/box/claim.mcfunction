# Runs as the box marker: the reward goes to the owner, the box disappears
function ctf_loot:box/give with entity @s data.r
function ctf_loot:box/give_to with entity @s data
particle minecraft:totem_of_undying ~ ~0.7 ~ 0.3 0.4 0.3 0.4 40 force @a[tag=!lobby]
playsound minecraft:block.shulker_box.open block @a[tag=!lobby] ~ ~ ~ 1 1
function ctf_loot:box/remove_blocks with entity @s data
kill @e[type=interaction, tag=ctf.loot_click, distance=..0.1]
kill @s
