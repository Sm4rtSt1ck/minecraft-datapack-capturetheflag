#########################################
# MAP 1

# Give items
item replace entity @s hotbar.0 with carrot_on_a_stick[\
    item_model="filled_map",\
    map_id=0,\
    custom_data={tags: ["menu"]},\
    custom_name="{\
        \"shadow_color\": -16252673,\
        \"text\" :\"Test map\"\
    }"\
]

# Check first map choice (left hand)
execute as @a[tag=lobby, tag=admin, scores={carrot_on_stick=1..}] if items entity @s weapon.mainhand *[minecraft:map_id=0] run scoreboard players set @s map_vote 1

#########################################
# MAP 2

# Give items
item replace entity @s hotbar.1 with carrot_on_a_stick[\
    item_model="filled_map",\
    map_id=1,\
    custom_data={tags: ["menu"]},\
    custom_name="{\
        \"shadow_color\": -16252673,\
        \"text\" :\"GreenMine\"\
    }"\
]

# Check first map choice (left hand)
execute as @a[tag=lobby, tag=admin, scores={carrot_on_stick=1..}] if items entity @s weapon.mainhand *[minecraft:map_id=1] run scoreboard players set @s map_vote 2
#########################################
# MAP 3

# Give items
item replace entity @s hotbar.2 with carrot_on_a_stick[\
    item_model="filled_map",\
    map_id=2,\
    custom_data={tags: ["menu"]},\
    custom_name="{\
        \"shadow_color\": -16252673,\
        \"text\" :\"Night Club\"\
    }"\
]

# Check first map choice (left hand)
execute as @a[tag=lobby, tag=admin, scores={carrot_on_stick=1..}] if items entity @s weapon.mainhand *[minecraft:map_id=2] run scoreboard players set @s map_vote 3

#########################################

title @s actionbar [{"color":"blue","text":"Press "},{"color":"light_purple","text":"["},{"keybind":"key.use", "color": "light_purple"},{"color":"light_purple", "text":"]"},{"color":"blue","text":" to vote"}]
