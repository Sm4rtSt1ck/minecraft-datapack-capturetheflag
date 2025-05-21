$function ctf:match/freeze/shop/templates/show_item {\
    item: carrot_on_a_stick, \
    slot: $(slot), \
    cost: $(cost), \
    tag: "0", \
    item_name: '$(item_name)', \
    nbt: '\
        item_model=ender_eye\
    '\
}

$execute if score @s[tag=!just_clicked_shop_menu] money matches $(cost).. if score detector_trap bought.item matches 1.. run tellraw @s {"text": "Someone already had an detector trap when the round started!", "color": "red"}

$execute if score @s[tag=!just_clicked_shop_menu] money matches $(cost).. if score detector_trap bought.item matches 0 run tag @s add buy_detector_kit
$execute if score detector_trap bought.item matches 0 run function ctf:match/freeze/shop/templates/buy_item {\
    item: carrot_on_a_stick, \
    nbt: '\
        item_model=ender_eye,\
        custom_data={tags: ["trap", "detector"]}\
    ', \
    cost: $(cost), \
    amount: 1, \
    item_name: '$(item_name)'\
}

execute if entity @s[tag=buy_detector_kit] run scoreboard players add detector_trap bought.item 1
tag @s remove buy_detector_kit
