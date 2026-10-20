# Runs as an attacker: his crate, with the rarity of his best task. x, y, z
tag @s remove ctf.loot_pending
execute if score @s loot.best matches 1 run data modify storage ctf_loot:tmp p.rarity set value "common"
execute if score @s loot.best matches 2 run data modify storage ctf_loot:tmp p.rarity set value "rare"
execute if score @s loot.best matches 3 run data modify storage ctf_loot:tmp p.rarity set value "epic"
execute if score @s loot.best matches 4 run data modify storage ctf_loot:tmp p.rarity set value "legendary"
execute if score @s loot.best matches 5 run data modify storage ctf_loot:tmp p.rarity set value "mythic"
function ctf_loot:drop_for with storage ctf_loot:tmp p
