# Run every tick (ctf_loot:items/tick)
# Players protected from a Creepenator arrow last tick: the protection ends (given again if still close)
effect clear @a[tag=loot.creep_res] minecraft:resistance
tag @a remove loot.creep_res
execute as @e[type=arrow, tag=loot.creep_arrow, nbt={inGround: 0b}] at @s run function ctf_loot:reward/creep/arrow_tick
effect give @a[tag=loot.creep_res] minecraft:resistance 1 255 true

execute as @a[tag=loot.creep] at @s run function ctf_loot:reward/creep/player
