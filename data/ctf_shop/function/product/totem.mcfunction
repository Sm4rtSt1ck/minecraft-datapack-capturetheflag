# Limited: 1 per round (see ctf_shop:limits/check)
execute unless function ctf_shop:limits/totem run return 0
execute store result score #ok shop.tmp run function ctf_shop:buy/group {item: "totem_of_undying", name: '{"text": "Totem of undying (regen. 3.5-4 hearts)"}', components: '', count: 1, cost: 300, group: "shield or totem", bind: "0b", offhand: 1, free: 1}
execute if score #ok shop.tmp matches 1 run scoreboard players add @s shop.lim.totem 1
return run scoreboard players get #ok shop.tmp
