# As a lobby player: the bots button in slot 9 (a villager head; glints when the bots are on)
item replace entity @s hotbar.8 with carrot_on_a_stick[\
    item_model="minecraft:player_head",\
    profile={name: "MHF_Villager"},\
    custom_data={tags: ["menu"], action: "bots"},\
    custom_name='{"text": "PLAY AGAINST BOTS", "color": "gold", "bold": true, "italic": false}',\
    lore=['{"text": "All players in one team, bots in the other", "color": "gray", "italic": false}', '{"text": "Their number: the BOTS sign", "color": "gray", "italic": false}']\
]
execute if score Bots settings matches 1 run item modify entity @s hotbar.8 {function: "minecraft:set_components", components: {"minecraft:enchantment_glint_override": true}}
