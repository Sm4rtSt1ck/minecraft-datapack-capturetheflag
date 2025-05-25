execute as @s[nbt=!{Inventory:[{components:{"minecraft:custom_data":{tags:["shop", "item"]}}, Slot:18b}]}] run \
    function ctf:match/freeze/shop/defense/custom/gold_armor {slot: 18, cost: 144, item_name: '{"text": "Gold armor"}'}

execute as @s[nbt=!{Inventory:[{components:{"minecraft:custom_data":{tags:["shop", "item"]}}, Slot:20b}]}] run \
    function ctf:match/freeze/shop/defense/custom/iron_armor {slot: 20, cost: 304, item_name: '{"text": "Iron armor"}'}

# execute as @s[nbt=!{Inventory:[{components:{"minecraft:custom_data":{tags:["shop", "item"]}}, Slot:22b}]}] run \
#     function ctf:match/freeze/shop/defense/custom/netherite_armor {slot: 22, cost: 1500, item_name: '{"text": "Netherite armor"}'}

execute as @s[tag=attack, nbt=!{Inventory:[{components:{"minecraft:custom_data":{tags:["shop", "item"]}}, Slot:24b}]}] run \
    function ctf:match/freeze/shop/templates/click_item {item: 'shield', nbt: 'base_color="orange",banner_patterns=[\
        {"pattern":"gradient","color":"black"},\
        {"pattern":"skull","color":"black"},\
        {"pattern":"gradient_up","color":"red"},\
        {"pattern":"triangles_bottom","color":"orange"},\
        {"pattern":"triangles_bottom","color":"red"}\
    ], damage=316', slot: 24, cost: 70, tag: "", item_name: '{"text": "Shield"}', amount: 1}

execute as @s[tag=defense, nbt=!{Inventory:[{components:{"minecraft:custom_data":{tags:["shop", "item"]}}, Slot:24b}]}] run \
    function ctf:match/freeze/shop/templates/click_item {item: 'shield', nbt: 'base_color="blue",banner_patterns=[\
        {"pattern":"gradient_up","color":"light_blue"},\
        {"pattern":"flower","color":"light_blue"}\
    ], damage=316', slot: 24, cost: 70, tag: "", item_name: '{"text": "Shield"}', amount: 1}

