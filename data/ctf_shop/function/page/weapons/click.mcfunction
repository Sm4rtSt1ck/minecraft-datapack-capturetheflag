# Keep costs in sync with render.mcfunction

# Main weapon
execute if score #slot shop.tmp matches 18 run return run function ctf_shop:buy/group {item: "iron_sword", wpn: "iron_sword", name: '{"text": "Iron sword", "color": "white", "italic": false}', components: 'enchantments={fire_aspect:1b}', count: 1, cost: 130, group: "main weapon", bind: "1b", offhand: 0, free: 0}
execute if score #slot shop.tmp matches 20 run return run function ctf_shop:buy/group {item: "diamond_sword", wpn: "diamond_sword", name: '{"text": "Diamond sword", "color": "aqua", "italic": false}', components: '', count: 1, cost: 200, group: "main weapon", bind: "1b", offhand: 0, free: 0}
execute if score #slot shop.tmp matches 22 run return run function ctf_shop:buy/group {item: "netherite_sword", wpn: "netherite_sword", name: '{"text": "Netherite sword", "color": "light_purple", "italic": false}', components: '', count: 1, cost: 270, group: "main weapon", bind: "1b", offhand: 0, free: 0}
execute if score #slot shop.tmp matches 24 run return run function ctf_shop:buy/group {item: "mace", wpn: "mace", name: '{"text": "Mace", "color": "gold", "italic": false}', components: 'enchantments={levels:{wind_burst:1}}', count: 1, cost: 300, group: "main weapon", bind: "1b", offhand: 0, free: 0}

# Secondary weapon
execute if score #slot shop.tmp matches 26 run return run function ctf_shop:product/crossbow {cost: 420}
execute if score #slot shop.tmp matches 27 run return run function ctf_shop:product/bow {wpn: "bow", cost: 180, name: '{"text": "Bow", "color": "white", "italic": false}', enchantments: 'piercing: 4, power: 1'}
execute if score #slot shop.tmp matches 29 run return run function ctf_shop:product/bow {wpn: "fire_bow", cost: 230, name: '{"text": "Fire bow", "color": "aqua", "italic": false}', enchantments: 'piercing: 4, power: 1, flame: 1'}
execute if score #slot shop.tmp matches 31 run return run function ctf_shop:product/bow {wpn: "punch_bow", cost: 220, name: '{"text": "Punch bow", "color": "light_purple", "italic": false}', enchantments: 'piercing: 4, power: 1, punch: 2'}
execute if score #slot shop.tmp matches 33 run return run function ctf_shop:product/bow {wpn: "power_bow", cost: 400, name: '{"text": "Power bow", "color": "gold", "italic": false}', enchantments: 'piercing: 4, power: 5'}
