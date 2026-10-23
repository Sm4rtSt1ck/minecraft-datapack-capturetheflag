execute store result score #need loot.tmp run data get storage ctf_loot:config kills_total.count
execute unless score @s loot.ktotal >= #need loot.tmp run return 0
tag @s add loot.k10
function ctf_loot:task_force {id: "kills_total"}
