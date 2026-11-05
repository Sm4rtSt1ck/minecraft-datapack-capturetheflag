# Removes the unbreakable blocks of the area (admin:build/solid/fill): their barriers become air, their
# displays are killed. Other blocks stay.
#   /function admin:build/solid/remove {p:[x1, y1, z1, x2, y2, z2]}   (or p:[x, y, z])
# Only in the lobby
execute unless score game state = lobby state run return run function admin:build/internal/wrong_phase

$data modify storage admin:build a set value {p: $(p)}
scoreboard players set #mode solid.tmp 0
function admin:build/solid/internal/run
