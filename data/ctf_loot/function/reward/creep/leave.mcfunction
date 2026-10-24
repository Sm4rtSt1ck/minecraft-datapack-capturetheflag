# Runs as a player in a creeper who leaves the match: his creeper is removed
scoreboard players operation #me loot.tmp = @s player_id
execute as @e[type=creeper, tag=loot.creeper] if score @s loot.cown = #me loot.tmp run function ctf_loot:reward/creep/remove
function ctf_loot:reward/creep/end
