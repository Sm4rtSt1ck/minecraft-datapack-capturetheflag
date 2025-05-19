$function ctf:match/freeze/shop/templates/show_item {item: rabbit_spawn_egg, slot: $(slot), cost: $(cost), tag: "0", item_name: '$(item_name)', nbt: 'item_model=tnt, entity_data={id:"minecraft:armor_stand", Marker:true, Invisible:true, Tags:["trap", "trap_display", "trap.tnt"], ArmorItems:[{}, {}, {}, {id:"minecraft:tnt"}]}'}

$execute if score @s[tag=!just_clicked_shop_menu] money matches $(cost).. if score defense bought.trap.tnt matches 1.. run tellraw @s {"text": "Someone already had a tnt trap when the round started!", "color": "red"}

$execute if score @s[tag=!just_clicked_shop_menu] money matches $(cost).. if score defense bought.trap.tnt matches 0 run tag @s add buy_tnt_kit
$execute if score defense bought.trap.tnt matches 0 run function ctf:match/freeze/shop/templates/buy_item {item: rabbit_spawn_egg, nbt: 'item_model=tnt, entity_data={id:"minecraft:armor_stand", Marker:true, Invisible:true, Tags:["trap", "trap_display", "trap.tnt"], ArmorItems:[{}, {}, {}, {id:"minecraft:tnt"}]}', cost: $(cost), amount: 3, item_name: '$(item_name)'}

execute if entity @s[tag=buy_tnt_kit] run scoreboard players add defense bought.trap.tnt 1
tag @s remove buy_tnt_kit
