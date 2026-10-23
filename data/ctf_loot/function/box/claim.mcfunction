# Runs as the box marker: the reward goes to the owner, the box disappears
execute if data entity @s data{reward_fn: ""} run function ctf_loot:box/give_item with entity @s data
execute unless data entity @s data{reward_fn: ""} run function ctf_loot:box/give_fn with entity @s data
particle minecraft:totem_of_undying ~ ~0.7 ~ 0.3 0.4 0.3 0.4 40 force @a[tag=!lobby]
playsound minecraft:block.shulker_box.open block @a[tag=!lobby] ~ ~ ~ 1 1
function ctf_loot:box/remove_blocks with entity @s data
kill @e[type=interaction, tag=ctf.loot_click, distance=..0.1]
kill @s
