# Crossbow + its fireworks (offhand if it's empty, see ctf_inv:ammo/fill_all). cost
$execute store result score #ok shop.tmp run function ctf_shop:buy/group {\
    item: "crossbow", \
    name: '{"text": "Crossbow & fireworks"}', \
    components: 'enchantments={levels:{multishot:1}}', \
    count: 1, \
    cost: $(cost), \
    group: "secondary weapon", \
    wpn: "crossbow", \
    bind: "1b", \
    offhand: 0, \
    free: 0\
}
execute if score #ok shop.tmp matches 1 run function ctf_inv:ammo/fill_all
