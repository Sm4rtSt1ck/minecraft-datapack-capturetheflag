##########################################################################################
# DROP-DOWN LIST BUTTONS


# Weapon
tag @a[nbt=!{Inventory:[{Slot:10b,id:"minecraft:netherite_sword"}]}] add shop_weapon
tag @a[nbt=!{Inventory:[{Slot:10b,id:"minecraft:netherite_sword"}]}] remove shop_defense
execute at @a[nbt=!{Inventory:[{Slot:10b,id:"minecraft:netherite_sword"}]}] run playsound minecraft:ui.button.click master @a[nbt=!{Inventory:[{Slot:10b,id:"minecraft:netherite_sword"}]}] ~ ~ ~ 0.2

# Defense
tag @a[nbt=!{Inventory:[{Slot:12b,id:"minecraft:netherite_chestplate"}]}] add shop_defense
tag @a[nbt=!{Inventory:[{Slot:12b,id:"minecraft:netherite_chestplate"}]}] remove shop_weapon
execute at @a[nbt=!{Inventory:[{Slot:12b,id:"minecraft:netherite_chestplate"}]}] run playsound minecraft:ui.button.click master @a[nbt=!{Inventory:[{Slot:12b,id:"minecraft:netherite_chestplate"}]}] ~ ~ ~ 0.2


# DROP-DOWN LIST BUTTONS
##########################################################################################
# IRON SWORD

# Fix bug
item replace entity @a[nbt=!{Inventory:[{Slot:10b,id:"minecraft:netherite_sword"}]}] container.18 with iron_sword[custom_data={tags:["shop"]}]

# Buing process
tag @a[scores={money=550..},tag=shop_weapon,nbt=!{Inventory:[{Slot:18b,id:"minecraft:iron_sword",components:{"minecraft:custom_data":{tags:["shop"]}}}]}] add buy_iron_sword
scoreboard players remove @a[tag=buy_iron_sword] money 550
execute at @a[tag=buy_iron_sword] run playsound minecraft:ui.button.click master @a[tag=buy_iron_sword] ~ ~ ~ 0.2
give @a[tag=buy_iron_sword] iron_sword
tag @a remove buy_iron_sword

# Steal control
clear @a[nbt=!{Inventory:[{Slot:18b,id:"minecraft:iron_sword"}]}] minecraft:iron_sword[custom_data={tags:["shop"]}]
clear @a[tag=!shop_weapon] minecraft:iron_sword[custom_data={tags:["shop"]}]

# Drop-down lists
item replace entity @a[tag=shop_weapon] container.18 with iron_sword[lore=['{"text":"550$","italic":false}'],custom_data={tags:["shop"]}]

# IRON SWORD
##########################################################################################
# TRIDENT

# Fix bug
item replace entity @a[nbt=!{Inventory:[{Slot:10b,id:"minecraft:netherite_sword"}]}] container.20 with minecraft:trident[custom_data={tags:["shop"]}]

# Buing process
tag @a[scores={money=5000..},tag=shop_weapon,nbt=!{Inventory:[{Slot:20b,id:"minecraft:trident",components:{"minecraft:custom_data":{tags:["shop"]}}}]}] add buy_trident
scoreboard players remove @a[tag=buy_trident] money 5000
execute at @a[tag=buy_trident] run playsound minecraft:ui.button.click master @a[tag=buy_trident] ~ ~ ~ 0.2
give @a[tag=buy_trident] minecraft:trident
tag @a remove buy_trident

# Steal control
clear @a[nbt=!{Inventory:[{Slot:20b,id:"minecraft:trident"}]}] minecraft:trident[custom_data={tags:["shop"]}]
clear @a[tag=!shop_weapon] minecraft:trident[custom_data={tags:["shop"]}]

# Drop-down lists
item replace entity @a[tag=shop_weapon] container.20 with minecraft:trident[lore=['{"text":"5000$","italic":false}'],custom_data={tags:["shop"]}]

# TRIDENT
##########################################################################################
# BOW

# Fix bug
item replace entity @a[nbt=!{Inventory:[{Slot:10b,id:"minecraft:netherite_sword"}]}] container.22 with minecraft:bow[custom_data={tags:["shop"]}]

# Buing process
tag @a[scores={money=890..},tag=shop_weapon,nbt=!{Inventory:[{Slot:22b,id:"minecraft:bow",components:{"minecraft:custom_data":{tags:["shop"]}}}]}] add buy_bow
scoreboard players remove @a[tag=buy_bow] money 890
execute at @a[tag=buy_bow] run playsound minecraft:ui.button.click master @a[tag=buy_bow] ~ ~ ~ 0.2
give @a[tag=buy_bow] minecraft:bow
tag @a remove buy_bow

# Steal control
clear @a[nbt=!{Inventory:[{Slot:20b,id:"minecraft:bow"}]}] minecraft:bow[custom_data={tags:["shop"]}]
clear @a[tag=!shop_weapon] minecraft:bow[custom_data={tags:["shop"]}]

# Drop-down lists
item replace entity @a[tag=shop_weapon] container.22 with minecraft:bow[lore=['{"text":"890$","italic":false}'],custom_data={tags:["shop"]}]

# BOW
##########################################################################################
# CROSSBOW

# Fix bug
item replace entity @a[nbt=!{Inventory:[{Slot:10b,id:"minecraft:netherite_sword"}]}] container.24 with minecraft:crossbow[custom_data={tags:["shop"]}]

# Buing process
tag @a[scores={money=3000..},tag=shop_weapon,nbt=!{Inventory:[{Slot:24b,id:"minecraft:crossbow",components:{"minecraft:custom_data":{tags:["shop"]}}}]}] add buy_crossbow
scoreboard players remove @a[tag=buy_crossbow] money 3000
execute at @a[tag=buy_crossbow] run playsound minecraft:ui.button.click master @a[tag=buy_crossbow] ~ ~ ~ 0.2
give @a[tag=buy_crossbow] minecraft:crossbow
tag @a remove buy_crossbow

# Steal control
clear @a[nbt=!{Inventory:[{Slot:24b,id:"minecraft:crossbow"}]}] minecraft:crossbow[custom_data={tags:["shop"]}]
clear @a[tag=!shop_weapon] minecraft:crossbow[custom_data={tags:["shop"]}]

# Drop-down lists
item replace entity @a[tag=shop_weapon] container.24 with minecraft:crossbow[lore=['{"text":"3000$","italic":false}'],custom_data={tags:["shop"]}]

# CROSSBOW
##########################################################################################
# ARROWS

# Fix bug
item replace entity @a[nbt=!{Inventory:[{Slot:10b,id:"minecraft:netherite_sword"}]}] container.26 with minecraft:arrow[custom_data={tags:["shop"]}]

# Buing process
tag @a[scores={money=100..},tag=shop_weapon,nbt=!{Inventory:[{Slot:26b,id:"minecraft:arrow",components:{"minecraft:custom_data":{tags:["shop"]}}}]}] add buy_arrow
scoreboard players remove @a[tag=buy_arrow] money 100
give @a[tag=buy_arrow] minecraft:arrow 10
execute at @a[tag=buy_arrow] run playsound minecraft:ui.button.click master @a[tag=buy_arrow] ~ ~ ~ 0.2
tag @a remove buy_arrow

# Steal control
clear @a[nbt=!{Inventory:[{Slot:26b,id:"minecraft:arrow"}]}] minecraft:arrow[custom_data={tags:["shop"]}]
clear @a[tag=!shop_weapon] minecraft:arrow[custom_data={tags:["shop"]}]

# Drop-down lists
item replace entity @a[tag=shop_weapon] container.26 with minecraft:arrow[lore=['{"text":"100$","italic":false}'],custom_data={tags:["shop"]}]

# ARROWS
##########################################################################################
# LEATHER ARMOR

# Fix bug
item replace entity @a[nbt=!{Inventory:[{Slot:12b,id:"minecraft:netherite_chestplate"}]}] container.18 with minecraft:leather_chestplate[custom_data={tags:["shop"]}]

# Buing process
tag @a[scores={money=700..},tag=shop_defense,nbt=!{Inventory:[{Slot:18b,id:"minecraft:leather_chestplate",components:{"minecraft:custom_data":{tags:["shop"]}}}]}] add buy_leather_chestplate
scoreboard players remove @a[tag=buy_leather_chestplate] money 700
item replace entity @a[tag=buy_leather_chestplate] armor.head with minecraft:leather_helmet
item replace entity @a[tag=buy_leather_chestplate] armor.chest with minecraft:leather_chestplate
item replace entity @a[tag=buy_leather_chestplate] armor.legs with minecraft:leather_leggings
item replace entity @a[tag=buy_leather_chestplate] armor.feet with minecraft:leather_boots
execute at @a[tag=buy_leather_chestplate] run playsound minecraft:ui.button.click master @a[tag=buy_leather_chestplate] ~ ~ ~ 0.2
tag @a remove buy_leather_chestplate

# Steal control
clear @a[nbt=!{Inventory:[{Slot:18b,id:"minecraft:leather_chestplate"}]}] minecraft:leather_chestplate[custom_data={tags:["shop"]}]
clear @a[tag=!shop_defense] minecraft:leather_chestplate[custom_data={tags:["shop"]}]

# Drop-down lists
item replace entity @a[tag=shop_defense] container.18 with minecraft:leather_chestplate[lore=['{"text":"700$","italic":false}'],custom_data={tags:["shop"]}]

# LEATHER ARMOR
##########################################################################################
# GOLDEN ARMOR

# Fix bug
item replace entity @a[nbt=!{Inventory:[{Slot:12b,id:"minecraft:netherite_chestplate"}]}] container.20 with minecraft:golden_chestplate[custom_data={tags:["shop"]}]

# Buing process
tag @a[scores={money=1400..},tag=shop_defense,nbt=!{Inventory:[{Slot:20b,id:"minecraft:golden_chestplate",components:{"minecraft:custom_data":{tags:["shop"]}}}]}] add buy_golden_chestplate
scoreboard players remove @a[tag=buy_golden_chestplate] money 1400
item replace entity @a[tag=buy_golden_chestplate] armor.head with minecraft:golden_helmet
item replace entity @a[tag=buy_golden_chestplate] armor.chest with minecraft:golden_chestplate
item replace entity @a[tag=buy_golden_chestplate] armor.legs with minecraft:golden_leggings
item replace entity @a[tag=buy_golden_chestplate] armor.feet with minecraft:golden_boots
execute at @a[tag=buy_golden_chestplate] run playsound minecraft:ui.button.click master @a[tag=buy_golden_chestplate] ~ ~ ~ 0.2
tag @a remove buy_golden_chestplate

# Steal control
clear @a[nbt=!{Inventory:[{Slot:20b,id:"minecraft:golden_chestplate"}]}] minecraft:golden_chestplate[custom_data={tags:["shop"]}]
clear @a[tag=!shop_defense] minecraft:golden_chestplate[custom_data={tags:["shop"]}]

# Drop-down lists
item replace entity @a[tag=shop_defense] container.20 with minecraft:golden_chestplate[lore=['{"text":"1400$","italic":false}'],custom_data={tags:["shop"]}]

# GOLDEN ARMOR
##########################################################################################
# CHAINMAIL ARMOR

# Fix bug
item replace entity @a[nbt=!{Inventory:[{Slot:12b,id:"minecraft:netherite_chestplate"}]}] container.22 with minecraft:chainmail_chestplate[custom_data={tags:["shop"]}]

# Buing process
tag @a[scores={money=1600..},tag=shop_defense,nbt=!{Inventory:[{Slot:22b,id:"minecraft:chainmail_chestplate",components:{"minecraft:custom_data":{tags:["shop"]}}}]}] add buy_chainmail_chestplate
scoreboard players remove @a[tag=buy_chainmail_chestplate] money 1600
item replace entity @a[tag=buy_chainmail_chestplate] armor.head with minecraft:chainmail_helmet
item replace entity @a[tag=buy_chainmail_chestplate] armor.chest with minecraft:chainmail_chestplate
item replace entity @a[tag=buy_chainmail_chestplate] armor.legs with minecraft:chainmail_leggings
item replace entity @a[tag=buy_chainmail_chestplate] armor.feet with minecraft:chainmail_boots
execute at @a[tag=buy_chainmail_chestplate] run playsound minecraft:ui.button.click master @a[tag=buy_chainmail_chestplate] ~ ~ ~ 0.2
tag @a remove buy_chainmail_chestplate

# Steal control
clear @a[nbt=!{Inventory:[{Slot:22b,id:"minecraft:chainmail_chestplate"}]}] minecraft:chainmail_chestplate[custom_data={tags:["shop"]}]
clear @a[tag=!shop_defense] minecraft:chainmail_chestplate[custom_data={tags:["shop"]}]

# Drop-down lists
item replace entity @a[tag=shop_defense] container.22 with minecraft:chainmail_chestplate[lore=['{"text":"1600$","italic":false}'],custom_data={tags:["shop"]}]

# CHAINMAIL ARMOR
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
clear @a[nbt=!{Inventory:[{Slot:10b,id:"minecraft:netherite_sword"}]}] minecraft:netherite_sword[custom_data={tags:["shop"]}]
item replace entity @a container.10 with netherite_sword[custom_name='{"text":"Weapon","italic":false,"color":"dark_red","bold":true}',enchantments={levels:{"minecraft:unbreaking":1},show_in_tooltip:false}, custom_data={tags:["shop"]}]

# Defense
clear @a[nbt=!{Inventory:[{Slot:12b,id:"minecraft:netherite_chestplate"}]}] minecraft:netherite_chestplate[custom_data={tags:["shop"]}]
item replace entity @a container.12 with netherite_chestplate[custom_name='{"text":"Defense","italic":false,"color":"green","bold":true}',enchantments={levels:{"minecraft:unbreaking":1},show_in_tooltip:false}, custom_data={tags:["shop"]}]


# DROP DOWN LISTS
##########################################################################################
# OTHER

# Steal control
kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{tags:["shop"]}}}}]

# Show money
execute as @a run title @s actionbar [{"text":"Money: ","color":"yellow"},{"score":{"name":"@s","objective":"money"},"color":"green"},{"text":"$","color":"green"}]


# OTHER
##########################################################################################
