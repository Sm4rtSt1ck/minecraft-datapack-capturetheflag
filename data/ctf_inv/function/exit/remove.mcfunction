# Removes the exit button (round start)
scoreboard players set @s exit_confirm 0
tag @s remove ctf.exit_closed
clear @s *[custom_data~{ctf_craft:{}}]
