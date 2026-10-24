# Every chorus fruit that isn't the item of the current phase (picked up, bought earlier,
# edible during freeze, inedible during the round) is replaced by the same number of the right ones
execute if score game state = freeze state run data modify storage ctf_inv:tmp chorus.id set value "chorus_locked"
execute unless score game state = freeze state run data modify storage ctf_inv:tmp chorus.id set value "chorus"
function ctf_inv:limits/normalize_chorus_run with storage ctf_inv:tmp chorus
