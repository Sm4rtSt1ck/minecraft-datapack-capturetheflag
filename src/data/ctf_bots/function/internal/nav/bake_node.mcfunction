# As a node A, at it: its links to the nodes within NAV "link_range" (ctf_bots:internal/nav/bake_pair)
from registry:bots import NAV
tag @s remove nav_todo
tag @s add nav_a
execute as @e[type=marker, tag=nav_node, tag=!nav_a, distance=(f"..{NAV['link_range']}")] run function ctf_bots:internal/nav/bake_pair
tag @s remove nav_a
