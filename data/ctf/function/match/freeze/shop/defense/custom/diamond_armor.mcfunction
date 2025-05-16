$execute if score @s[tag=!just_clicked_shop_menu] money matches $(cost).. run item replace entity @s armor.head with minecraft:diamond_helmet
$execute if score @s[tag=!just_clicked_shop_menu] money matches $(cost).. run item replace entity @s armor.chest with minecraft:diamond_chestplate
$execute if score @s[tag=!just_clicked_shop_menu] money matches $(cost).. run item replace entity @s armor.legs with minecraft:diamond_leggings
$execute if score @s[tag=!just_clicked_shop_menu] money matches $(cost).. run item replace entity @s armor.feet with minecraft:diamond_boots
$function ctf:match/freeze/shop/show_item {item: diamond_chestplate, slot: $(slot), cost: $(cost), tag: "", item_name: '$(item_name)', nbt: ''}
$function ctf:match/freeze/shop/buy_item {item: air, nbt: '', cost: $(cost), amount: 1, item_name: ''}
