# Turns you into a creeper (Creepenator), as if you were hit by its arrow (any phase).
# You made the creeper yourself, so its explosion gives no kill reward
scoreboard players operation @s loot.cby = @s player_id
execute at @s run function ctf_loot:reward/creep/start
