# One x layer: #i layers left
scoreboard players operation #j solid.tmp = #sy solid.tmp
function admin:build/solid/internal/y
scoreboard players remove #i solid.tmp 1
execute if score #i solid.tmp matches 1.. positioned ~1 ~ ~ run function admin:build/solid/internal/x
