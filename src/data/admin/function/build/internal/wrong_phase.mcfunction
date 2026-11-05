# The map building tools (admin:build) work only out of a match (game state lobby): a warning
tellraw @s {"text": "Map building works only in the lobby (no match is running)", "color": "red"}
return fail
