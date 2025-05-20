$function ctf:match/freeze/shop/templates/show_item {\
    item: frog_spawn_egg, \
    slot: $(slot), \
    cost: $(cost), \
    tag: "4", \
    item_name: '$(item_name)', \
    nbt: '\
        item_model=wither_skeleton_skull, \
        entity_data={\
            id:"minecraft:armor_stand", \
            Marker:true, \
            Invisible:true, \
            Tags:["trap", "trap_display", "trap.wither"],\
            ArmorItems:[{}, {}, {}, {id:"minecraft:wither_skeleton_skull"}\
        ]\
    }'\
}

$execute if score @s[tag=!just_clicked_shop_menu] money matches $(cost).. if score wither_trap bought.item matches 1.. run tellraw @s {"text": "Someone already had a wither trap when the round started!", "color": "red"}

$execute if score @s[tag=!just_clicked_shop_menu] money matches $(cost).. if score wither_trap bought.item matches 0 run tag @s add buy_wither_trap
$execute if score wither_trap bought.item matches 0 run function ctf:match/freeze/shop/templates/buy_item {\
    item: frog_spawn_egg, \
    nbt: '\
        item_model=wither_skeleton_skull, \
        entity_data={\
            id:"minecraft:armor_stand", \
            Marker:true, \
            Invisible:true, \
            Tags:["trap", "trap_display", "trap.wither"],\
            ArmorItems:[{}, {}, {}, {id:"minecraft:wither_skeleton_skull"}\
        ]\
    }', \
    cost: $(cost), \
    amount: 1, \
    item_name: '$(item_name)'\
}

execute if entity @s[tag=buy_wither_trap] run scoreboard players add wither_trap bought.item 1
tag @s remove buy_wither_trap
