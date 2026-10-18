# Keep costs in sync with click.mcfunction
# The selected ultimate glints

execute if score @s ultimate_category matches 1 run function ctf_shop:ui/product {slot: 18, model: "skeleton_skull", cost: 0, name: '{"text": "Ghost"}', extra: 'enchantment_glint_override=true'}
execute unless score @s ultimate_category matches 1 run function ctf_shop:ui/product {slot: 18, model: "skeleton_skull", cost: 0, name: '{"text": "Ghost"}', extra: ''}

execute if score @s ultimate_category matches 2 run function ctf_shop:ui/product {slot: 20, model: "armadillo_scute", cost: 0, name: '{"text": "Microman"}', extra: 'enchantment_glint_override=true'}
execute unless score @s ultimate_category matches 2 run function ctf_shop:ui/product {slot: 20, model: "armadillo_scute", cost: 0, name: '{"text": "Microman"}', extra: ''}

execute if score @s ultimate_category matches 3 run function ctf_shop:ui/product {slot: 22, model: "trident", cost: 0, name: '{"text": "Piercing killer"}', extra: 'enchantment_glint_override=true'}
execute unless score @s ultimate_category matches 3 run function ctf_shop:ui/product {slot: 22, model: "trident", cost: 0, name: '{"text": "Piercing killer"}', extra: ''}

execute if score @s ultimate_category matches 4 run function ctf_shop:ui/product {slot: 24, model: "tnt", cost: 0, name: '{"text": "Suicide bomber"}', extra: 'enchantment_glint_override=true'}
execute unless score @s ultimate_category matches 4 run function ctf_shop:ui/product {slot: 24, model: "tnt", cost: 0, name: '{"text": "Suicide bomber"}', extra: ''}

execute if score @s ultimate_category matches 5 run function ctf_shop:ui/product {slot: 26, model: "dragon_head", cost: 0, name: '{"text": "Foot eater"}', extra: 'enchantment_glint_override=true'}
execute unless score @s ultimate_category matches 5 run function ctf_shop:ui/product {slot: 26, model: "dragon_head", cost: 0, name: '{"text": "Foot eater"}', extra: ''}
