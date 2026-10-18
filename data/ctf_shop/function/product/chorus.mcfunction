# Limited: 3 per round (see ctf_shop:limits/check)
execute unless function ctf_shop:limits/chorus run return 0
execute store result score #ok shop.tmp run function ctf_shop:buy/give {item: "chorus_fruit", name: '{"text": "Chorus fruit (do not use during the setup phase)"}', components: 'custom_data={tags:[""]}', count: 1, cost: 50, offhand: 0}
execute if score #ok shop.tmp matches 1 run scoreboard players add @s shop.lim.chorus 1
return run scoreboard players get #ok shop.tmp
