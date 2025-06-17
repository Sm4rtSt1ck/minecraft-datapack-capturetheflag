$scoreboard players set @s shop_category $(shop_category)

$clear @s $(category_item)[custom_data={tags:["shop", "menu"]}]
$item replace entity @s container.$(category_slot) with $(category_item)[\
    custom_name='{"text": "$(category_name)", "color": "$(category_color)", "bold": true, "italic": false}',\
    custom_data={tags: ["shop", "menu"]},\
    enchantments={levels: {unbreaking: 1}, show_in_tooltip: false},\
    attribute_modifiers={modifiers: []},\
    fireworks={flight_duration: 0}\
]
execute positioned as @s run playsound minecraft:ui.button.click master @s ~ ~ ~ 0.2

tag @s add just_clicked_shop_menu

clear @s *[custom_data={tags:["shop", "item", ""]}]
clear @s *[custom_data={tags:["shop", "item", "0"]}]
clear @s *[custom_data={tags:["shop", "item", "1"]}]
clear @s *[custom_data={tags:["shop", "item", "2"]}]
clear @s *[custom_data={tags:["shop", "item", "3"]}]
clear @s *[custom_data={tags:["shop", "item", "4"]}]
clear @s *[custom_data={tags:["shop", "item", "5"]}]
clear @s *[custom_data={tags:["shop", "item", "he_grenade"]}]
clear @s *[custom_data={tags:["shop", "item", "smoke_grenade"]}]
