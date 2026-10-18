# Keep costs in sync with click.mcfunction

# DEFENSE
execute if entity @s[tag=defense] run function ctf_shop:ui/product {slot: 18, model: "tnt", cost: 100, name: '{"text": "TNT traps x3"}', extra: ''}
execute if entity @s[tag=defense] run function ctf_shop:ui/product {slot: 20, model: "anvil", cost: 100, name: '{"text": "Anvil traps x3"}', extra: ''}
execute if entity @s[tag=defense] run function ctf_shop:ui/product {slot: 22, model: "cobweb", cost: 50, name: '{"text": "Web trap"}', extra: ''}
execute if entity @s[tag=defense] run function ctf_shop:ui/product {slot: 24, model: "feather", cost: 50, name: '{"text": "Levitation trap"}', extra: ''}
execute if entity @s[tag=defense] run function ctf_shop:ui/product {slot: 26, model: "wither_skeleton_skull", cost: 20, name: '{"text": "Wither trap"}', extra: ''}

# ATTACK
execute if entity @s[tag=attack] run function ctf_shop:ui/product {slot: 18, model: "ender_eye", cost: 100, name: '{"text": "Enemies detector (within 10 blocks)"}', extra: ''}
