# As a player: the navigation graph shown to him on / off (BOTS.md stage 8): every 10 ticks the links
# within 24 blocks of him as lines of dust from their first node (the color of the kind:
# ctf_bots:internal/nav/show_<kind>), the nodes as a flame. In a match: the graph of the arena; in the
# lobby (building): a graph of the template he stands at, built for the view (ctf_bots:internal/nav/
# lobby_build: its bot markers and what the bots learned on that map), removed when nobody views it
execute if entity @s[tag=nav_viewer] run tag @s add nav_off
tag @s[tag=nav_off] remove nav_viewer
execute if entity @s[tag=nav_off] if score game state = lobby state unless entity @a[tag=nav_viewer] run function ctf_bots:internal/nav/lobby_clear
execute if entity @s[tag=nav_off] run return run tag @s remove nav_off
tag @s add nav_viewer
execute if score game state = lobby state run return run function ctf_bots:internal/nav/lobby_build
function ctf_bots:internal/nav/show_count
schedule function ctf_bots:internal/nav/show_tick 1t
