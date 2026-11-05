# MAP BUILDING: removes every build marker (admin:build/get_tools) of the loaded chunks
# Only in the lobby
execute unless score game state = lobby state run return run function admin:build/internal/wrong_phase

execute store result score #n solid.tmp if entity @e[type=armor_stand, tag=build_marker]
kill @e[type=armor_stand, tag=build_marker]
tellraw @s [{"text": "Build markers removed: ", "color": "yellow"}, {"score": {"name": "#n", "objective": "solid.tmp"}}]
