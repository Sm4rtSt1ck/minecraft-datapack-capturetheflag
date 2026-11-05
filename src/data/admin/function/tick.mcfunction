# #ctf:tick/global, only out of a match (game state lobby): the map building tools (admin:build)
execute unless score game state = lobby state run return 0

# A player has used a bat spawn egg (maybe a build marker)
execute as @a[scores={build.place=1..}] run function admin:build/internal/placed
# A player has placed a barrier (maybe a solid item of admin:build/solid/get)
execute as @a[scores={build.solid=1..}] at @s run function admin:build/solid/internal/placed
