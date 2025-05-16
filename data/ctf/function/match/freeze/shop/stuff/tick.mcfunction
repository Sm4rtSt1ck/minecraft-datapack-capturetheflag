execute as @s[nbt=!{Inventory:[{components:{"minecraft:custom_data":{tags:["shop", "item"]}}, Slot:18b}]}] run \
    function ctf:match/freeze/shop/click_item {item: wind_charge, slot: 18, cost: 500, tag: "", item_name: '{"text": "Wind charge"}', amount: 1, nbt: ''}

execute as @s[nbt=!{Inventory:[{components:{"minecraft:custom_data":{tags:["shop", "item"]}}, Slot:20b}]}] run \
    function ctf:match/freeze/shop/click_item {item: potion, slot: 20, cost: 500, tag: "", item_name: '{"text": "Potion on regeneration"}', amount: 1, nbt: 'potion_contents={custom_color:16711680,custom_effects:[{id:"minecraft:regeneration",amplifier:1,duration:200,show_particles:1b}]}'}

execute as @s[nbt=!{Inventory:[{components:{"minecraft:custom_data":{tags:["shop", "item"]}}, Slot:22b}]}] run \
    function ctf:match/freeze/shop/click_item {item: totem_of_undying, slot: 22, cost: 3000, tag: "", item_name: '{"text": "Totem of undying (regen. 3.5 hearts)"}', amount: 1, nbt: ''}

execute as @s[nbt=!{Inventory:[{components:{"minecraft:custom_data":{tags:["shop", "item"]}}, Slot:24b}]}] run \
    function ctf:match/freeze/shop/click_item {item: leather_boots, slot: 24, cost: 1000, tag: "", item_name: '{"text": "Less fall damage"}', amount: 1, nbt: 'enchantments={levels:{feather_falling:3}}'}
