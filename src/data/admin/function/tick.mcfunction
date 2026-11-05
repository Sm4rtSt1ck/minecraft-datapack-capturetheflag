# #ctf:tick/global, only out of a match (game state lobby): the map building tools (admin:build)
execute unless score game state = lobby state run return 0

# A player has used a bat spawn egg (maybe a build marker)
execute as @a[scores={build.place=1..}] run function admin:build/internal/placed
# Only the bot markers of the held kind glow (admin:build/bots)
function admin:build/bots/internal/glow
# A player has placed a barrier (maybe a solid item of admin:build/solid/get)
execute as @a[scores={build.solid=1..}] at @s run function admin:build/solid/internal/placed
# A broken barrier takes its display with it (a barrier is broken only in creative; the "mined"
# statistic doesn't count creative, so the displays near creative players are checked)
execute as @a[gamemode=creative] at @s run function admin:build/solid/internal/broken
