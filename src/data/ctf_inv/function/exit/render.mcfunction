clear @s *[custom_data~{ctf_craft:{}}]

item replace entity @s player.crafting.0 with minecraft:paper[\
    item_model="minecraft:red_bed",\
    custom_name='{"text": "EXIT TO LOBBY", "color": "red", "bold": true, "italic": false}',\
    lore=['{"text": "Click to leave the match", "color": "gray", "italic": false}'],\
    max_stack_size=1,\
    custom_data={ctf_craft:{id:"exit"}, bind:1b}\
]

execute unless score @s exit_confirm matches 1 run return 0
item replace entity @s player.crafting.2 with minecraft:paper[\
    item_model="minecraft:lime_concrete",\
    custom_name='{"text": "YES, EXIT", "color": "green", "bold": true, "italic": false}',\
    max_stack_size=1,\
    custom_data={ctf_craft:{id:"yes"}, bind:1b}\
]
item replace entity @s player.crafting.3 with minecraft:paper[\
    item_model="minecraft:red_concrete",\
    custom_name='{"text": "NO, STAY", "color": "red", "bold": true, "italic": false}',\
    max_stack_size=1,\
    custom_data={ctf_craft:{id:"no"}, bind:1b}\
]
