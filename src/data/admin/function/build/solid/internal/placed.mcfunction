# admin:tick, as a player who has placed a barrier: if it was a solid item (admin:build/solid/get), its
# display goes into the new barrier. The main hand places first; the off hand only when the main hand
# can't place a barrier.
scoreboard players reset @s build.solid
execute if items entity @s weapon.mainhand barrier unless items entity @s weapon.mainhand barrier[custom_data~{ctf_solid: {}}] run return 0
execute if items entity @s weapon.mainhand barrier run data modify storage admin:build state set from entity @s SelectedItem.components."minecraft:custom_data".ctf_solid
execute unless items entity @s weapon.mainhand barrier unless items entity @s weapon.offhand barrier[custom_data~{ctf_solid: {}}] run return 0
execute unless items entity @s weapon.mainhand barrier run data modify storage admin:build state set from entity @s Inventory[{Slot: -106b}].components."minecraft:custom_data".ctf_solid
# The new barrier is the first barrier without a display on the line of sight (reach < 6 blocks)
scoreboard players set #r solid.tmp 60
execute anchored eyes positioned ^ ^ ^ run function admin:build/solid/internal/look_for
