# Runs every tick as a fire area (ctf_loot:items/tick)
scoreboard players remove @s loot.t 1
execute if score @s loot.t matches ..0 run return run function ctf_loot:reward/inferno/zone_end
# Kill credit for the burn (ctf_fight:internal/credit, source 4)
function ctf_fight:api/credit/owner
execute as @a[tag=player, gamemode=!spectator, distance=..3] run function ctf_fight:api/credit/mark {time: 100, src: 4}
