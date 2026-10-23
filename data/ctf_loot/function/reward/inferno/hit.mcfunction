# Advancement reward: the player hit something with the Inferno blade
advancement revoke @s only ctf_loot:inferno_hit
execute unless score game state = round state unless score game state = end_round state run return 0
execute if score @s loot.cd matches 1.. run return 0
scoreboard players set @s loot.cd 160
tag @s add loot.inferno_user
execute positioned ^ ^ ^1.5 run function ctf_loot:reward/inferno/slam
tag @s remove loot.inferno_user
