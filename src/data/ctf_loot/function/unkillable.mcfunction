# Runs every tick in round / end_round (ctf_loot:tick/combat) as an alive attacker who hasn't got it yet
execute store result score #need loot.tmp run data get storage ctf_loot:config unkillable.damage
execute unless score @s loot.dmg > #need loot.tmp run return 0
tag @s add loot.unkill
function ctf_loot:task {id: "unkillable"}
