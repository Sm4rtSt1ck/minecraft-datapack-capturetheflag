$execute as @s[nbt=!{Inventory:[{components:{"minecraft:custom_data":{tags:["$(category)"]}}}]}] if score @s money matches $(cost).. run \
    function ctf:match/freeze/shop/templates/buy_item {\
        item: arrow, \
        nbt: '', \
        cost: 0, \
        amount: 30, \
        item_name: 'Arrow',\
        tag: ''\
    }

$function ctf:match/freeze/shop/templates/click_item_category {\
    item: bow, \
    slot: $(slot), \
    cost: $(cost), \
    tag: '3', \
    item_name: '$(item_name)', \
    amount: 1, \
    nbt: 'enchantments={levels: {piercing: 4, power: 1, punch: 2}, show_in_tooltip: false}', \
    category: '$(category)'\
}