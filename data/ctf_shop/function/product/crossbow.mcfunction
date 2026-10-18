# Crossbow + 5 fireworks in the team color (into the offhand if it's empty). cost
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
execute unless score #ok shop.tmp matches 1 run return 0

execute if entity @s[tag=attack] run function ctf_shop:product/fireworks {colors: "16714250", fade: "16711850"}
execute if entity @s[tag=defense] run function ctf_shop:product/fireworks {colors: "1114367", fade: "48127"}
