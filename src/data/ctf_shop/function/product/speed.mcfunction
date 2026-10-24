# Limited per round (ctf_shop:limits/speed). The cost: registry shop
from registry:shop import product

execute unless function ctf_shop:limits/speed run return 0
execute store result score #ok shop.tmp run function ctf_shop:buy/give {item: "potion", name: '{"text": "Potion on speed"}', components: 'custom_data={tags:[""], lim:"speed"}, potion_contents={custom_color:26711680,custom_effects:[{id:"minecraft:speed",amplifier:4,duration:160,show_particles:1b}]}', count: 1, cost: (product("speed")["cost"]), offhand: 0}
execute if score #ok shop.tmp matches 1 run scoreboard players add @s shop.lim.speed 1
return run scoreboard players get #ok shop.tmp
