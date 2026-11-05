# One block of the row: #k blocks left
function admin:build/solid/internal/block
scoreboard players remove #k solid.tmp 1
execute if score #k solid.tmp matches 1.. positioned ~ ~ ~1 run function admin:build/solid/internal/z
