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

item replace entity @a[tag=player] hotbar.8 with carrot_on_a_stick[item_model="minecraft:red_bed", custom_name='[{"text":"Exit to lobby ["}, {"keybind":"key.use"}, {"text": "]"}]',custom_data={action:"exit"}]
kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{action:"exit"}}}}]
