# Shop display item. It's always paper with another model: it can't be worn,
# used, placed, eaten or used as a weapon, so a leaked copy is worthless.
# extra - additional components for the look (glint, potion color, banner...)
$item replace entity @s container.$(slot) with minecraft:paper[\
    item_model="minecraft:$(model)",\
    custom_name='$(name)',\
    lore=['{"text": "$$(cost)", "color": "gold", "italic": false}'],\
    max_stack_size=1,\
    custom_data={ctf_ui:{slot:$(slot)}, bind:1b},\
    $(extra)\
]
