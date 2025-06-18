# PARENT: lobby/vote/tick

$clear @a[tag=lobby, nbt=!{Inventory:[{id: "minecraft:carrot_on_a_stick", Slot:$(slot)b}]}] carrot_on_a_stick[map_id=$(id)]

# Give items
$execute as @a[tag=lobby] unless score @s map_vote_player matches $(score) run item replace entity @s hotbar.$(slot) with carrot_on_a_stick[\
    item_model="filled_map",\
    map_id=$(id),\
    map_color=16711680,\
    custom_data={tags: ["menu"]},\
    custom_name='{\
        "bold":true,\
        "color":"red",\
        "italic":false,\
        "shadow_color":-5767168,\
        "text" :"$(name)"\
    }'\
]
$item replace entity @a[tag=lobby, scores={map_vote_player=$(score)}] hotbar.$(slot) with carrot_on_a_stick[\
    item_model="filled_map",\
    map_id=$(id),\
    map_color=65280,\
    custom_data={tags: ["menu"]},\
    custom_name='{\
        "bold":true,\
        "color":"green",\
        "italic":false,\
        "shadow_color":-16734208,\
        "text" :"$(name)"\
    }'\
]

# Check map choice
$execute as @a[tag=lobby, scores={carrot_on_stick=1.., map_vote_player=$(score)}] if items entity @s weapon.mainhand *[minecraft:map_id=$(id)] run tag @s add unvote
$execute as @a[tag=lobby, scores={carrot_on_stick=1..}] if items entity @s weapon.mainhand *[minecraft:map_id=$(id)] run function ctf:combine_commands {\
    command_1: "scoreboard players set @s map_vote_player $(score)",\
    command_2: "tag @s add voted"\
}
scoreboard players reset @a[tag=unvote] map_vote_player
tag @a[tag=unvote] remove voted
tag @a remove unvote
