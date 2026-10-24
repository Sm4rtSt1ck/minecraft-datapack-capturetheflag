# Exit button in the 2x2 crafting grid (top-left slot), clicked with the cursor.
# Runs as a player every tick (freeze, end).
execute if entity @s[tag=ctf.exit_closed] run return run function ctf_inv:exit/after_close
execute unless items entity @s player.crafting.0 *[custom_data~{ctf_craft:{id:"exit"}}] run return run function ctf_inv:exit/changed
execute if score @s exit_confirm matches 1 unless items entity @s player.crafting.2 *[custom_data~{ctf_craft:{id:"yes"}}] run return run function ctf_inv:exit/changed
execute if score @s exit_confirm matches 1 unless items entity @s player.crafting.3 *[custom_data~{ctf_craft:{id:"no"}}] run return run function ctf_inv:exit/changed
