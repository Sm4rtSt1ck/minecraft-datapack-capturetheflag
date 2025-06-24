function admin:log/function {name: "match/prepare/clone"}

#########################################
# LAYER 1

# Row 1
execute positioned as @n[tag=clone_marker] run clone ~ ~ ~ ~127 ~63 ~127 -200 -52 -200

#########################################
# CLONING FOR CURRENT MAP

# kill @e[tag=spawn_spot]
kill @e[tag=win_trigger]
kill @e[tag=map_entity]
kill @e[tag=flag]
kill @e[tag=trap]
function ctf:match/maps/call_current {function: "clone"}

#########################################
# OTHER

execute positioned as @e[tag=clone_marker] run forceload remove ~ ~ ~127 ~127

kill @e[type=item, tag=!map_entity]
function ctf:match/prepare/entity_clone/clone
kill @e[tag=clone_marker]

#########################################
# FUNCTIONS

execute if score game state = vote state run function ctf:match/warmup/start
execute if score game state matches 3..6 run function ctf:match/helpers/update_score_display
execute if score game state matches 3..6 run schedule function ctf:match/freeze/start 100t
