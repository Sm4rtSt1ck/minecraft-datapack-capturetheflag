#########################################
# TEST MAP

clear @a[tag=lobby, nbt=!{Inventory:[{id: "minecraft:carrot_on_a_stick", Slot:0b}]}] carrot_on_a_stick[map_id=0]

# Give items
item replace entity @a[tag=lobby] hotbar.0 with carrot_on_a_stick[\
    item_model="filled_map",\
    map_id=0,\
    custom_data={tags: ["menu"]},\
    custom_name="{\
        \"shadow_color\": -16252673,\
        \"text\" :\"Test map\"\
    }"\
]

# Check first map choice (left hand)
execute as @a[tag=lobby, scores={carrot_on_stick=1..}] if items entity @s weapon.mainhand *[minecraft:map_id=0] run scoreboard players set @s map_vote 1

#########################################
# GREEN MINE

clear @a[tag=lobby, nbt=!{Inventory:[{id: "minecraft:carrot_on_a_stick", Slot:1b}]}] carrot_on_a_stick[map_id=1]

# Give items
item replace entity @a[tag=lobby] hotbar.1 with carrot_on_a_stick[\
    item_model="filled_map",\
    map_id=1,\
    custom_data={tags: ["menu"]},\
    custom_name="{\
        \"shadow_color\": -16252673,\
        \"text\" :\"GreenMine\"\
    }"\
]

# Check first map choice (left hand)
execute as @a[tag=lobby, scores={carrot_on_stick=1..}] if items entity @s weapon.mainhand *[minecraft:map_id=1] run scoreboard players set @s map_vote 2

#########################################
# NIGHT CLUB

clear @a[tag=lobby, nbt=!{Inventory:[{id: "minecraft:carrot_on_a_stick", Slot:2b}]}] carrot_on_a_stick[map_id=2]

# Give items
item replace entity @a[tag=lobby] hotbar.2 with carrot_on_a_stick[\
    item_model="filled_map",\
    map_id=2,\
    custom_data={tags: ["menu"]},\
    custom_name="{\
        \"shadow_color\": -16252673,\
        \"text\" :\"Night Club\"\
    }"\
]

# Check first map choice (left hand)
execute as @a[tag=lobby, scores={carrot_on_stick=1..}] if items entity @s weapon.mainhand *[minecraft:map_id=2] run scoreboard players set @s map_vote 3

#########################################
# FARM

clear @a[tag=lobby, nbt=!{Inventory:[{id: "minecraft:carrot_on_a_stick", Slot:3b}]}] carrot_on_a_stick[map_id=3]

# Give items
item replace entity @a[tag=lobby] hotbar.3 with carrot_on_a_stick[\
    item_model="filled_map",\
    map_id=3,\
    custom_data={tags: ["menu"]},\
    custom_name="{\
        \"shadow_color\": -16252673,\
        \"text\" :\"Farm\"\
    }"\
]

# Check first map choice (left hand)
execute as @a[tag=lobby, scores={carrot_on_stick=1..}] if items entity @s weapon.mainhand *[minecraft:map_id=3] run scoreboard players set @s map_vote 4

#########################################
# RAILWAY STATION

clear @a[tag=lobby, nbt=!{Inventory:[{id: "minecraft:carrot_on_a_stick", Slot:4b}]}] carrot_on_a_stick[map_id=4]

# Give items
item replace entity @a[tag=lobby] hotbar.4 with carrot_on_a_stick[\
    item_model="filled_map",\
    map_id=4,\
    custom_data={tags: ["menu"]},\
    custom_name="{\
        \"shadow_color\": -16252673,\
        \"text\" :\"Railway station\"\
    }"\
]

# Check first map choice (left hand)
execute as @a[tag=lobby, scores={carrot_on_stick=1..}] if items entity @s weapon.mainhand *[minecraft:map_id=4] run scoreboard players set @s map_vote 5

#########################################
# SPECTATING BUTTON

clear @a[tag=lobby, nbt=!{Inventory:[{id: "minecraft:carrot_on_a_stick", Slot:7b}]}] carrot_on_a_stick[item_model=ender_eye]
clear @a[tag=lobby, nbt=!{Inventory:[{id: "minecraft:carrot_on_a_stick", Slot:7b}]}] carrot_on_a_stick[item_model=ender_pearl]

# Give an item
item replace entity @a[tag=lobby, tag=!spectator] hotbar.7 with carrot_on_a_stick[\
    item_model=ender_eye,\
    custom_name='[\
        {"shadow_color":-65536,"text":"Spectate "},\
        {"color":"#00e1ff","text":"["},\
        {"color":"#00e1ff","keybind":"key.use"},\
        {"color":"#00e1ff","text":"]"}]',\
    custom_data={tags:["menu"]}\
]
item replace entity @a[tag=lobby, tag=spectator] hotbar.7 with carrot_on_a_stick[\
    item_model=ender_pearl,\
    custom_name='[\
        {"shadow_color":-65536,"text":"Do not spectate "},\
        {"color":"#00e1ff","text":"["},\
        {"color":"#00e1ff","keybind":"key.use"},\
        {"color":"#00e1ff","text":"]"}]',\
    custom_data={tags:["menu"]}\
]

# Check pressing
execute as @a[tag=lobby, scores={carrot_on_stick=1..}] if items entity @s weapon.mainhand *[item_model=ender_eye] \
        run tag @s add spectator
execute as @a[tag=lobby, scores={carrot_on_stick=1..}] if items entity @s weapon.mainhand *[item_model=ender_pearl] \
        run tag @s remove spectator

#########################################
# RUN GAME BUTTON

clear @a[tag=lobby, nbt=!{Inventory:[{id: "minecraft:carrot_on_a_stick", Slot:8b}]}] carrot_on_a_stick[item_model="firework_rocket"]

# Give an item
item replace entity @a[tag=lobby] hotbar.8 with carrot_on_a_stick[\
    item_model="firework_rocket",\
    custom_name='[\
        {"shadow_color":-65536,"text":"Launch! "},\
        {"color":"light_purple","text":"["},\
        {"color":"light_purple","keybind":"key.use"},\
        {"color":"light_purple","text":"]"}]',\
    custom_data={tags:["menu"]}\
]

# Check pressing
execute if items entity @r[tag=lobby, scores={carrot_on_stick=1..}] weapon.mainhand *[item_model="firework_rocket"] \
    if entity @r[scores={map_vote=-2147483647..2147483647}] \
        run function ctf:lobby/vote/check_results
execute as @r[tag=lobby, scores={carrot_on_stick=1..}] \
    if items entity @s weapon.mainhand *[item_model="firework_rocket"] \
    unless entity @a[scores={map_vote=-2147483648..2147483647}] \
        run tellraw @s {"text": "No one voted for the map!", "color": "red"}

#########################################

# Random number
scoreboard players add random number 1

title @a[tag=lobby] actionbar [{"color":"blue","text":"Press "},{"color":"light_purple","text":"["},{"keybind":"key.use", "color": "light_purple"},{"color":"light_purple", "text":"]"},{"color":"blue","text":" to vote"}]
