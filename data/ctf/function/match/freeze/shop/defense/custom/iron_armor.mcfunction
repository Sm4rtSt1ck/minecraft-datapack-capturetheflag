$execute if score @s[tag=!just_clicked_shop_menu] money matches $(cost).. run item replace entity @s armor.head with minecraft:iron_helmet
$execute if score @s[tag=!just_clicked_shop_menu] money matches $(cost).. run item replace entity @s armor.chest with minecraft:iron_chestplate
$execute if score @s[tag=!just_clicked_shop_menu] money matches $(cost).. run item replace entity @s armor.legs with minecraft:iron_leggings
$execute if score @s[tag=!just_clicked_shop_menu] money matches $(cost).. run item replace entity @s armor.feet with minecraft:iron_boots
$function ctf:match/freeze/shop/templates/show_item {item: iron_chestplate, slot: $(slot), cost: $(cost), tag: "", item_name: '$(item_name)', nbt: ''}
$function ctf:match/freeze/shop/templates/buy_item {item: air, nbt: '', cost: $(cost), amount: 1, item_name: ''}
