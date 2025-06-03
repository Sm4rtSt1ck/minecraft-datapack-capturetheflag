#########################################
# BUTTONS

# Start vote
function ctf:lobby/button_tick {slot: 0, item_model: "minecraft:nether_star", name: "Start vote", command: "scoreboard players operation game state = vote state"}
