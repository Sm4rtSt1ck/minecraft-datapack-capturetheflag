# Limited: 1 per round (see ctf_shop:limits/check)
execute unless function ctf_shop:limits/shield run return 0
scoreboard players set #ok shop.tmp 0
execute if entity @s[tag=attack] store result score #ok shop.tmp run function ctf_shop:buy/group {item: "shield", name: '{"text": "Shield"}', count: 1, cost: 90, group: "shield or totem", wpn: "", bind: "0b", offhand: 1, free: 1, components: 'damage=316, base_color="orange", banner_patterns=[\
    {"pattern":"gradient","color":"black"},\
    {"pattern":"skull","color":"black"},\
    {"pattern":"gradient_up","color":"red"},\
    {"pattern":"triangles_bottom","color":"orange"},\
    {"pattern":"triangles_bottom","color":"red"}\
]'}
execute if entity @s[tag=defense] store result score #ok shop.tmp run function ctf_shop:buy/group {item: "shield", name: '{"text": "Shield"}', count: 1, cost: 90, group: "shield or totem", wpn: "", bind: "0b", offhand: 1, free: 1, components: 'damage=316, base_color="blue", banner_patterns=[\
    {"pattern":"gradient_up","color":"light_blue"},\
    {"pattern":"flower","color":"light_blue"}\
]'}
execute if score #ok shop.tmp matches 1 run scoreboard players add @s shop.lim.shield 1
return run scoreboard players get #ok shop.tmp
