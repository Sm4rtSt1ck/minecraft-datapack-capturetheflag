# Runs as the shooter
clear @s bow[custom_data~{wpn: "creep"}]
clear @s *[custom_data~{ammo: "creep"}]
scoreboard players operation @a[tag=loot.creep_victim, limit=1] loot.cby = @s player_id
title @s actionbar {"text": "Creepenator: hit!", "color": "green"}
