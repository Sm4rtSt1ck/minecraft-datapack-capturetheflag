$execute if score @s[tag=!just_clicked_shop_menu] money matches $(cost).. unless score @s ultimate_category matches $(category) run function ctf:combine_commands {\
    command_1: "scoreboard players set @s ultimate_category $(category)",\
    command_2: "scoreboard players remove @s money $(cost)"\
}

$function ctf:match/freeze/shop/templates/show_item {item: $(item), slot: $(slot), cost: $(cost), tag: "", item_name: '$(item_name)', nbt: ''}
