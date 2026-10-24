# One tick after the inventory was closed: remove the moved buttons and draw them again
tag @s remove ctf.exit_closed
scoreboard players set @s exit_confirm 0
execute at @s run function ctf_inv:exit/evacuate
function ctf_inv:exit/render
tag @s add ctf.inv_dirty
