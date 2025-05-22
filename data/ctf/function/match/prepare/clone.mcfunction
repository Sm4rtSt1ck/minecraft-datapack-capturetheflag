say match/prepare/clone

#########################################
# LAYER 1

# Row 1
execute positioned as @n[tag=clone_marker] run clone ~ ~ ~ ~31 ~31 ~31 -200 -52 -200
execute positioned as @n[tag=clone_marker] run clone ~32 ~ ~ ~63 ~31 ~31 -168 -52 -200
execute positioned as @n[tag=clone_marker] run clone ~64 ~ ~ ~95 ~31 ~31 -136 -52 -200
execute positioned as @n[tag=clone_marker] run clone ~96 ~ ~ ~127 ~31 ~31 -104 -52 -200
# Row 2
execute positioned as @n[tag=clone_marker] run clone ~ ~ ~32 ~31 ~31 ~63 -200 -52 -168
execute positioned as @n[tag=clone_marker] run clone ~32 ~ ~32 ~63 ~31 ~63 -168 -52 -168
execute positioned as @n[tag=clone_marker] run clone ~64 ~ ~32 ~95 ~31 ~63 -136 -52 -168
execute positioned as @n[tag=clone_marker] run clone ~96 ~ ~32 ~127 ~31 ~63 -104 -52 -168
# Row 3
execute positioned as @n[tag=clone_marker] run clone ~ ~ ~64 ~31 ~31 ~95 -200 -52 -136
execute positioned as @n[tag=clone_marker] run clone ~32 ~ ~64 ~63 ~31 ~95 -168 -52 -136
execute positioned as @n[tag=clone_marker] run clone ~64 ~ ~64 ~95 ~31 ~95 -136 -52 -136
execute positioned as @n[tag=clone_marker] run clone ~96 ~ ~64 ~127 ~31 ~95 -104 -52 -136
# Row 4
execute positioned as @n[tag=clone_marker] run clone ~ ~ ~96 ~31 ~31 ~127 -200 -52 -104
execute positioned as @n[tag=clone_marker] run clone ~32 ~ ~96 ~63 ~31 ~127 -168 -52 -104
execute positioned as @n[tag=clone_marker] run clone ~64 ~ ~96 ~95 ~31 ~127 -136 -52 -104
execute positioned as @n[tag=clone_marker] run clone ~96 ~ ~96 ~127 ~31 ~127 -104 -52 -104

#########################################
# LAYER 2

# Row 1
execute positioned as @n[tag=clone_marker] run clone ~ ~32 ~ ~31 ~63 ~31 -200 -20 -200
execute positioned as @n[tag=clone_marker] run clone ~32 ~32 ~ ~63 ~63 ~31 -168 -20 -200
execute positioned as @n[tag=clone_marker] run clone ~64 ~32 ~ ~95 ~63 ~31 -136 -20 -200
execute positioned as @n[tag=clone_marker] run clone ~96 ~32 ~ ~127 ~63 ~31 -104 -20 -200
# Row 2
execute positioned as @n[tag=clone_marker] run clone ~ ~32 ~32 ~31 ~63 ~63 -200 -20 -168
execute positioned as @n[tag=clone_marker] run clone ~32 ~32 ~32 ~63 ~63 ~63 -168 -20 -168
execute positioned as @n[tag=clone_marker] run clone ~64 ~32 ~32 ~95 ~63 ~63 -136 -20 -168
execute positioned as @n[tag=clone_marker] run clone ~96 ~32 ~32 ~127 ~63 ~63 -104 -20 -168
# Row 3
execute positioned as @n[tag=clone_marker] run clone ~ ~32 ~64 ~31 ~63 ~95 -200 -20 -136
execute positioned as @n[tag=clone_marker] run clone ~32 ~32 ~64 ~63 ~63 ~95 -168 -20 -136
execute positioned as @n[tag=clone_marker] run clone ~64 ~32 ~64 ~95 ~63 ~95 -136 -20 -136
execute positioned as @n[tag=clone_marker] run clone ~96 ~32 ~64 ~127 ~63 ~95 -104 -20 -136
# Row 4
execute positioned as @n[tag=clone_marker] run clone ~ ~32 ~96 ~31 ~63 ~127 -200 -20 -104
execute positioned as @n[tag=clone_marker] run clone ~32 ~32 ~96 ~63 ~63 ~127 -168 -20 -104
execute positioned as @n[tag=clone_marker] run clone ~64 ~32 ~96 ~95 ~63 ~127 -136 -20 -104
execute positioned as @n[tag=clone_marker] run clone ~96 ~32 ~96 ~127 ~63 ~127 -104 -20 -104

#########################################
# CLONING FOR CURRENT MAP

kill @e[tag=map_entity]
execute if score result map_vote matches 1 run function ctf:match/maps/test_map/clone
execute if score result map_vote matches 2 run function ctf:match/maps/green_mine/clone
execute if score result map_vote matches 3 run function ctf:match/maps/night_club/clone
execute if score result map_vote matches 4 run function ctf:match/maps/farm/clone

#########################################
# OTHER

execute positioned as @e[tag=clone_marker] run forceload remove ~ ~ ~127 ~127

kill @e[type=item, tag=!map_entity]
kill @e[tag=clone_marker]

#########################################
# FUNCTIONS

execute if score game state matches 1 run function ctf:match/warmup/start
execute if score game state matches 3..5 run function ctf:match/helpers/update_score_display
execute if score game state matches 3..5 run schedule function ctf:match/freeze/start 100t
