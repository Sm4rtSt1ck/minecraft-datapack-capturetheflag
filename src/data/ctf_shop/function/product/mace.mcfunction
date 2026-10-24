# Mace (Wind Burst) + 10 wind charges, restored every round (ctf_inv:ammo/fill_wind). cost
$execute store result score #ok shop.tmp run function ctf_shop:buy/group {item: "mace", wpn: "mace", name: '{"text": "Mace", "color": "gold", "italic": false}', components: 'enchantments={levels:{wind_burst:1}}', count: 1, cost: $(cost), group: "main weapon", bind: "1b", offhand: 0, free: 0}
execute if score #ok shop.tmp matches 1 run function ctf_inv:ammo/fill_all
