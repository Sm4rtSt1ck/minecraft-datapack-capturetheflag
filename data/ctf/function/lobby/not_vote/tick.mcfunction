#########################################
# BUTTONS

# Start vote
execute if score game state = lobby state run function ctf:lobby/button_tick {slot: 4, item_model: "minecraft:nether_star", name: "Start vote", command: "schedule function ctf:lobby/vote/start 5t"}
