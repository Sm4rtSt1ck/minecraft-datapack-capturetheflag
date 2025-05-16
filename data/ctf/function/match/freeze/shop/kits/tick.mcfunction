execute as @s[nbt=!{Inventory:[{components:{"minecraft:custom_data":{tags:["shop", "item"]}}, Slot:18b}]}] run \
    function ctf:match/freeze/shop/kits/custom/tnt_kit {slot: 18, cost: 1000, item_name: '{"text": "TNT traps x3"}'}
