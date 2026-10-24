# Nothing on the cursor -> the inventory was closed (or shift-click).
# On close the game moves the grid into the inventory and sends those slots to the
# client directly, bypassing the normal sync. If we fixed it in the same tick, the
# client would never get the update and would show a ghost bed. So the fix waits
# one tick: the server syncs the moved items first (ctf_inv:exit/after_close).
execute unless items entity @s player.cursor *[custom_data~{ctf_craft:{}}] run return run tag @s add ctf.exit_closed

# The button taken with the cursor is the click
execute if items entity @s player.cursor *[custom_data~{ctf_craft:{id:"yes"}}] run return run function ctf_inv:exit/yes
execute if items entity @s player.cursor *[custom_data~{ctf_craft:{id:"no"}}] run scoreboard players set @s exit_confirm 0
execute if items entity @s player.cursor *[custom_data~{ctf_craft:{id:"exit"}}] run scoreboard players set @s exit_confirm 1

# The player's own items put into the grid go back to the inventory
execute at @s run function ctf_inv:exit/evacuate

function ctf_inv:exit/render
tag @s add ctf.inv_dirty
