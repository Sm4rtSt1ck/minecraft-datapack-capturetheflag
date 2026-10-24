$scoreboard players add @s ultimate $(points)
execute if score @s ultimate >= max ultimate run scoreboard players operation @s ultimate = max ultimate
function ctf_ult:internal/render
