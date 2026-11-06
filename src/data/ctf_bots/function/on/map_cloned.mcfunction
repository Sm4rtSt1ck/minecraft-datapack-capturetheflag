# #ctf:on/map_cloned (the map is cloned into the arena, the bot markers copied): what the bots learned on
# this map is loaded (learning on: ctf_bots:internal/learn/load, in every match); with bots the links of
# the navigation graph are found again (ctf_bots:internal/nav/bake_start)
scoreboard players set #map lrn 0
# No lobby view of the graph any more (its markers were map entities: gone with the clone)
scoreboard players set #lshow nav 0
execute if score Bots_learn settings matches 1 run function ctf_bots:internal/learn/load
execute unless score team bots matches 1.. run return 0
function ctf_bots:internal/nav/bake_start
