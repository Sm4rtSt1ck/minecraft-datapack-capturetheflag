# DEFENSE

execute as @s[tag=defense, nbt=!{Inventory:[{components:{"minecraft:custom_data":{tags:["shop", "item"]}}, Slot:18b}]}] run \
    function ctf:match/freeze/shop/kits/custom/tnt_trap {slot: 18, cost: 1000, item_name: '{"text": "TNT traps x3"}'}

execute as @s[tag=defense, nbt=!{Inventory:[{components:{"minecraft:custom_data":{tags:["shop", "item"]}}, Slot:20b}]}] run \
    function ctf:match/freeze/shop/kits/custom/anvil_trap {slot: 20, cost: 1000, item_name: '{"text": "Anvil traps x3"}'}

execute as @s[tag=defense, nbt=!{Inventory:[{components:{"minecraft:custom_data":{tags:["shop", "item"]}}, Slot:22b}]}] run \
    function ctf:match/freeze/shop/kits/custom/web_trap {slot: 22, cost: 1000, item_name: '{"text": "Web trap"}'}

execute as @s[tag=defense, nbt=!{Inventory:[{components:{"minecraft:custom_data":{tags:["shop", "item"]}}, Slot:24b}]}] run \
    function ctf:match/freeze/shop/kits/custom/levitation_trap {slot: 24, cost: 500, item_name: '{"text": "Levitation trap"}'}

execute as @s[tag=defense, nbt=!{Inventory:[{components:{"minecraft:custom_data":{tags:["shop", "item"]}}, Slot:26b}]}] run \
    function ctf:match/freeze/shop/kits/custom/wither_trap {slot: 26, cost: 500, item_name: '{"text": "Wither trap"}'}


# ATTACK

execute as @s[tag=attack, nbt=!{Inventory:[{components:{"minecraft:custom_data":{tags:["shop", "item"]}}, Slot:18b}]}] run \
    function ctf:match/freeze/shop/kits/custom/enemies_detector {slot: 18, cost: 500, item_name: '{"text": "Enemies detector (within 19 blocks)"}'}
