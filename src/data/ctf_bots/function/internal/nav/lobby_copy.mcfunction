# As a bot marker of the template (lobby view): a node marker at it
summon marker ~ ~ ~ {Tags: ["bot_nav", "nav_tmp", "map_entity", "nav_new"]}
execute if entity @s[tag=build_bot_anvil] run tag @e[type=marker, tag=nav_new] add bot_anvil
tag @e[type=marker, tag=nav_new] remove nav_new
