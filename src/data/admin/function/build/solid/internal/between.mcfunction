# The area between the markers A and B: admin:build/solid/internal/run; the markers stay
execute unless entity @e[type=armor_stand, tag=build_a] run return run tellraw @s {"text": "No marker A (admin:build/get_tools)", "color": "red"}
execute unless entity @e[type=armor_stand, tag=build_b] run return run tellraw @s {"text": "No marker B (admin:build/get_tools)", "color": "red"}
# A marker stands on the bottom center of its block: x.5 y z.5, rounded down by run
data modify storage admin:build a.p set value []
data modify storage admin:build a.p append from entity @n[type=armor_stand, tag=build_a] Pos[0]
data modify storage admin:build a.p append from entity @n[type=armor_stand, tag=build_a] Pos[1]
data modify storage admin:build a.p append from entity @n[type=armor_stand, tag=build_a] Pos[2]
data modify storage admin:build a.p append from entity @n[type=armor_stand, tag=build_b] Pos[0]
data modify storage admin:build a.p append from entity @n[type=armor_stand, tag=build_b] Pos[1]
data modify storage admin:build a.p append from entity @n[type=armor_stand, tag=build_b] Pos[2]
function admin:build/solid/internal/run
