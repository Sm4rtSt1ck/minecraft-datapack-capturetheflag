# THIS FUNCTION RESTRICTS THE PURCHASE OF MULTIPLE WEAPONS FROM THE SAME CATEGORY

$function ctf:match/freeze/shop/templates/show_item {item: '$(item)', tag: '$(tag)', slot: $(slot), item_name: '$(item_name)', cost: $(cost), nbt: '$(nbt)'}

$clear @s[tag=!just_clicked_shop_menu, scores={money=$(cost)..}] golden_sword[custom_data={tags:["$(category)"]}]
$tellraw @s[tag=!just_clicked_shop_menu, scores={money=$(cost)..}, nbt={Inventory:[{components:{"minecraft:custom_data":{tags:["$(category)"]}}}]}] {"text": "You can have only one item from this category ($(category))! You have to drop another.", "color": "red"}
$execute as @s[nbt=!{Inventory:[{components:{"minecraft:custom_data":{tags:["$(category)"]}}}]}] run function ctf:match/freeze/shop/templates/buy_item {item: '$(item)', cost: $(cost), amount: $(amount), item_name: '$(item_name)', nbt: 'custom_data={tags:["$(category)"]}'}
