#########################################
# MAP 1

# Give items
item replace entity @s hotbar.0 with filled_map[\
    custom_name="{\
        \"shadow_color\": -16252673,\
        \"text\" :\"Test map\"\
    }",\
    map_id=0,\
    custom_data={tags:["menu"]}\
]

# Check first map choice (left hand)
execute if entity @s[\
    nbt={Inventory:[{\
        id:"minecraft:filled_map",\
        Slot:-106b,\
        components:{"minecraft:map_id":0}\
    }]}\
] run \
    scoreboard players set @s map_vote 1

#########################################
# MAP 2

# Give items
item replace entity @s hotbar.1 with filled_map[\
    custom_name="{\
        \"shadow_color\": -16252673,\
        \"text\" :\"Green Mine\"\
    }",\
    map_id=1,\
    custom_data={tags:["menu"]}\
]

# Check first map choice (left hand)
execute if entity @s[\
    nbt={Inventory:[{\
        id:"minecraft:filled_map",\
        Slot:-106b,\
        components:{"minecraft:map_id":1}\
    }]}\
] run \
    scoreboard players set @s map_vote 2
#########################################
# MAP 3

# Give items
item replace entity @s hotbar.2 with filled_map[\
    custom_name="{\
        \"shadow_color\": -16252673,\
        \"text\" :\"Night Club\"\
    }",\
    map_id=2,\
    custom_data={tags:["menu"]}\
]

# Check first map choice (left hand)
execute if entity @s[\
    nbt={Inventory:[{\
        id:"minecraft:filled_map",\
        Slot:-106b,\
        components:{"minecraft:map_id":2}\
    }]}\
] run \
    scoreboard players set @s map_vote 3

#########################################
# CLEAR THE LEFT HAND AFTER ALL CHECKINGS

item replace entity @s weapon.offhand with air