# clear @a[tag=player, nbt=!{Inventory:[{id:"minecraft:black_stained_glass_pane",count:27,components:{"minecraft:custom_data":{tags:["shop"]}}}]}] minecraft:black_stained_glass_pane
execute as @a[tag=player] if items entity @s player.cursor black_stained_glass_pane run item replace entity @a[tag=player] player.cursor with air
execute as @a[tag=player] if items entity @s weapon.offhand black_stained_glass_pane run item replace entity @a[tag=player] weapon.offhand with air
execute as @a[tag=player] if items entity @s hotbar.0 black_stained_glass_pane run item replace entity @a[tag=player] hotbar.0 with air
execute as @a[tag=player] if items entity @s hotbar.1 black_stained_glass_pane run item replace entity @a[tag=player] hotbar.1 with air
execute as @a[tag=player] if items entity @s hotbar.2 black_stained_glass_pane run item replace entity @a[tag=player] hotbar.2 with air
execute as @a[tag=player] if items entity @s hotbar.3 black_stained_glass_pane run item replace entity @a[tag=player] hotbar.3 with air
execute as @a[tag=player] if items entity @s hotbar.4 black_stained_glass_pane run item replace entity @a[tag=player] hotbar.4 with air
execute as @a[tag=player] if items entity @s hotbar.5 black_stained_glass_pane run item replace entity @a[tag=player] hotbar.5 with air
execute as @a[tag=player] if items entity @s hotbar.6 black_stained_glass_pane run item replace entity @a[tag=player] hotbar.6 with air
execute as @a[tag=player] if items entity @s hotbar.7 black_stained_glass_pane run item replace entity @a[tag=player] hotbar.7 with air

item replace entity @a[tag=player] container.9 with minecraft:black_stained_glass_pane[custom_name='""', custom_data={tags:["shop"]}]
item replace entity @a[tag=player] container.10 with minecraft:black_stained_glass_pane[custom_name='""', custom_data={tags:["shop"]}]
item replace entity @a[tag=player] container.11 with minecraft:black_stained_glass_pane[custom_name='""', custom_data={tags:["shop"]}]
item replace entity @a[tag=player] container.12 with minecraft:black_stained_glass_pane[custom_name='""', custom_data={tags:["shop"]}]
item replace entity @a[tag=player] container.13 with minecraft:black_stained_glass_pane[custom_name='""', custom_data={tags:["shop"]}]
item replace entity @a[tag=player] container.14 with minecraft:black_stained_glass_pane[custom_name='""', custom_data={tags:["shop"]}]
item replace entity @a[tag=player] container.15 with minecraft:black_stained_glass_pane[custom_name='""', custom_data={tags:["shop"]}]
item replace entity @a[tag=player] container.16 with minecraft:black_stained_glass_pane[custom_name='""', custom_data={tags:["shop"]}]
item replace entity @a[tag=player] container.17 with minecraft:black_stained_glass_pane[custom_name='""', custom_data={tags:["shop"]}]
item replace entity @a[tag=player] container.18 with minecraft:black_stained_glass_pane[custom_name='""', custom_data={tags:["shop"]}]
item replace entity @a[tag=player] container.19 with minecraft:black_stained_glass_pane[custom_name='""', custom_data={tags:["shop"]}]
item replace entity @a[tag=player] container.20 with minecraft:black_stained_glass_pane[custom_name='""', custom_data={tags:["shop"]}]
item replace entity @a[tag=player] container.21 with minecraft:black_stained_glass_pane[custom_name='""', custom_data={tags:["shop"]}]
item replace entity @a[tag=player] container.22 with minecraft:black_stained_glass_pane[custom_name='""', custom_data={tags:["shop"]}]
item replace entity @a[tag=player] container.23 with minecraft:black_stained_glass_pane[custom_name='""', custom_data={tags:["shop"]}]
item replace entity @a[tag=player] container.24 with minecraft:black_stained_glass_pane[custom_name='""', custom_data={tags:["shop"]}]
item replace entity @a[tag=player] container.25 with minecraft:black_stained_glass_pane[custom_name='""', custom_data={tags:["shop"]}]
item replace entity @a[tag=player] container.26 with minecraft:black_stained_glass_pane[custom_name='""', custom_data={tags:["shop"]}]
item replace entity @a[tag=player] container.27 with minecraft:black_stained_glass_pane[custom_name='""', custom_data={tags:["shop"]}]
item replace entity @a[tag=player] container.28 with minecraft:black_stained_glass_pane[custom_name='""', custom_data={tags:["shop"]}]
item replace entity @a[tag=player] container.29 with minecraft:black_stained_glass_pane[custom_name='""', custom_data={tags:["shop"]}]
item replace entity @a[tag=player] container.30 with minecraft:black_stained_glass_pane[custom_name='""', custom_data={tags:["shop"]}]
item replace entity @a[tag=player] container.31 with minecraft:black_stained_glass_pane[custom_name='""', custom_data={tags:["shop"]}]
item replace entity @a[tag=player] container.32 with minecraft:black_stained_glass_pane[custom_name='""', custom_data={tags:["shop"]}]
item replace entity @a[tag=player] container.33 with minecraft:black_stained_glass_pane[custom_name='""', custom_data={tags:["shop"]}]
item replace entity @a[tag=player] container.34 with minecraft:black_stained_glass_pane[custom_name='""', custom_data={tags:["shop"]}]
item replace entity @a[tag=player] container.35 with minecraft:black_stained_glass_pane[custom_name='""', custom_data={tags:["shop"]}]
# item replace entity @a[tag=player] container.36 with minecraft:black_stained_glass_pane[custom_name='""',custom_data={tags:["shop"]}]
kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{tags:["shop"]}}}}]

clear @a[tag=player, tag=!ultimate, nbt=!{Inventory:[{Slot:8b, components:{"minecraft:custom_data":{action:"exit"}}}]}] carrot_on_a_stick[custom_data={action:"exit"}]
item replace entity @a[tag=player, tag=!ultimate] hotbar.8 with carrot_on_a_stick[item_model="minecraft:red_bed", custom_name='[{"text":"Exit to lobby ["}, {"keybind":"key.use"}, {"text": "]"}]',custom_data={action:"exit"}]
kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{action:"exit"}}}}]

clear @a[tag=player, tag=!ultimate, nbt=!{Inventory:[{Slot:7b, components:{"minecraft:custom_data":{action:"ultimate"}}}]}] carrot_on_a_stick[custom_data={action:"ultimate"}]
item replace entity @a[tag=player, tag=!ultimate] hotbar.7 with carrot_on_a_stick[item_model="minecraft:blaze_rod", custom_name='[{"text":"ULTIMATE [", "color": "#f94bff", "bold": true, "italic": false, "shadow_color": -8379784}, {"keybind":"key.use"}, {"text": "]"}]',custom_data={action:"ultimate"}]
kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{action:"ultimate"}}}}]

# item replace entity @a[tag=player, nbt=!{Inventory:[{Slot:0b, components:{"minecraft:custom_data":{tags:["main weapon"]}}}]}] container.0 with black_stained_glass_pane[custom_name='""', custom_data={tags:["main weapon"]}]


