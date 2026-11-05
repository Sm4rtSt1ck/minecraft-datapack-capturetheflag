# admin:build/solid/get with the block states s (the display keeps them, whatever the player faces):
#   /function admin:build/solid/get_state {b:"oak_stairs", s:{facing:"east", half:"top"}}
# Only in the lobby
execute unless score game state = lobby state run return run function admin:build/internal/wrong_phase

$give @s barrier[\
    item_model="$(b)",\
    item_name='[{"text": "SOLID ", "color": "gold", "bold": true}, {"translate": "block.minecraft.$(b)", "fallback": "$(b)", "color": "white", "bold": false}]',\
    lore=['{"text": "Places an unbreakable block", "color": "gray", "italic": false}'],\
    custom_data={ctf_solid: {Name: "$(b)", Properties: $(s)}}\
]
