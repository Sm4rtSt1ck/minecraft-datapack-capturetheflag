$execute if score @s[tag=!just_clicked_shop_menu] money matches $(cost).. run item replace entity @s armor.feet with minecraft:leather_boots[enchantments={levels:{feather_falling:3}}, custom_name='"Less fall damage"']

$function ctf:match/freeze/shop/templates/show_item {item: leather_boots, slot: $(slot), cost: $(cost), tag: "", item_name: '$(item_name)', nbt: 'enchantments={levels:{feather_falling:3}}'}
$function ctf:match/freeze/shop/templates/buy_item {item: air, nbt: '', cost: $(cost), amount: 1, item_name: 'none', tag: ""}