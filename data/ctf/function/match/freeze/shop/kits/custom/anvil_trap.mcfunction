$function ctf:match/freeze/shop/templates/show_item {\
    item: frog_spawn_egg, \
    slot: $(slot), \
    cost: $(cost), \
    tag: "1", \
    item_name: '$(item_name)', \
    nbt: '\
        item_model=anvil, \
        entity_data={\
            id:"minecraft:armor_stand", \
            Marker:true, \
            Invisible:true, \
            Tags:["trap", "trap_display", "trap.anvil"], \
            ArmorItems:[{}, {}, {}, {id:"minecraft:anvil"}\
        ]\
    }'\
}

$execute if score @s[tag=!just_clicked_shop_menu] money matches $(cost).. if score anvil_trap bought.item matches 1.. run tellraw @s {"text": "Someone already had an anvil trap when the round started!", "color": "red"}

$execute if score @s[tag=!just_clicked_shop_menu] money matches $(cost).. if score anvil_trap bought.item matches 0 run tag @s add buy_anvil_kit
$execute if score anvil_trap bought.item matches 0 run function ctf:match/freeze/shop/templates/buy_item {\
    item: frog_spawn_egg, \
    nbt: '\
        item_model=anvil, \
        entity_data={\
            id:"minecraft:armor_stand", \
            Marker:true, \
            Invisible:true, \
            Tags:["trap", "trap_display", "trap.anvil"], \
            ArmorItems:[{}, {}, {}, {id:"minecraft:anvil"}\
        ]\
    }', \
    cost: $(cost), \
    amount: 3, \
    item_name: '$(item_name)',\
    tag: ""\
}

execute if entity @s[tag=buy_anvil_kit] run scoreboard players add anvil_trap bought.item 1
tag @s remove buy_anvil_kit
