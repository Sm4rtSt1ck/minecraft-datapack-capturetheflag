# #ctf:on/map_cloned (the map is cloned into the arena, the bot markers copied): the links of the
# navigation graph are found again (ctf_bots:internal/nav/bake_start). Only in a match with bots
execute unless score team bots matches 1.. run return 0
function ctf_bots:internal/nav/bake_start
