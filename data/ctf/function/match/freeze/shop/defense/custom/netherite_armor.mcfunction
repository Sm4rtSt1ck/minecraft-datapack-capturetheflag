# $execute if score @s[tag=!just_clicked_shop_menu] money matches $(cost).. run item replace entity @s armor.head with minecraft:netherite_helmet
# $execute if score @s[tag=!just_clicked_shop_menu] money matches $(cost).. run item replace entity @s armor.chest with minecraft:netherite_chestplate
# $execute if score @s[tag=!just_clicked_shop_menu] money matches $(cost).. run item replace entity @s armor.legs with minecraft:netherite_leggings
# $execute if score @s[tag=!just_clicked_shop_menu] money matches $(cost).. run item replace entity @s armor.feet with minecraft:netherite_boots

$execute if score @s[tag=!just_clicked_shop_menu] money matches $(cost).. run function ctf:combine_commands {\
    command_1: 'function ctf:combine_commands {\
        command_1: "item replace entity @s armor.head with minecraft:netherite_helmet",\
        command_2: "item replace entity @s armor.chest with minecraft:netherite_chestplate"\
    }',\
    command_2: 'function ctf:combine_commands {\
        command_1: "item replace entity @s armor.legs with minecraft:netherite_leggings",\
        command_2: "item replace entity @s armor.feet with minecraft:netherite_boots"\
    }'\
}

$function ctf:match/freeze/shop/templates/show_item {item: netherite_chestplate, slot: $(slot), cost: $(cost), tag: "", item_name: '$(item_name)', nbt: ''}
$function ctf:match/freeze/shop/templates/buy_item {item: air, nbt: '', cost: $(cost), amount: 1, item_name: 'none', tag: ""}
