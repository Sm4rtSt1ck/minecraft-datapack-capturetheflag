# As a player: the links of the navigation graph found again now (in a match: after moving bot markers in
# the arena; in the lobby: the graph of the template he stands at built again, after editing its markers)
execute if score game state = lobby state run return run function ctf_bots:internal/nav/lobby_build
function ctf_bots:internal/nav/bake_start
