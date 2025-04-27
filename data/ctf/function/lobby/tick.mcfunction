#########################################
# Run game button

# Give item
item replace entity @a[tag=lobby,tag=admin] hotbar.8 with firework_rocket[\
    custom_name="{\
        \"shadow_color\": -65536,\
        \"text\" :\"Launch!\"\
    }"\
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

execute as @a[tag=lobby] run function ctf:lobby/vote/vote