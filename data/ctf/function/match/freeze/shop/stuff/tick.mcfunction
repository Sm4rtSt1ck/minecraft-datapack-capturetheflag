execute as @s[nbt=!{Inventory:[{components:{"minecraft:custom_data":{tags:["shop", "item"]}}, Slot:18b}]}] run \
    function ctf:match/freeze/shop/templates/click_item {item: wind_charge, slot: 18, cost: 250, tag: "", item_name: '{"text": "Wind charge 5x"}', amount: 5, nbt: ''}

execute as @s[nbt=!{Inventory:[{components:{"minecraft:custom_data":{tags:["shop", "item"]}}, Slot:20b}]}] run \
    function ctf:match/freeze/shop/templates/click_item {item: potion, slot: 20, cost: 111, tag: "", item_name: '{"text": "Potion on regeneration"}', amount: 1, nbt: 'potion_contents={custom_color:16711680,custom_effects:[{id:"minecraft:regeneration",amplifier:1,duration:200,show_particles:1b}]}'}

execute as @s[nbt=!{Inventory:[{components:{"minecraft:custom_data":{tags:["shop", "item"]}}, Slot:22b}]}] run \
    function ctf:match/freeze/shop/templates/click_item {item: leather_boots, slot: 22, cost: 100, tag: "0", item_name: '{"text": "Less fall damage"}', amount: 1, nbt: 'enchantments={levels:{feather_falling:3}}'}

execute as @s[nbt=!{Inventory:[{components:{"minecraft:custom_data":{tags:["shop", "item"]}}, Slot:24b}]}] run \
    function ctf:match/freeze/shop/templates/click_item {item: totem_of_undying, slot: 24, cost: 300, tag: "", item_name: '{"text": "Totem of undying (regen. 3.5 hearts)"}', amount: 1, nbt: ''}

execute as @s[nbt=!{Inventory:[{components:{"minecraft:custom_data":{tags:["shop", "item"]}}, Slot:26b}]}] run \
    function ctf:match/freeze/shop/templates/click_item {item: potion, slot: 26, cost: 250, tag: "1", item_name: '{"text": "Potion on speed"}', amount: 1, nbt: 'potion_contents={custom_color:26711680,custom_effects:[{id:"minecraft:speed",amplifier:4,duration:160,show_particles:1b}]}'}

execute as @s[nbt=!{Inventory:[{components:{"minecraft:custom_data":{tags:["shop", "item"]}}, Slot:27b}]}] run \
    function ctf:match/freeze/shop/templates/click_item {item: chorus_fruit, slot: 27, cost: 50, tag: "", item_name: '{"text": "Chorus fruit (do not use during the setup phase)"}', amount: 1, nbt: ''}
