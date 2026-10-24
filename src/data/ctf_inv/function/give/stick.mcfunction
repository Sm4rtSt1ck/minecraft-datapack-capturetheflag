clear @s stick
function ctf_inv:api/stash {slot: "hotbar.7"}
item replace entity @s hotbar.7 with minecraft:stick[\
    can_break={predicates:[{blocks:["magenta_banner"]}], show_in_tooltip: false},\
    custom_name='{"color":"#31fff5","text":"FLAG BREAKER", "italic": false}',\
    enchantments={knockback:3b}\
]
execute if entity @e[type=item, tag=ctf.buf, limit=1] run function ctf_inv:api/place
