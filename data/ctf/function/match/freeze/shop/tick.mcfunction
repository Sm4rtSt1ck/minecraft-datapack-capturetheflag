
execute as @a[tag=player] run function ctf:match/freeze/shop/menu
execute as @a[tag=player] run function ctf:match/freeze/shop/fill_empty_slots

# clear @a[tag=just_clicked_shop_menu] *[custom_data={tags:["shop", "item", ""]}]

execute as @a[tag=player, scores={shop_category=1}] run function ctf:match/freeze/shop/weapon/tick
execute as @a[tag=player, scores={shop_category=2}] run function ctf:match/freeze/shop/defense/tick
execute as @a[tag=player, scores={shop_category=3}] run function ctf:match/freeze/shop/stuff/tick
execute as @a[tag=player, scores={shop_category=4}] run function ctf:match/freeze/shop/kits/tick

tag @a[tag=player] remove just_clicked_shop_menu

kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{tags:["shop"]}}}}]

execute as @a[tag=player] run title @s actionbar [\
    {"text":"Press [","color":"#ff9100", "shadow_color": 0, "bold": true},\
    {"keybind": "key.inventory"},\
    {"text": "] to enter the shop. "},\
    {"text":"Money: ","color":"#ff9100", "shadow_color": 0, "bold": true},\
    {"text":"$","color":"#ff5100"},\
    {"score":{"name":"@s","objective":"money"},"color":"#ff5100"}\
]
# execute as @a run title @s actionbar [{"text":"Press [","color":"#ff9100", "shadow_color": 0, "bold": true}, {"keybind": "key.inventory"}, {"text": "] to enter the shop"}]
