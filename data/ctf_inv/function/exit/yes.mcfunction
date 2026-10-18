scoreboard players set @s exit_confirm 0
clear @s *[custom_data~{ctf_craft:{}}]
execute at @s run playsound minecraft:ui.button.click master @s ~ ~ ~ 0.2
function ctf:lobby/join
