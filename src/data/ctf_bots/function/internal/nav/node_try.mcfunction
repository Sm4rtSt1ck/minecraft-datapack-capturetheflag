# As a bot marker: a node of the graph. In the air: down to the floor within 3 blocks; none there:
# not a node (nav_air, red in the shown graph). A node already here: not a node either
scoreboard players set #dd nav 0
execute if block ~ ~-1 ~ #ctf_bots:gap run function ctf_bots:internal/nav/node_drop
execute if entity @s[tag=nav_air] run return 0
execute at @s if entity @e[type=marker, tag=nav_node, distance=..0.6] run return 0
tag @s add nav_node
tag @s add nav_todo
scoreboard players add #id nav 1
scoreboard players operation @s nav.id = #id nav
