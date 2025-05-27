# $execute if score @s[tag=!just_clicked_shop_menu] money matches $(cost).. run item replace entity @s armor.head with minecraft:golden_helmet
# $execute if score @s[tag=!just_clicked_shop_menu] money matches $(cost).. run item replace entity @s armor.chest with minecraft:golden_chestplate
# $execute if score @s[tag=!just_clicked_shop_menu] money matches $(cost).. run item replace entity @s armor.legs with minecraft:golden_leggings
# $execute if score @s[tag=!just_clicked_shop_menu] money matches $(cost).. run item replace entity @s armor.feet with minecraft:golden_boots

$execute if score @s[tag=!just_clicked_shop_menu] money matches $(cost).. run function ctf:combine_commands {\
    command_1: 'function ctf:combine_commands {\
        command_1: "item replace entity @s armor.head with minecraft:golden_helmet",\
        command_2: "item replace entity @s armor.chest with minecraft:golden_chestplate"\
    }',\
    command_2: 'function ctf:combine_commands {\
        command_1: "item replace entity @s armor.legs with minecraft:golden_leggings",\
        command_2: "item replace entity @s armor.feet with minecraft:golden_boots[enchantments={feather_falling:1}]"\
    }'\
}

$function ctf:match/freeze/shop/templates/show_item {item: golden_chestplate, slot: $(slot), cost: $(cost), tag: "", item_name: '$(item_name)', nbt: ''}
$function ctf:match/freeze/shop/templates/buy_item {item: air, nbt: '', cost: $(cost), amount: 1, item_name: 'none', tag: ""}
