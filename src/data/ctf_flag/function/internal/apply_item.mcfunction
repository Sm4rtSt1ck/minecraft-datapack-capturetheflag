# Runs as an item entity: sets the flag patterns on its item
execute unless data storage ctf:flag patterns run function ctf_flag:config
data modify entity @s Item.components."minecraft:banner_patterns" set from storage ctf:flag patterns
tag @s remove ctf.flag_new
