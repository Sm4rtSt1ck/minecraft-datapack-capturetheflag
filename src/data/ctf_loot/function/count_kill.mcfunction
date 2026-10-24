# Kills of the round (also grenade / trap kills, ctf_fight:internal/credit/award) -> the "kills" task
scoreboard players add @s loot.kills 1
execute store result score #need loot.tmp run data get storage ctf_loot:config kills.count
execute if score @s loot.kills < #need loot.tmp run return 0
execute store result score #min loot.tmp run data get storage ctf_loot:config kills.min_enemies
execute store result score #enemies loot.tmp if entity @a[tag=defense, tag=player]
execute if score #enemies loot.tmp < #min loot.tmp run return 0
function ctf_loot:task {id: "kills"}
