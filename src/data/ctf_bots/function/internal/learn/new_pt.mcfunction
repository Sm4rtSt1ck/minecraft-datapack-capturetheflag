# As a player / bot on the ground with no point within LEARN "spacing": a new trail point here (the block
# center; a node of the graph in a match with bots, used after the next bake: #lrn_new)
execute align xz positioned ~0.5 ~ ~0.5 run summon marker ~ ~ ~ {Tags: ["lrn_pt", "lrn_learned", "map_entity", "lrn_cur"]}
execute if score team bots matches 1.. run tag @e[type=marker, tag=lrn_cur] add bot_nav
scoreboard players operation @e[type=marker, tag=lrn_cur] lrn.id = #next lrn
scoreboard players add #next lrn 1
scoreboard players add #npts lrn 1
scoreboard players set #lrn_new lrn 1
tag @e[type=marker, tag=lrn_cur] remove lrn_cur
