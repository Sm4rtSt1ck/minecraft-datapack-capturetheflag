#########################################
# EVENTS HANDLING

execute as @a[scores={just_died=1..}] run function ctf:lobby/events/die

#########################################
# RUN GAME BUTTON

# Give an item
item replace entity @a[tag=lobby,tag=admin] hotbar.8 with firework_rocket[\
    custom_name="{\
        \"shadow_color\": -65536,\
        \"text\" :\"Launch!\"\
    }",\
    custom_data={tags:["menu"]}\
]

# Check pressing
execute if entity @a[\
    tag=lobby, tag=admin,\
    nbt={Inventory:[{\
        id:"minecraft:firework_rocket",\
        Slot:-106b,\
    }]}\
] as @a run function ctf:match/start


#########################################
# OTHER

kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{tags:["menu"]}}}}]
