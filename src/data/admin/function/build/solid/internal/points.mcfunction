# #mode solid.tmp (1 place the block of storage admin:build state, 0 remove) at every point marker;
# the markers stay
execute store result score #n solid.tmp if entity @e[type=armor_stand, tag=build_point]
execute if score #n solid.tmp matches 0 run return run tellraw @s {"text": "No point markers (admin:build/get_tools)", "color": "red"}
execute if score #n solid.tmp matches 5001.. run return run tellraw @s [{"text": "Too many point markers: ", "color": "red"}, {"score": {"name": "#n", "objective": "solid.tmp"}}, {"text": " (max 5000)"}]
execute as @e[type=armor_stand, tag=build_point] at @s align xyz run function admin:build/solid/internal/block
execute if score #mode solid.tmp matches 1 run tellraw @s [{"text": "Unbreakable blocks placed: ", "color": "green"}, {"score": {"name": "#n", "objective": "solid.tmp"}}]
execute if score #mode solid.tmp matches 0 run tellraw @s [{"text": "Unbreakable blocks removed at ", "color": "yellow"}, {"score": {"name": "#n", "objective": "solid.tmp"}}, {"text": " points"}]
