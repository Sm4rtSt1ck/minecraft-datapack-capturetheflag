$function ctf:match/freeze/shop/templates/show_item {item: frog_spawn_egg, slot: $(slot), cost: $(cost), tag: "2", item_name: '$(item_name)', nbt: 'item_model=cobweb, entity_data={id:"minecraft:armor_stand", Marker:true, Invisible:true, Tags:["trap", "trap_display", "trap.web"], ArmorItems:[{}, {}, {}, {id:"minecraft:cobweb"}]}'}

$execute if score @s[tag=!just_clicked_shop_menu] money matches $(cost).. if score web_trap bought.item matches 1.. run tellraw @s {"text": "Someone already had a web trap when the round started!", "color": "red"}

$execute if score @s[tag=!just_clicked_shop_menu] money matches $(cost).. if score web_trap bought.item matches 0 run tag @s add buy_web_kit
$execute if score web_trap bought.item matches 0 run function ctf:match/freeze/shop/templates/buy_item {item: frog_spawn_egg, nbt: 'item_model=cobweb, entity_data={id:"minecraft:armor_stand", Marker:true, Invisible:true, Tags:["trap", "trap_display", "trap.web"], ArmorItems:[{}, {}, {}, {id:"minecraft:cobweb"}]}', cost: $(cost), amount: 1, item_name: '$(item_name)'}

execute if entity @s[tag=buy_web_kit] run scoreboard players add web_trap bought.item 1
tag @s remove buy_web_kit
