# Limited: 1 per round (see ctf_shop:limits/check)
execute unless function ctf_shop:limits/regen run return 0
execute store result score #ok shop.tmp run function ctf_shop:buy/give {item: "potion", name: '{"text": "Potion on regeneration"}', components: 'custom_data={tags:[""], lim:"regen"}, potion_contents={custom_color:16711680,custom_effects:[{id:"minecraft:regeneration",amplifier:1,duration:200,show_particles:1b}]}', count: 1, cost: 120, offhand: 0}
execute if score #ok shop.tmp matches 1 run scoreboard players add @s shop.lim.regen 1
return run scoreboard players get #ok shop.tmp
