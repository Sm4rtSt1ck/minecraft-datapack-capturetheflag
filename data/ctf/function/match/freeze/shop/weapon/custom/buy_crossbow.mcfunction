$execute as @s[tag=attack, nbt=!{Inventory:[{components:{"minecraft:custom_data":{tags:["$(category)"]}}}]}] if score @s money matches $(cost).. run \
    function ctf:match/freeze/shop/templates/buy_item {\
        item: firework_rocket, \
        nbt: 'fireworks={explosions:[\
            {shape:"small_ball",colors:[I;16714250],fade_colors:[I;16711850]},\
            {shape:"small_ball",colors:[I;16714250],fade_colors:[I;16711850]},\
            {shape:"small_ball",colors:[I;16714250],fade_colors:[I;16711850]},\
            {shape:"small_ball",colors:[I;16714250],fade_colors:[I;16711850]},\
            {shape:"small_ball",colors:[I;16714250],fade_colors:[I;16711850]},\
            {shape:"small_ball",colors:[I;16714250],fade_colors:[I;16711850]},\
            {shape:"small_ball",colors:[I;16714250],fade_colors:[I;16711850]}\
        ]}', \
        cost: 0, \
        amount: 5, \
        item_name: 'Firework',\
        tag: ''\
    }

$execute as @s[tag=defense, nbt=!{Inventory:[{components:{"minecraft:custom_data":{tags:["$(category)"]}}}]}] if score @s money matches $(cost).. run \
    function ctf:match/freeze/shop/templates/buy_item {\
        item: firework_rocket, \
        nbt: 'fireworks={explosions:[\
            {shape:"small_ball",colors:[I;1114367],fade_colors:[I;48127]},\
            {shape:"small_ball",colors:[I;1114367],fade_colors:[I;48127]},\
            {shape:"small_ball",colors:[I;1114367],fade_colors:[I;48127]},\
            {shape:"small_ball",colors:[I;1114367],fade_colors:[I;48127]},\
            {shape:"small_ball",colors:[I;1114367],fade_colors:[I;48127]},\
            {shape:"small_ball",colors:[I;1114367],fade_colors:[I;48127]},\
            {shape:"small_ball",colors:[I;1114367],fade_colors:[I;48127]}\
        ]}', \
        cost: 0, \
        amount: 5, \
        item_name: 'Firework',\
        tag: ''\
    }

$function ctf:match/freeze/shop/templates/click_item_category {\
    item: crossbow, \
    slot: $(slot), \
    cost: $(cost), \
    tag: "", \
    item_name: $(item_name), \
    amount: 1, \
    nbt: 'enchantments={levels:{multishot:1}}', \
    category: "$(category)"\
}
