# Keep costs in sync with click.mcfunction

function ctf_shop:ui/product {slot: 18, model: "golden_chestplate", cost: 150, name: '{"text": "Gold armor"}', extra: ''}
function ctf_shop:ui/product {slot: 20, model: "iron_chestplate", cost: 250, name: '{"text": "Iron armor"}', extra: ''}
# function ctf_shop:ui/product {slot: 22, model: "netherite_chestplate", cost: 1500, name: '{"text": "Netherite armor"}', extra: ''}

execute if entity @s[tag=attack] run function ctf_shop:ui/product {slot: 24, model: "shield", cost: 90, name: '{"text": "Shield"}', extra: 'base_color="orange", banner_patterns=[\
    {"pattern":"gradient","color":"black"},\
    {"pattern":"skull","color":"black"},\
    {"pattern":"gradient_up","color":"red"},\
    {"pattern":"triangles_bottom","color":"orange"},\
    {"pattern":"triangles_bottom","color":"red"}\
]'}
execute if entity @s[tag=defense] run function ctf_shop:ui/product {slot: 24, model: "shield", cost: 90, name: '{"text": "Shield"}', extra: 'base_color="blue", banner_patterns=[\
    {"pattern":"gradient_up","color":"light_blue"},\
    {"pattern":"flower","color":"light_blue"}\
]'}
