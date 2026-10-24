# Advancement reward: the player was hit by a Creepenator arrow
advancement revoke @s only ctf_loot:creep_hit
execute unless score game state = round state unless score game state = end_round state run return 0
execute unless entity @s[tag=player, gamemode=!spectator] run return 0
execute if entity @s[tag=loot.creep] run return 0

# The shooter loses the bow and the arrows left
tag @s add loot.creep_victim
scoreboard players reset @s loot.cby
execute on attacker if entity @s[type=player] run function ctf_loot:reward/creep/used
tag @s remove loot.creep_victim
execute at @s run function ctf_loot:reward/creep/start
