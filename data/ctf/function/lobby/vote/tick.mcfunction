#########################################
# MAP BUTTONS

# Test map
function ctf:lobby/vote/map_button_tick {slot: 0, id: 0, name: "Test map", score: 1}
# Green mine
function ctf:lobby/vote/map_button_tick {slot: 1, id: 1, name: "Green mine", score: 2}
# Night club
function ctf:lobby/vote/map_button_tick {slot: 2, id: 2, name: "Night club", score: 3}
# Farm
function ctf:lobby/vote/map_button_tick {slot: 3, id: 3, name: "Farm", score: 4}
# Railway station
function ctf:lobby/vote/map_button_tick {slot: 4, id: 4, name: "Railway station", score: 5}

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
    if entity @r[scores={map_vote_player=-2147483647..2147483647}] \
        run function ctf:lobby/vote/results/check
execute as @r[tag=lobby, scores={carrot_on_stick=1..}] \
    if items entity @s weapon.mainhand *[item_model="firework_rocket"] \
    unless entity @a[scores={map_vote_player=-2147483648..2147483647}] \
        run tellraw @s {"text": "No one voted for the map!", "color": "red"}

#########################################
# OTHER

# Random number
scoreboard players add random number 1

title @a[tag=lobby] actionbar [\
    {"color":"blue","text":"Press "},\
    {"color":"light_purple","text":"["},\
    {"keybind":"key.use", "color": "light_purple"},\
    {"color":"light_purple", "text":"]"},\
    {"color":"blue","text":" to vote"}\
]
