$execute if score @s[tag=!just_clicked_shop_menu] money matches $(cost).. run give @s $(item)[custom_name='$(item_name)', custom_data={tags:["$(tag)"]}, $(nbt)] $(amount)
$execute if score @s[tag=!just_clicked_shop_menu] money matches $(cost).. run scoreboard players remove @s money $(cost)
