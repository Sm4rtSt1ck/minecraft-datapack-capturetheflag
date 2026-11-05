# MAP BUILDING (in the template, by hand): unbreakable blocks that look like normal ones. Every block
# of the area becomes a barrier with a block_display of the block b in it. The map clone copies them
# into the arena (ctf_maps:map/<map>/clone). The same with markers: admin:build/get_tools.
#   /function admin:build/solid/fill {p:[x1, y1, z1, x2, y2, z2], b:"stone"}
# p of 3 numbers is one block (admin:build/solid/set). A block with states: admin:build/solid/fill_state.
# Removing: admin:build/solid/remove.
# Only in the lobby
execute unless score game state = lobby state run return run function admin:build/internal/wrong_phase

$function admin:build/solid/fill_state {p: $(p), b: "$(b)", s: {}}
