# Run every tick (ctf:tick)
execute as @e[type=marker, tag=ctf.loot_fall] at @s run function ctf_loot:fall/tick
function ctf_loot:items/tick
execute as @e[type=interaction, tag=ctf.loot_click] if data entity @s interaction at @s run function ctf_loot:box/click {field: "interaction"}
execute as @e[type=interaction, tag=ctf.loot_click] if data entity @s attack at @s run function ctf_loot:box/click {field: "attack"}
