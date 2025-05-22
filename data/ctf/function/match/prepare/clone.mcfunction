say match/prepare/clone

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

kill @e[tag=map_entity]
execute if score result map_vote matches 1 run function ctf:match/maps/test_map/clone
execute if score result map_vote matches 2 run function ctf:match/maps/green_mine/clone
execute if score result map_vote matches 3 run function ctf:match/maps/night_club/clone

execute positioned as @e[tag=clone_marker] run forceload remove ~ ~ ~127 ~127

kill @e[type=item, tag=!map_entity]
kill @e[tag=clone_marker]
