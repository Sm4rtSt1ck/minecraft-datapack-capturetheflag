$clear @s $(item)[custom_data={tags:["shop", "item", "$(tag)"]}]
$item replace entity @s container.$(slot) with $(item)[custom_name='$(item_name)', lore=['{"text": "$$(cost)", "italic": false}'], custom_data={tags:["shop", "item", "$(tag)"]}, $(nbt)]

$execute if score @s[tag=!just_clicked_shop_menu] money matches $(cost).. at @s run playsound minecraft:ui.button.click master @s ~ ~ ~ 0.2
