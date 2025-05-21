#########################################
# EVENTS HANDLING

execute as @a[scores={just_died=1..}] run function ctf:lobby/events/die

#########################################
# RUN GAME BUTTON

# Give an item
item replace entity @a[tag=lobby,tag=admin] hotbar.8 with carrot_on_a_stick[\
    item_model="firework_rocket",\
    custom_name='[\
        {"shadow_color":-65536,"text":"Launch! "},\
        {"color":"light_purple","text":"["},\
        {"color":"light_purple","keybind":"key.use"},\
        {"color":"light_purple","text":"]"}]',\
    custom_data={tags:["menu"]}\
]

# Check pressing
execute if items entity @a[tag=lobby, tag=admin, scores={carrot_on_stick=1..}] weapon.mainhand *[item_model="firework_rocket"] as @a run function ctf:match/start
#     nbt={Inventory:[{\
#         id:"minecraft:firework_rocket",\
#         Slot:-106b\
#     }]}\
# ] as @a run function ctf:match/start


#########################################
# OTHER

# clear @a *[custom_data={tags:["menu"]}]
kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{tags:["menu"]}}}}]
