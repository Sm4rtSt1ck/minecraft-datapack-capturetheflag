# Limited: 1 per round (see ctf_shop:limits/check)
execute unless function ctf_shop:limits/he run return 0
execute store result score #ok shop.tmp run function ctf_shop:buy/group {item: "lingering_potion", name: '{"text": "Grenade"}', components: 'max_stack_size=64', count: 1, cost: 60, group: "he_grenade", wpn: "", bind: "1b", offhand: 0, free: 0}
execute if score #ok shop.tmp matches 1 run scoreboard players add @s shop.lim.he 1
return run scoreboard players get #ok shop.tmp
