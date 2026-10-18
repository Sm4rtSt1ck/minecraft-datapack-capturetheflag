$item replace entity @s container.$(slot) with minecraft:paper[\
    item_model="minecraft:$(model)",\
    custom_name='{"text": "$(name)", "color": "$(color)", "bold": true, "italic": false}',\
    enchantment_glint_override=$(glint),\
    max_stack_size=1,\
    custom_data={ctf_ui:{slot:$(slot)}, bind:1b}\
]
