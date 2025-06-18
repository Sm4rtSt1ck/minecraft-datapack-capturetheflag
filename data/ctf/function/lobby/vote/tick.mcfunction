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
    item_model=ender_pearl,\
    custom_name='[\
        {"color":"#ffbb00","text":"Spectator mode: ", "bold": true, "italic": false},\
        {"shadow_color":-5767168, "color":"red","text":"OFF"}\
    ]',\
    custom_data={tags:["menu"]}\
]
item replace entity @a[tag=lobby, tag=spectator] hotbar.7 with carrot_on_a_stick[\
    item_model=ender_eye,\
    custom_name='[\
        {"color":"#ffbb00","text":"Spectator mode: ", "bold": true, "italic": false},\
        {"shadow_color":-12935680,"color":"green","text":"ON"}\
    ]',\
    custom_data={tags:["menu"]}\
]

# Check pressing
execute as @a[tag=lobby, scores={carrot_on_stick=1..}] if items entity @s weapon.mainhand *[item_model=ender_pearl] \
        run tag @s add spectator
execute as @a[tag=lobby, scores={carrot_on_stick=1..}] if items entity @s weapon.mainhand *[item_model=ender_eye] \
        run tag @s remove spectator

#########################################
# RUN GAME BUTTON

# clear @a[tag=lobby, nbt=!{Inventory:[{id: "minecraft:carrot_on_a_stick", Slot:8b}]}] carrot_on_a_stick[item_model="firework_rocket"]

# # Give an item
# item replace entity @a[tag=lobby] hotbar.8 with carrot_on_a_stick[\
#     item_model="firework_rocket",\
#     custom_name='{"shadow_color":-6029142,"color":"#ff32ff","text":"LAUNCH", "italic": false, "bold": true}',\
#     custom_data={tags:["menu"]}\
# ]

# # Check pressing
# execute if items entity @r[tag=lobby, scores={carrot_on_stick=1..}] weapon.mainhand *[item_model="firework_rocket"] \
#     if entity @r[scores={map_vote_player=-2147483647..2147483647}] \
#         run function ctf:lobby/vote/results/check
# execute as @r[tag=lobby, scores={carrot_on_stick=1..}] \
#     if items entity @s weapon.mainhand *[item_model="firework_rocket"] \
#     unless entity @a[scores={map_vote_player=-2147483648..2147483647}] \
#         run tellraw @s {"text": "No one voted for the map!", "color": "red"}

#########################################
# OTHER

# Random number
scoreboard players add random number 1

title @a[tag=lobby] actionbar [\
    {"color":"blue","text":"Press ", "italic": false, "bold": true, "shadow_color": -11009878},\
    {"color":"light_purple","text":"["},\
    {"keybind":"key.use", "color": "light_purple"},\
    {"color":"light_purple", "text":"]"},\
    {"color":"blue","text":" to vote"}\
]

scoreboard players remove vote timer 1
execute store result bossbar ctf:match value run scoreboard players get vote timer
execute if score vote timer matches ..0 run function ctf:combine_commands {\
    command_1: "execute if entity @r[scores={map_vote_player=-2147483647..2147483647}] run function ctf:lobby/vote/results/check",\
    command_2: "execute unless entity @r[scores={map_vote_player=-2147483647..2147483647}] run function ctf:lobby/vote/cancel"\
}
execute unless entity @a[tag=!voted] if score vote timer matches 101.. run scoreboard players set vote timer 100

execute if score vote timer matches 100 run title @a subtitle ""
execute if score vote timer matches 100 run title @a title {"text":"❺", "color":"green"}
execute if score vote timer matches 100 as @a at @s run playsound entity.experience_orb.pickup ambient @s ~ ~ ~ 1 0.4
execute if score vote timer matches 80 run title @a title {"text":"❹", "color":"green"}
execute if score vote timer matches 80 as @a at @s run playsound entity.experience_orb.pickup ambient @s ~ ~ ~ 1 0.55
execute if score vote timer matches 60 run title @a title {"text":"❸", "color":"green"}
execute if score vote timer matches 60 as @a at @s run playsound entity.experience_orb.pickup ambient @s ~ ~ ~ 1 0.65
execute if score vote timer matches 40 run title @a title {"text":"❷", "color":"green"}
execute if score vote timer matches 40 as @a at @s run playsound entity.experience_orb.pickup ambient @s ~ ~ ~ 1 0.825
execute if score vote timer matches 20 run title @a title {"text":"❶", "color":"green"}
execute if score vote timer matches 20 as @a at @s run playsound entity.experience_orb.pickup ambient @s ~ ~ ~ 1 1
