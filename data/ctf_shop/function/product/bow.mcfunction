# Bow + 30 arrows (arrows go to slot 7). cost, name, enchantments
$execute store result score #ok shop.tmp run function ctf_shop:buy/group {\
    item: "bow", \
    name: '$(name)', \
    components: 'enchantments={levels: {$(enchantments)}, show_in_tooltip: false}', \
    count: 1, \
    cost: $(cost), \
    group: "secondary weapon", \
    bind: "1b", \
    offhand: 0, \
    free: 0\
}
execute if score #ok shop.tmp matches 1 run give @s arrow 30
