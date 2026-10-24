# #ctf:on/freeze_start
execute unless entity @a[tag=defense, nbt={Inventory:[{id:"minecraft:frog_spawn_egg", components:{"minecraft:entity_data":{Tags:["trap", "trap_display", "trap.tnt"]}}}]}] run scoreboard players set tnt_trap bought.item 0
execute unless entity @a[tag=defense, nbt={Inventory:[{id:"minecraft:frog_spawn_egg", components:{"minecraft:entity_data":{Tags:["trap", "trap_display", "trap.anvil"]}}}]}] run scoreboard players set anvil_trap bought.item 0
execute unless entity @a[tag=defense, nbt={Inventory:[{id:"minecraft:frog_spawn_egg", components:{"minecraft:entity_data":{Tags:["trap", "trap_display", "trap.web"]}}}]}] run scoreboard players set web_trap bought.item 0
execute unless entity @a[tag=defense, nbt={Inventory:[{id:"minecraft:frog_spawn_egg", components:{"minecraft:entity_data":{Tags:["trap", "trap_display", "trap.levitation"]}}}]}] run scoreboard players set levitation_trap bought.item 0
execute unless entity @a[tag=defense, nbt={Inventory:[{id:"minecraft:frog_spawn_egg", components:{"minecraft:entity_data":{Tags:["trap", "trap_display", "trap.wither"]}}}]}] run scoreboard players set wither_trap bought.item 0
execute unless entity @a[tag=defense, nbt={Inventory:[{id:"minecraft:frog_spawn_egg", components:{"minecraft:entity_data":{Tags:["trap", "trap_display", "trap.detector"]}}}]}] run scoreboard players set detector_trap bought.item 0

execute as @a[tag=player] run function ctf_shop:open
# Round purchase limits (grenade, totem, shield, potions, chorus)
execute as @a[tag=player] at @s run function ctf_shop:limits/reset
