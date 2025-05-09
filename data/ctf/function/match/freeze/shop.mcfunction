##########################################################################################
# DROP-DOWN LIST BUTTONS


# Weapon
tag @a[nbt=!{Inventory:[{Slot:10b,id:"minecraft:netherite_sword"}]}] add shop_weapon
tag @a[nbt=!{Inventory:[{Slot:10b,id:"minecraft:netherite_sword"}]}] remove shop_defense
tag @a[nbt=!{Inventory:[{Slot:10b,id:"minecraft:netherite_sword"}]}] remove shop_staff
tag @a[nbt=!{Inventory:[{Slot:10b,id:"minecraft:netherite_sword"}]}] remove shop_kits
execute at @a[nbt=!{Inventory:[{Slot:10b,id:"minecraft:netherite_sword"}]}] run playsound minecraft:ui.button.click master @a[nbt=!{Inventory:[{Slot:10b,id:"minecraft:netherite_sword"}]}] ~ ~ ~ 0.2

# Defense
tag @a[nbt=!{Inventory:[{Slot:12b,id:"minecraft:netherite_chestplate"}]}] add shop_defense
tag @a[nbt=!{Inventory:[{Slot:12b,id:"minecraft:netherite_chestplate"}]}] remove shop_weapon
tag @a[nbt=!{Inventory:[{Slot:12b,id:"minecraft:netherite_chestplate"}]}] remove shop_staff
tag @a[nbt=!{Inventory:[{Slot:12b,id:"minecraft:netherite_chestplate"}]}] remove shop_kits
execute at @a[nbt=!{Inventory:[{Slot:12b,id:"minecraft:netherite_chestplate"}]}] run playsound minecraft:ui.button.click master @a[nbt=!{Inventory:[{Slot:12b,id:"minecraft:netherite_chestplate"}]}] ~ ~ ~ 0.2

# Staff
tag @a[nbt=!{Inventory:[{Slot:14b,id:"minecraft:firework_rocket"}]}] add shop_staff
tag @a[nbt=!{Inventory:[{Slot:14b,id:"minecraft:firework_rocket"}]}] remove shop_weapon
tag @a[nbt=!{Inventory:[{Slot:14b,id:"minecraft:firework_rocket"}]}] remove shop_defense
tag @a[nbt=!{Inventory:[{Slot:14b,id:"minecraft:firework_rocket"}]}] remove shop_kits
execute at @a[nbt=!{Inventory:[{Slot:14b,id:"minecraft:firework_rocket"}]}] run playsound minecraft:ui.button.click master @a[nbt=!{Inventory:[{Slot:14b,id:"minecraft:firework_rocket"}]}] ~ ~ ~ 0.2

# Kits
tag @a[nbt=!{Inventory:[{Slot:16b,id:"minecraft:chest"}]}] add shop_kits
tag @a[nbt=!{Inventory:[{Slot:16b,id:"minecraft:chest"}]}] remove shop_weapon
tag @a[nbt=!{Inventory:[{Slot:16b,id:"minecraft:chest"}]}] remove shop_defense
tag @a[nbt=!{Inventory:[{Slot:16b,id:"minecraft:chest"}]}] remove shop_staff
execute at @a[nbt=!{Inventory:[{Slot:16b,id:"minecraft:chest"}]}] run playsound minecraft:ui.button.click master @a[nbt=!{Inventory:[{Slot:16b,id:"minecraft:chest"}]}] ~ ~ ~ 0.2


# DROP-DOWN LIST BUTTONS
##########################################################################################
# IRON SWORD

# Fix bug
item replace entity @a[nbt=!{Inventory:[{Slot:10b,id:"minecraft:netherite_sword"}]}] container.18 with iron_sword[custom_data={tags:["shop", "item"]}]

# Buing process
tag @a[scores={money=1100..},tag=shop_weapon,nbt=!{Inventory:[{Slot:18b,id:"minecraft:iron_sword",components:{"minecraft:custom_data":{tags:["shop", "item"]}}}]}] add buy_iron_sword
scoreboard players remove @a[tag=buy_iron_sword] money 1100
execute at @a[tag=buy_iron_sword] run playsound minecraft:ui.button.click master @a[tag=buy_iron_sword] ~ ~ ~ 0.2
give @a[tag=buy_iron_sword] iron_sword
tag @a remove buy_iron_sword

# Steal control
clear @a[nbt=!{Inventory:[{Slot:18b,id:"minecraft:iron_sword"}]}] minecraft:iron_sword[custom_data={tags:["shop", "item"]}]
clear @a[tag=!shop_weapon] minecraft:iron_sword[custom_data={tags:["shop", "item"]}]

# Drop-down lists
item replace entity @a[tag=shop_weapon] container.18 with iron_sword[lore=['{"text":"1100$","italic":false}'],custom_data={tags:["shop", "item"]}]

# IRON SWORD
##########################################################################################
# DIAMOND SWORD

# Fix bug
item replace entity @a[nbt=!{Inventory:[{Slot:10b,id:"minecraft:netherite_sword"}]}] container.20 with minecraft:diamond_sword[custom_data={tags:["shop", "item"]}]

# Buing process
tag @a[scores={money=1300..},tag=shop_weapon,nbt=!{Inventory:[{Slot:20b,id:"minecraft:diamond_sword",components:{"minecraft:custom_data":{tags:["shop"]}}}]}] add buy_diamond_sword
scoreboard players remove @a[tag=buy_diamond_sword] money 1300
execute at @a[tag=buy_diamond_sword] run playsound minecraft:ui.button.click master @a[tag=buy_diamond_sword] ~ ~ ~ 0.2
give @a[tag=buy_diamond_sword] minecraft:diamond_sword
tag @a remove buy_diamond_sword

# Steal control
clear @a[nbt=!{Inventory:[{Slot:20b,id:"minecraft:diamond_sword"}]}] minecraft:diamond_sword[custom_data={tags:["shop", "item"]}]
clear @a[tag=!shop_weapon] minecraft:diamond_sword[custom_data={tags:["shop", "item"]}]

# Drop-down lists
item replace entity @a[tag=shop_weapon] container.20 with minecraft:diamond_sword[lore=['{"text":"1300$","italic":false}'],custom_data={tags:["shop", "item"]}]

# DIAMOND SWORD
##########################################################################################
# NETHERITE SWORD

# Fix bug
item replace entity @a[nbt=!{Inventory:[{Slot:10b,id:"minecraft:netherite_sword"}]}] container.27 with minecraft:netherite_sword[custom_data={tags:["shop", "item"]}]

# Buing process
tag @a[scores={money=1500..},tag=shop_weapon,nbt=!{Inventory:[{Slot:27b,id:"minecraft:netherite_sword",components:{"minecraft:custom_data":{tags:["shop"]}}}]}] add buy_netherite_sword
scoreboard players remove @a[tag=buy_netherite_sword] money 1500
execute at @a[tag=buy_netherite_sword] run playsound minecraft:ui.button.click master @a[tag=buy_netherite_sword] ~ ~ ~ 0.2
give @a[tag=buy_netherite_sword] minecraft:netherite_sword
tag @a remove buy_netherite_sword

# Steal control
clear @a[nbt=!{Inventory:[{Slot:27b,id:"minecraft:netherite_sword"}]}] minecraft:netherite_sword[custom_data={tags:["shop", "item"]}]
clear @a[tag=!shop_weapon] minecraft:netherite_sword[custom_data={tags:["shop", "item"]}]

# Drop-down lists
item replace entity @a[tag=shop_weapon] container.27 with minecraft:netherite_sword[lore=['{"text":"1500$","italic":false}'],custom_data={tags:["shop", "item"]}]

# NETHERITE SWORD
##########################################################################################
# MACE

# Fix bug
item replace entity @a[nbt=!{Inventory:[{Slot:10b,id:"minecraft:netherite_sword"}]}] container.29 with minecraft:mace[custom_data={tags:["shop", "item"]}]

# Buing process
tag @a[scores={money=2000..},tag=shop_weapon,nbt=!{Inventory:[{Slot:29b,id:"minecraft:mace",components:{"minecraft:custom_data":{tags:["shop"]}}}]}] add buy_mace
scoreboard players remove @a[tag=buy_mace] money 2000
execute at @a[tag=buy_mace] run playsound minecraft:ui.button.click master @a[tag=buy_mace] ~ ~ ~ 0.2
give @a[tag=buy_mace] minecraft:mace
tag @a remove buy_mace

# Steal control
clear @a[nbt=!{Inventory:[{Slot:29b,id:"minecraft:mace"}]}] minecraft:mace[custom_data={tags:["shop", "item"]}]
clear @a[tag=!shop_weapon] minecraft:mace[custom_data={tags:["shop", "item"]}]

# Drop-down lists
item replace entity @a[tag=shop_weapon] container.29 with minecraft:mace[lore=['{"text":"2000$","italic":false}'],custom_data={tags:["shop", "item"]}]

# MACE
##########################################################################################
# BOW

# Fix bug
item replace entity @a[nbt=!{Inventory:[{Slot:10b,id:"minecraft:netherite_sword"}]}] container.22 with minecraft:bow[custom_data={tags:["shop", "item"]}]

# Buing process
tag @a[scores={money=890..},tag=shop_weapon,nbt=!{Inventory:[{Slot:22b,id:"minecraft:bow",components:{"minecraft:custom_data":{tags:["shop"]}}}]}] add buy_bow
scoreboard players remove @a[tag=buy_bow] money 890
execute at @a[tag=buy_bow] run playsound minecraft:ui.button.click master @a[tag=buy_bow] ~ ~ ~ 0.2
give @a[tag=buy_bow] minecraft:bow
tag @a remove buy_bow

# Steal control
clear @a[nbt=!{Inventory:[{Slot:22b,id:"minecraft:bow"}]}] minecraft:bow[custom_data={tags:["shop", "item"]}]
clear @a[tag=!shop_weapon] minecraft:bow[custom_data={tags:["shop", "item"]}]

# Drop-down lists
item replace entity @a[tag=shop_weapon] container.22 with minecraft:bow[lore=['{"text":"890$","italic":false}'],custom_data={tags:["shop", "item"]}]

# BOW
##########################################################################################
# CROSSBOW

# Fix bug
item replace entity @a[nbt=!{Inventory:[{Slot:10b,id:"minecraft:netherite_sword"}]}] container.24 with minecraft:crossbow[custom_data={tags:["shop", "item"]}]

# Buing process
tag @a[scores={money=3000..},tag=shop_weapon,nbt=!{Inventory:[{Slot:24b,id:"minecraft:crossbow",components:{"minecraft:custom_data":{tags:["shop"]}}}]}] add buy_crossbow
scoreboard players remove @a[tag=buy_crossbow] money 3000
execute at @a[tag=buy_crossbow] run playsound minecraft:ui.button.click master @a[tag=buy_crossbow] ~ ~ ~ 0.2
give @a[tag=buy_crossbow] minecraft:crossbow
tag @a remove buy_crossbow

# Steal control
clear @a[nbt=!{Inventory:[{Slot:24b,id:"minecraft:crossbow"}]}] minecraft:crossbow[custom_data={tags:["shop", "item"]}]
clear @a[tag=!shop_weapon] minecraft:crossbow[custom_data={tags:["shop", "item"]}]

# Drop-down lists
item replace entity @a[tag=shop_weapon] container.24 with minecraft:crossbow[lore=['{"text":"3000$","italic":false}'],custom_data={tags:["shop", "item"]}]

# CROSSBOW
##########################################################################################
# ARROWS

# Fix bug
item replace entity @a[nbt=!{Inventory:[{Slot:10b,id:"minecraft:netherite_sword"}]}] container.26 with minecraft:arrow[custom_data={tags:["shop", "item", "0"]}]

# Buing process
tag @a[scores={money=100..},tag=shop_weapon,nbt=!{Inventory:[{Slot:26b,id:"minecraft:arrow",components:{"minecraft:custom_data":{tags:["shop"]}}}]}] add buy_arrow
scoreboard players remove @a[tag=buy_arrow] money 100
give @a[tag=buy_arrow] minecraft:arrow 10
execute at @a[tag=buy_arrow] run playsound minecraft:ui.button.click master @a[tag=buy_arrow] ~ ~ ~ 0.2
tag @a remove buy_arrow

# Steal control
clear @a[nbt=!{Inventory:[{Slot:26b,id:"minecraft:arrow"}]}] minecraft:arrow[custom_data={tags:["shop", "item", "0"]}]
clear @a[tag=!shop_weapon] minecraft:arrow[custom_data={tags:["shop", "item", "0"]}]

# Drop-down lists
item replace entity @a[tag=shop_weapon] container.26 with minecraft:arrow[custom_name='{"text":"Arrows x10", "color":"dark_green", "italic": false}', lore=['{"text":"100$","italic":false}'],custom_data={tags:["shop", "item", "0"]}]

# ARROWS
##########################################################################################
# POISON ARROWS

# Fix bug
item replace entity @a[nbt=!{Inventory:[{Slot:10b,id:"minecraft:netherite_sword"}]}] container.31 with minecraft:arrow[custom_data={tags:["shop", "item", "1"]}]

# Buing process
tag @a[scores={money=1000..},tag=shop_weapon,nbt=!{Inventory:[{Slot:31b,id:"minecraft:arrow",components:{"minecraft:custom_data":{tags:["shop"]}}}]}] add buy_poison_arrow
scoreboard players remove @a[tag=buy_poison_arrow] money 1000
give @a[tag=buy_poison_arrow] minecraft:arrow[potion_contents={custom_color:39936,custom_effects:[{id:"minecraft:poison",amplifier:1,duration:100}]}] 10
execute at @a[tag=buy_poison_arrow] run playsound minecraft:ui.button.click master @a[tag=buy_poison_arrow] ~ ~ ~ 0.2
tag @a remove buy_poison_arrow

# Steal control
clear @a[nbt=!{Inventory:[{Slot:31b,id:"minecraft:arrow"}]}] minecraft:arrow[custom_data={tags:["shop", "item", "1"]}]
clear @a[tag=!shop_weapon] minecraft:arrow[custom_data={tags:["shop", "item", "1"]}]

# Drop-down lists
item replace entity @a[tag=shop_weapon] container.31 with minecraft:arrow[custom_name='{"text":"Poison arrows x10", "color":"dark_green", "italic":false}', lore=['{"text":"1000$","italic":false}'],custom_data={tags:["shop", "item", "1"]}]

# POISON ARROWS
##########################################################################################
# IRON ARMOR

# Fix bug
item replace entity @a[nbt=!{Inventory:[{Slot:12b,id:"minecraft:netherite_chestplate"}]}] container.18 with minecraft:iron_chestplate[custom_data={tags:["shop", "item"]}]

# Buing process
tag @a[scores={money=1000..},tag=shop_defense,nbt=!{Inventory:[{Slot:18b,id:"minecraft:iron_chestplate",components:{"minecraft:custom_data":{tags:["shop"]}}}]}] add buy_iron_armor
scoreboard players remove @a[tag=buy_iron_armor] money 1000
item replace entity @a[tag=buy_iron_armor] armor.head with minecraft:iron_helmet
item replace entity @a[tag=buy_iron_armor] armor.chest with minecraft:iron_chestplate
item replace entity @a[tag=buy_iron_armor] armor.legs with minecraft:iron_leggings
item replace entity @a[tag=buy_iron_armor] armor.feet with minecraft:iron_boots
execute at @a[tag=buy_iron_armor] run playsound minecraft:ui.button.click master @a[tag=buy_iron_armor] ~ ~ ~ 0.2
tag @a remove buy_iron_armor

# Steal control
clear @a[nbt=!{Inventory:[{Slot:18b,id:"minecraft:iron_chestplate"}]}] minecraft:iron_chestplate[custom_data={tags:["shop", "item"]}]
clear @a[tag=!shop_defense] minecraft:iron_chestplate[custom_data={tags:["shop", "item"]}]

# Drop-down lists
item replace entity @a[tag=shop_defense] container.18 with minecraft:iron_chestplate[lore=['{"text":"1000$","italic":false}'],custom_data={tags:["shop", "item"]}]

# IRON ARMOR
##########################################################################################
# DIAMOND ARMOR

# Fix bug
item replace entity @a[nbt=!{Inventory:[{Slot:12b,id:"minecraft:netherite_chestplate"}]}] container.20 with minecraft:diamond_chestplate[custom_data={tags:["shop", "item"]}]

# Buing process
tag @a[scores={money=1500..},tag=shop_defense,nbt=!{Inventory:[{Slot:20b,id:"minecraft:diamond_chestplate",components:{"minecraft:custom_data":{tags:["shop"]}}}]}] add buy_diamond_armor
scoreboard players remove @a[tag=buy_diamond_armor] money 1500
item replace entity @a[tag=buy_diamond_armor] armor.head with minecraft:diamond_helmet
item replace entity @a[tag=buy_diamond_armor] armor.chest with minecraft:diamond_chestplate
item replace entity @a[tag=buy_diamond_armor] armor.legs with minecraft:diamond_leggings
item replace entity @a[tag=buy_diamond_armor] armor.feet with minecraft:diamond_boots
execute at @a[tag=buy_diamond_armor] run playsound minecraft:ui.button.click master @a[tag=buy_diamond_armor] ~ ~ ~ 0.2
tag @a remove buy_diamond_armor

# Steal control
clear @a[nbt=!{Inventory:[{Slot:20b,id:"minecraft:diamond_chestplate"}]}] minecraft:diamond_chestplate[custom_data={tags:["shop", "item"]}]
clear @a[tag=!shop_defense] minecraft:diamond_chestplate[custom_data={tags:["shop", "item"]}]

# Drop-down lists
item replace entity @a[tag=shop_defense] container.20 with minecraft:diamond_chestplate[lore=['{"text":"1500$","italic":false}'],custom_data={tags:["shop", "item"]}]

# DIAMOND ARMOR
##########################################################################################
# NETHERITE ARMOR

# Fix bug
item replace entity @a[nbt=!{Inventory:[{Slot:12b,id:"minecraft:netherite_chestplate"}]}] container.22 with minecraft:netherite_chestplate[custom_data={tags:["shop", "item"]}]

# Buing process
tag @a[scores={money=2000..},tag=shop_defense,nbt=!{Inventory:[{Slot:22b,id:"minecraft:netherite_chestplate",components:{"minecraft:custom_data":{tags:["shop"]}}}]}] add buy_netherite_armor
scoreboard players remove @a[tag=buy_netherite_armor] money 2000
item replace entity @a[tag=buy_netherite_armor] armor.head with minecraft:netherite_helmet
item replace entity @a[tag=buy_netherite_armor] armor.chest with minecraft:netherite_chestplate
item replace entity @a[tag=buy_netherite_armor] armor.legs with minecraft:netherite_leggings
item replace entity @a[tag=buy_netherite_armor] armor.feet with minecraft:netherite_boots
execute at @a[tag=buy_netherite_armor] run playsound minecraft:ui.button.click master @a[tag=buy_netherite_armor] ~ ~ ~ 0.2
tag @a remove buy_netherite_armor

# Steal control
clear @a[nbt=!{Inventory:[{Slot:22b,id:"minecraft:netherite_chestplate"}]}] minecraft:netherite_chestplate[custom_data={tags:["shop", "item"]}]
clear @a[tag=!shop_defense] minecraft:netherite_chestplate[custom_data={tags:["shop", "item"]}]

# Drop-down lists
item replace entity @a[tag=shop_defense] container.22 with minecraft:netherite_chestplate[lore=['{"text":"2000$","italic":false}'],custom_data={tags:["shop", "item"]}]

# NETHERITE ARMOR
##########################################################################################
# TEMPLATE

# Fix bug
item replace entity @a[nbt=!{Inventory:[{Slot:12b,id:"minecraft:netherite_chestplate"}]}] container.24 with minecraft:shield[custom_data={tags:["shop", "item"]}]

# Buing process
tag @a[scores={money=2000..},tag=shop_defense,nbt=!{Inventory:[{Slot:24b,id:"minecraft:shield",components:{"minecraft:custom_data":{tags:["shop", "item"]}}}]}] add buy_shield
scoreboard players remove @a[tag=buy_shield] money 2000
give @a[tag=buy_shield, tag=attack] minecraft:shield[base_color="orange",banner_patterns=[\
    {"pattern":"gradient","color":"black"},\
    {"pattern":"skull","color":"black"},\
    {"pattern":"gradient_up","color":"red"},\
    {"pattern":"triangles_bottom","color":"orange"},\
    {"pattern":"triangles_bottom","color":"red"}\
]] 1
give @a[tag=buy_shield, tag=defense] minecraft:shield[base_color="blue",banner_patterns=[\
    {"pattern":"gradient_up","color":"light_blue"},\
    {"pattern":"flower","color":"light_blue"}\
]] 1
execute at @a[tag=buy_shield] run playsound minecraft:ui.button.click master @a[tag=buy_shield] ~ ~ ~ 0.2
tag @a remove buy_shield

# Steal control
clear @a[nbt=!{Inventory:[{Slot:24b,id:"minecraft:shield"}]}] minecraft:shield[custom_data={tags:["shop", "item"]}]
clear @a[tag=!shop_defense] minecraft:shield[custom_data={tags:["shop", "item"]}]

# Drop-down lists
item replace entity @a[tag=shop_defense] container.24 with minecraft:shield[lore=['{"text":"2000$","italic":false}'],custom_data={tags:["shop", "item"]}]

# TEMPLATE
##########################################################################################
# WIND CHARGE

# Fix bug
item replace entity @a[nbt=!{Inventory:[{Slot:14b,id:"minecraft:firework_rocket"}]}] container.18 with minecraft:wind_charge[custom_data={tags:["shop", "item"]}]

# Buing process
tag @a[scores={money=500..},tag=shop_staff,nbt=!{Inventory:[{Slot:18b,id:"minecraft:wind_charge",components:{"minecraft:custom_data":{tags:["shop"]}}}]}] add buy_wind_charge
scoreboard players remove @a[tag=buy_wind_charge] money 500
give @a[tag=buy_wind_charge] minecraft:wind_charge
execute at @a[tag=buy_wind_charge] run playsound minecraft:ui.button.click master @a[tag=buy_wind_charge] ~ ~ ~ 0.2
tag @a remove buy_wind_charge

# Steal control
clear @a[nbt=!{Inventory:[{Slot:18b,id:"minecraft:wind_charge"}]}] minecraft:wind_charge[custom_data={tags:["shop", "item"]}]
clear @a[tag=!shop_staff] minecraft:wind_charge[custom_data={tags:["shop", "item"]}]

# Drop-down lists
item replace entity @a[tag=shop_staff] container.18 with minecraft:wind_charge[lore=['{"text":"500$","italic":false}'],custom_data={tags:["shop", "item"]}]

# WIND CHARGE
##########################################################################################
# POTION OF REGENERATION

# Fix bug
item replace entity @a[nbt=!{Inventory:[{Slot:14b,id:"minecraft:firework_rocket"}]}] container.20 with minecraft:potion[custom_data={tags:["shop", "item"]}]

# Buing process
tag @a[scores={money=500..},tag=shop_staff,nbt=!{Inventory:[{Slot:20b,id:"minecraft:potion",components:{"minecraft:custom_data":{tags:["shop", "item"]}}}]}] add buy_potion
scoreboard players remove @a[tag=buy_potion] money 500
give @a[tag=buy_potion] potion[potion_contents={custom_color:16711680,custom_effects:[{id:"minecraft:regeneration",amplifier:1,duration:200,show_particles:1b}]}] 1
execute at @a[tag=buy_potion] run playsound minecraft:ui.button.click master @a[tag=buy_potion] ~ ~ ~ 0.2
tag @a remove buy_potion

# Steal control
clear @a[nbt=!{Inventory:[{Slot:20b,id:"minecraft:potion"}]}] minecraft:potion[custom_data={tags:["shop", "item"]}]
clear @a[tag=!shop_staff] minecraft:potion[custom_data={tags:["shop", "item"]}]

# Drop-down lists
item replace entity @a[tag=shop_staff] container.20 with minecraft:potion[lore=['{"text":"500$","italic":false}'],custom_data={tags:["shop", "item"]}]

# POTION OF REGENERATION
##########################################################################################
# TNT KIT

# Fix bug
item replace entity @a[tag=defense, nbt=!{Inventory:[{Slot:16b,id:"minecraft:chest"}]}] container.18 with minecraft:tnt[custom_data={tags:["shop", "item"]}]

# Buing process
tag @a[scores={money=1000..},tag=shop_kits,tag=defense,nbt=!{Inventory:[{Slot:18b,id:"minecraft:tnt",components:{"minecraft:custom_data":{tags:["shop", "item"]}}}]}] add buy_tnt
scoreboard players remove @a[tag=buy_tnt] money 1000
give @a[tag=buy_tnt] minecraft:tnt 3
give @a[tag=buy_tnt] minecraft:redstone 10
give @a[tag=buy_tnt] minecraft:pale_oak_pressure_plate 5
execute at @a[tag=buy_tnt] run playsound minecraft:ui.button.click master @a[tag=buy_tnt] ~ ~ ~ 0.2
tag @a remove buy_tnt

# Steal control
clear @a[nbt=!{Inventory:[{Slot:18b,id:"minecraft:tnt"}]}] minecraft:tnt[custom_data={tags:["shop", "item"]}]
clear @a[tag=!shop_kits] minecraft:tnt[custom_data={tags:["shop", "item"]}]

# Drop-down lists
item replace entity @a[tag=defense, tag=shop_kits] container.18 with minecraft:tnt[lore=['{"text":"1000$","italic":false}'],custom_data={tags:["shop", "item"]}]

# TNT KIT
##########################################################################################
# FILL EMPTY SLOTS


clear @a[nbt=!{Inventory:[\
    {Slot:9b,id:"minecraft:black_stained_glass_pane"},\
    {Slot:11b,id:"minecraft:black_stained_glass_pane"},\
    {Slot:13b,id:"minecraft:black_stained_glass_pane"},\
    {Slot:15b,id:"minecraft:black_stained_glass_pane"},\
    {Slot:17b,id:"minecraft:black_stained_glass_pane"},\
    {Slot:19b,id:"minecraft:black_stained_glass_pane"},\
    {Slot:21b,id:"minecraft:black_stained_glass_pane"},\
    {Slot:23b,id:"minecraft:black_stained_glass_pane"},\
    {Slot:25b,id:"minecraft:black_stained_glass_pane"},\
    {Slot:28b,id:"minecraft:black_stained_glass_pane"},\
    {Slot:30b,id:"minecraft:black_stained_glass_pane"},\
    {Slot:32b,id:"minecraft:black_stained_glass_pane"},\
    {Slot:34b,id:"minecraft:black_stained_glass_pane"}\
]}] minecraft:black_stained_glass_pane

item replace entity @a container.9 with minecraft:black_stained_glass_pane[custom_name='""',custom_data={tags:["shop"]}]
item replace entity @a container.11 with minecraft:black_stained_glass_pane[custom_name='""',custom_data={tags:["shop"]}]
item replace entity @a container.13 with minecraft:black_stained_glass_pane[custom_name='""',custom_data={tags:["shop"]}]
item replace entity @a container.15 with minecraft:black_stained_glass_pane[custom_name='""',custom_data={tags:["shop"]}]
item replace entity @a container.17 with minecraft:black_stained_glass_pane[custom_name='""',custom_data={tags:["shop"]}]
item replace entity @a container.19 with minecraft:black_stained_glass_pane[custom_name='""',custom_data={tags:["shop"]}]
item replace entity @a container.21 with minecraft:black_stained_glass_pane[custom_name='""',custom_data={tags:["shop"]}]
item replace entity @a container.23 with minecraft:black_stained_glass_pane[custom_name='""',custom_data={tags:["shop"]}]
item replace entity @a container.25 with minecraft:black_stained_glass_pane[custom_name='""',custom_data={tags:["shop"]}]
item replace entity @a container.28 with minecraft:black_stained_glass_pane[custom_name='""',custom_data={tags:["shop"]}]
item replace entity @a container.30 with minecraft:black_stained_glass_pane[custom_name='""',custom_data={tags:["shop"]}]
item replace entity @a container.32 with minecraft:black_stained_glass_pane[custom_name='""',custom_data={tags:["shop"]}]
item replace entity @a container.34 with minecraft:black_stained_glass_pane[custom_name='""',custom_data={tags:["shop"]}]


# FILL EMPTY SLOTS
##########################################################################################
# DROP DOWN LISTS

# Weapon
clear @a[nbt=!{Inventory:[{Slot:10b,id:"minecraft:netherite_sword"}]}] minecraft:netherite_sword[custom_data={tags:["shop", "menu"]}]
item replace entity @a container.10 with netherite_sword[custom_name='{"text":"Weapon","italic":false,"color":"dark_red","bold":true}',enchantments={levels:{"minecraft:unbreaking":1},show_in_tooltip:false}, custom_data={tags:["shop", "menu"]}]

# Defense
clear @a[nbt=!{Inventory:[{Slot:12b,id:"minecraft:netherite_chestplate"}]}] minecraft:netherite_chestplate[custom_data={tags:["shop", "menu"]}]
item replace entity @a container.12 with netherite_chestplate[custom_name='{"text":"Defense","italic":false,"color":"green","bold":true}',enchantments={levels:{"minecraft:unbreaking":1},show_in_tooltip:false}, custom_data={tags:["shop", "menu"]}]

# Staff
clear @a[nbt=!{Inventory:[{Slot:14b,id:"minecraft:firework_rocket"}]}] minecraft:firework_rocket[custom_data={tags:["shop", "menu"]}]
item replace entity @a container.14 with firework_rocket[custom_name='{"text":"Staff","italic":false,"color":"blue","bold":true}', custom_data={tags:["shop", "menu"]}]

# Kits
clear @a[nbt=!{Inventory:[{Slot:16b,id:"minecraft:chest"}]}] minecraft:chest[custom_data={tags:["shop", "menu"]}]
item replace entity @a container.16 with minecraft:chest[custom_name='{"text":"Kits","italic":false,"color":"blue","bold":true}', custom_data={tags:["shop", "menu"]}]


# DROP DOWN LISTS
##########################################################################################
# OTHER

# Steal control
kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{tags:["shop"]}}}}]

# Show money
execute as @a run title @s actionbar [{"text":"Money: ","color":"yellow"},{"score":{"name":"@s","objective":"money"},"color":"green"},{"text":"$","color":"green"}]


# OTHER
##########################################################################################
