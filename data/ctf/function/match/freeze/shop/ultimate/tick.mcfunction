execute as @s[nbt=!{Inventory:[{components:{"minecraft:custom_data":{tags:["shop", "item"]}}, Slot:18b}]}] run \
    function ctf:match/freeze/shop/templates/ultimate {item: skeleton_skull, slot: 18, cost: 200, tag: "", item_name: '{"text": "Ghost"}', category: 1}

execute as @s[nbt=!{Inventory:[{components:{"minecraft:custom_data":{tags:["shop", "item"]}}, Slot:20b}]}] run \
    function ctf:match/freeze/shop/templates/ultimate {item: armadillo_scute, slot: 20, cost: 200, tag: "", item_name: '{"text": "Microman"}', category: 2}

execute as @s[nbt=!{Inventory:[{components:{"minecraft:custom_data":{tags:["shop", "item"]}}, Slot:22b}]}] run \
    function ctf:match/freeze/shop/templates/ultimate {item: trident, slot: 22, cost: 200, tag: "", item_name: '{"text": "Piercing killer"}', category: 3}
