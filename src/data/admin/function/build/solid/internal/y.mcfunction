# One row of the x layer: #j rows left
scoreboard players operation #k solid.tmp = #sz solid.tmp
function admin:build/solid/internal/z
scoreboard players remove #j solid.tmp 1
execute if score #j solid.tmp matches 1.. positioned ~ ~1 ~ run function admin:build/solid/internal/y
