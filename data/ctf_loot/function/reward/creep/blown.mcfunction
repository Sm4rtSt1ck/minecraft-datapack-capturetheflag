# The creeper blew up (the player is where it was: a spectator moves with his camera)
scoreboard players reset #owner kc.tmp
execute if score @s loot.cby matches -2147483648.. run scoreboard players operation #owner kc.tmp = @s loot.cby
function ctf_loot:reward/creep/die {src: 5}
