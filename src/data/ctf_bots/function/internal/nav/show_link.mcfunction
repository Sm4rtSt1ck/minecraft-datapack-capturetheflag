# As a link, at its first node: a line of dust to its node (ctf_bots:internal/nav/show_<kind>)
from registry:bots import NAV
scoreboard players operation #to nav = @s nav.to
execute as @e[type=marker, tag=nav_node, distance=(f"..{NAV['link_range'] + 1}")] if score @s nav.id = #to nav run tag @s add nav_see
scoreboard players set #step nav 0
for _t in range(1, 9):
    execute if score @s nav.t matches (_t) positioned ~ ~0.2 ~ facing entity @n[type=marker, tag=nav_see] feet positioned ^ ^ ^0.4 run function f"ctf_bots:internal/nav/show_{_t}"
tag @e[type=marker, tag=nav_see] remove nav_see
