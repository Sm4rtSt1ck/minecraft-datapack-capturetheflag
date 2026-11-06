# A walk test, positioned at the feet on the way, rotated (horizontally) to the node tagged nav_b:
# reached (within 0.8) -> ctf_bots:internal/nav/walk_ok; else half a block further
# (ctf_bots:internal/nav/walk_at); too many steps: no way
scoreboard players add #steps nav 1
execute if score #steps nav > #smax nav run return 0
execute if entity @e[type=marker, tag=nav_b, distance=..0.8] run return run function ctf_bots:internal/nav/walk_ok
execute positioned ^ ^ ^0.5 run function ctf_bots:internal/nav/walk_at
