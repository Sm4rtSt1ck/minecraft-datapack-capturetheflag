execute as @s[nbt=!{Inventory:[{components:{"minecraft:custom_data":{tags:["shop", "item"]}}, Slot:18b}]}] run \
    function ctf:match/freeze/shop/templates/click_item_category {item: iron_sword, slot: 18, cost: 144, tag: "", item_name: '{"text": "Iron sword"}', amount: 1, nbt: '', category: "main weapon"}

execute as @s[nbt=!{Inventory:[{components:{"minecraft:custom_data":{tags:["shop", "item"]}}, Slot:20b}]}] run \
    function ctf:match/freeze/shop/templates/click_item_category {item: diamond_sword, slot: 20, cost: 216, tag: "", item_name: '{"text": "Diamond sword"}', amount: 1, nbt: '', category: "main weapon"}

execute as @s[nbt=!{Inventory:[{components:{"minecraft:custom_data":{tags:["shop", "item"]}}, Slot:22b}]}] run \
    function ctf:match/freeze/shop/templates/click_item_category {item: netherite_sword, slot: 22, cost: 288, tag: "", item_name: '{"text": "Netherite sword"}', amount: 1, nbt: '', category: "main weapon"}

execute as @s[nbt=!{Inventory:[{components:{"minecraft:custom_data":{tags:["shop", "item"]}}, Slot:24b}]}] run \
    function ctf:match/freeze/shop/templates/click_item_category {item: mace, slot: 24, cost: 402, tag: "", item_name: '{"text": "Mace"}', amount: 1, nbt: 'enchantments={levels:{wind_burst:1}}', category: "main weapon"}

execute as @s[nbt=!{Inventory:[{components:{"minecraft:custom_data":{tags:["shop", "item"]}}, Slot:26b}]}] run \
    function ctf:match/freeze/shop/templates/click_item_category {item: bow, slot: 26, cost: 250, tag: "", item_name: '{"text": "Bow"}', amount: 1, nbt: '', category: "secondary weapon"}

execute as @s[nbt=!{Inventory:[{components:{"minecraft:custom_data":{tags:["shop", "item"]}}, Slot:27b}]}] run \
    function ctf:match/freeze/shop/weapon/custom/buy_crossbow {slot: 27, cost: 350, item_name: '{"text": "Crossbow & fireworks"}', nbt: '', category: "secondary weapon"}

execute as @s[nbt=!{Inventory:[{components:{"minecraft:custom_data":{tags:["shop", "item"]}}, Slot:29b}]}] run \
    function ctf:match/freeze/shop/templates/click_item {item: arrow, slot: 29, cost: 37, tag: "0", item_name: '{"text": "Arrows x10"}', amount: 10, nbt: ''}

execute as @s[nbt=!{Inventory:[{components:{"minecraft:custom_data":{tags:["shop", "item"]}}, Slot:31b}]}] run \
    function ctf:match/freeze/shop/templates/click_item {item: 'arrow', nbt: 'potion_contents={custom_color:39936,custom_effects:[{id:"minecraft:wither",amplifier:10,duration:2}]}', slot: 31, cost: 89, tag: "1", item_name: '{"text": "Poison arrows x10"}', amount: 10}

execute as @s[tag=attack, nbt=!{Inventory:[{components:{"minecraft:custom_data":{tags:["shop", "item"]}}, Slot:33b}]}] run \
    function ctf:match/freeze/shop/templates/click_item {\
        item: 'firework_rocket', \
        nbt: 'fireworks={explosions:[\
            {shape:"small_ball",colors:[I;16714250],fade_colors:[I;16711850]},\
            {shape:"small_ball",colors:[I;16714250],fade_colors:[I;16711850]},\
            {shape:"small_ball",colors:[I;16714250],fade_colors:[I;16711850]},\
            {shape:"small_ball",colors:[I;16714250],fade_colors:[I;16711850]},\
            {shape:"small_ball",colors:[I;16714250],fade_colors:[I;16711850]},\
            {shape:"small_ball",colors:[I;16714250],fade_colors:[I;16711850]},\
            {shape:"small_ball",colors:[I;16714250],fade_colors:[I;16711850]}\
        ]}', \
        slot: 33, \
        cost: 200, \
        tag: "", \
        item_name: '{"text": "Firework"}', \
        amount: 5\
    }

execute as @s[tag=defense, nbt=!{Inventory:[{components:{"minecraft:custom_data":{tags:["shop", "item"]}}, Slot:33b}]}] run \
    function ctf:match/freeze/shop/templates/click_item {\
        item: 'firework_rocket', \
        nbt: 'fireworks={explosions:[\
            {shape:"small_ball",colors:[I;1114367],fade_colors:[I;48127]},\
            {shape:"small_ball",colors:[I;1114367],fade_colors:[I;48127]},\
            {shape:"small_ball",colors:[I;1114367],fade_colors:[I;48127]},\
            {shape:"small_ball",colors:[I;1114367],fade_colors:[I;48127]},\
            {shape:"small_ball",colors:[I;1114367],fade_colors:[I;48127]},\
            {shape:"small_ball",colors:[I;1114367],fade_colors:[I;48127]},\
            {shape:"small_ball",colors:[I;1114367],fade_colors:[I;48127]}\
        ]}', \
        slot: 33, \
        cost: 200, \
        tag: "", \
        item_name: '{"text": "Firework"}', \
        amount: 5\
    }

execute as @s[nbt=!{Inventory:[{components:{"minecraft:custom_data":{tags:["shop", "item"]}}, Slot:35b}]}] run \
    function ctf:match/freeze/shop/templates/click_item {item: 'lingering_potion', nbt: 'max_stack_size=64', slot: 35, cost: 200, tag: "he_grenade", item_name: '{"text": "Grenade"}', amount: 1}
