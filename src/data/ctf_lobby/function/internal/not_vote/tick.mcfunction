#########################################
# BUTTONS

# Start voting
execute if score game state = lobby state run function ctf_lobby:internal/button_tick {\
    slot: 4, \
    item_model: "minecraft:nether_star", \
    name: '{\
        "shadow_color": -5745664,\
        "color": "gold",\
        "italic": false,\
        "bold": true,\
        "text" :"START VOTING"\
    }', \
    command: "schedule function ctf_lobby:internal/vote/start 5t"\
}
