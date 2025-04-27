#########################################
# Map 1

# Give items
item replace entity @s hotbar.0 with filled_map[\
    custom_name="{\
        \"shadow_color\": -16252673,\
        \"text\" :\"Map 1\"\
    }",\
    map_id=1\
]

# Check first map choice (left hand)
execute if entity @s[\
    nbt={Inventory:[{\
        id:"minecraft:filled_map",\
        Slot:-106b,\
        components:{"minecraft:map_id":1}\
    }]}\
] run \
    scoreboard players set @s map_vote 1

#########################################
# Map 2

# Give items
item replace entity @s hotbar.1 with filled_map[\
    custom_name="{\
        \"shadow_color\": -16252673,\
        \"text\" :\"Map 2\"\
    }",\
    map_id=2\
]

# Check first map choice (left hand)
execute if entity @s[\
    nbt={Inventory:[{\
        id:"minecraft:filled_map",\
        Slot:-106b,\
        components:{"minecraft:map_id":2}\
    }]}\
] run \
    scoreboard players set @s map_vote 2

#########################################
# Clear left hand
item replace entity @s weapon.offhand with air